-> farmers_market
== farmers_market
#FLOW-corn_seller
->farmers_market

== corn_seller
    #TIME-5
    #NAME-CornSeller #BUB-Speech
    Corn!
    
    #TIME-3
    #NAME-CornSeller #BUB-Speech
    Get your corn here!
    
    #CLEAR-CornSeller_Speech
    #TIME-4
    
    -> corn_seller

#FLOW-argument

== argument
    #TIME-2
    #NAME-CabbageFan #BUB-Speech
    Hey honey.
    
    #TIME-2
    #NAME-CabbageHater #BUB-Speech
    No, Carl. 
    
    #CLEAR-CabbageFan_Speech #CLEAR-CabbageHater_Speech
    #TIME-3
    #NAME-CabbageFan #BUB-Speech
    Why not?
    
    #CLEAR-CabbageFan_Speech
    #TIME-2
    #NAME-CabbageHater #BUB-Speech
    You know I don't like cabbage.
     
    #TIME-3
    #CLEAR-CabbageHater_Speech
    #NAME-CabbageFan #BUB-Speech
    How about cole slaw?
    
    #TIME-3
    #CLEAR-CabbageFan_Speech
    #NAME-CabbageHater #BUB-Speech
    That's still cabbage.
    
    #CLEAR-CabbageHater_Speech
    #TIME-3
    #NAME-CabbageFan #BUB-Speech
    ...
    
    #TIME-3
    #NAME-CabbageHater #BUB-Speech
    ...
    
    #CLEAR-CabbageFan_Speech #CLEAR-CabbageHater_Speech
    -> argument

 -> END
 