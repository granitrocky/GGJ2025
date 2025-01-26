

-> apple_a_day

== apple_a_day
Start
    *   {!apple_fall} [Click the apple # Apple] -> apple_fall
    *   {apple_fall} [fence # Fence ] -> start_dialogue("dialogue_between_two_friends")
    *   {apple_fall} [basket # Basket ] -> basket_click

-> apple_a_day

== apple_fall
#ANIM-WAIT-apple_fall
#NAME-Character1 #BUB-Speech
Ouch!  

-> apple_a_day

== start_dialogue(dialogue)
#FLOW-{dialogue}
-> apple_a_day

== dialogue_between_two_friends

#TIME-3
#NAME-Character1 #BUB-Speech
Why is this taking so long? 

#TIME-4
#CLEAR-Character1_Speech
#NAME-Character2 #BUB-Speech
Typing takes time

#TIME-3
#CLEAR-Character2_Speech
#NAME-Character1 #BUB-Speech
I'm aware of that, but we don't have much more to say.

#TIME-4
#CLEAR-Character1_Speech
#NAME-Character2 #BUB-Speech
I guess we'll have to go around again

#CLEAR-Character2_Speech

 -> dialogue_between_two_friends

== basket_click

#TIME-3
#NAME-Character3 #BUB-Speech
Have I horribly overengineered this?

#TIME-3
#NAME-Character3 #BUB-Speech
Most Likely

->DONE
