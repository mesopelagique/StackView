

var $eventCode : Integer
$eventCode:=Form event code:C388
Case of 
	: ($eventCode=On Validate:K2:3)
		Form:C1466.instance.resize()
	: ($eventCode=On Data Change:K2:15)
		Form:C1466.instance.resize()
	Else 
		
End case 



