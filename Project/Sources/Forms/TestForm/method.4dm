

var $eventCode : Integer
$eventCode:=Form event code:C388
Case of 
	: ($eventCode=On Load:K2:1)
		
		Form:C1466.instance:=cs:C1710.TestForm.new()
		
	: ($eventCode=On Resize:K2:27)
		Form:C1466.instance.resize()
		
	Else 
		
End case 