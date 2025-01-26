extends Node2D

signal level_complete()

@onready var _ink_player: InkPlayer = $InkPlayer

var interactables: Array[Interactable] = []
var last_interactable: Interactable
var choice_cache: Array[InkChoice] = []
var story_ready: bool

func _ready():
	_ink_player.connect("loaded", _story_loaded)
	_ink_player.create_story()

func _process(delta: float):
	if story_ready:
		for flow in _ink_player.alive_flow_names:
			_ink_player.switch_flow(flow)
			_run_flow()
		_ink_player.switch_to_default_flow()

	
func _story_loaded(successfully: bool):
	if !successfully:
		return
	story_ready = true
	_continue_story()

func _clear_choices():
	for ib in interactables:
		if ib.is_connected("interacted", interactable_clicked):
			ib.disconnect("interacted", interactable_clicked)
	
func _populate_choices(_choices: Array):
	_clear_choices()
	var ibs = find_children("_IB*")
	for ib in ibs:
		if ib is Interactable:
			interactables.append(ib)
	for choice in _choices:
		if choice is InkChoice:
			for ib in interactables:
				if choice.tags.has(ib.interactable_name):
					choice_cache.append(choice)
					ib.receive_text(choice.text)
					if !ib.is_connected("interacted", interactable_clicked):
						ib.connect("interacted", interactable_clicked)

func _continue_story():
	if !_ink_player.current_flow_is_default_flow:
		_ink_player.switch_to_default_flow()
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()
		await _parse_tags(text)
	if _ink_player.has_choices:
		_populate_choices(_ink_player.current_choices)
	else:
		emit_signal("level_complete")

func _run_flow():
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()
		await _parse_tags(text)
			
func _parse_tags(text: String):
	var character: Node2D
	var bubble: Node2D
	var timeout: float = 0.0
	for tag in _ink_player.current_tags:
		if tag.begins_with("NAME"):
			character = find_name(tag)
		if tag.begins_with("ANIM"):
			if last_interactable != null:
				await play_anim(last_interactable, tag)
		if tag.begins_with("BUB"):
			bubble = find_bubble(character, tag)
		if tag.begins_with("TIME"):
			timeout = float(tag.split("-")[1])
		if tag.begins_with("CLEAR"):
			clear_bubble(tag)
		if tag.begins_with("FLOW"):
			start_flow(tag)
	if bubble != null:
		bubble.show()
		bubble.find_child("Text").text = text
	if timeout > 0:
		#this is a hack to pause execution
		var pointer = _ink_player._story.state.get_current_pointer()
		_ink_player._story.state.set_current_pointer(InkPointer.new())
		await get_tree().create_timer(timeout).timeout
		_ink_player._story.state.set_current_pointer(pointer)

func clear_bubble(tag: String):
	var tags = tag.split("-")[1].split("_")
	var character = find_child(tags[0])
	var bubble = character.find_child(tags[1])
	bubble.hide()
		
func interactable_clicked(interactable: Interactable):
	last_interactable = interactable
	for choice in _ink_player.current_choices:
		if choice.tags.has(interactable.interactable_name):
			_ink_player.choose_choice_index(choice.index)
	_continue_story()

func find_name(node_name: String) -> Node2D:
	return find_child(node_name.split("-")[1])

func play_anim(node: Node2D, anim: String) -> AnimationPlayer:
	var player = node.find_child("AnimationPlayer")
	var anim_tags = anim.split("-")
	if anim_tags[1] == "WAIT":
		player.play(anim.split("-")[2])
		await player.animation_finished
	else:
		player.play(anim.split("-")[1])
	return player

func find_bubble(character: Node2D, node_name: String) -> Node2D:
	if character == null:
		return null
	return character.find_child(node_name.split("-")[1])

func start_flow(tag: String):
	var flow_name = tag.split("-")[1]
	_ink_player.switch_flow(flow_name)
	_ink_player.choose_path(flow_name)
	_ink_player.switch_to_default_flow()
	
