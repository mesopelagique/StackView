Class constructor($name : Text)
	If (Count parameters:C259>=1)
		This:C1470.name:=$name
	Else 
		This:C1470.name:=OBJECT Get name:C1087(Object current:K67:2)
	End if 
	OBJECT SET RESIZING OPTIONS:C1175(*; This:C1470.name; Resize horizontal grow:K42:8; Resize vertical grow:K42:11)
	
Function setCoordinates($coordinates : Object)
	If ($coordinates.right#Null:C1517)
		OBJECT SET COORDINATES:C1248(*; This:C1470.name; $coordinates.left; $coordinates.top; $coordinates.right; $coordinates.bottom)
	Else 
		OBJECT SET COORDINATES:C1248(*; This:C1470.name; $coordinates.left; $coordinates.top)
	End if 
	
Function getCoordinates()->$coordinates : Object
	var $bottom; $left; $right; $top : Integer
	OBJECT GET COORDINATES:C663(*; This:C1470.name; $left; $top; $right; $bottom)
	$coordinates:=New object:C1471(\
		"left"; $left; \
		"top"; $top; \
		"right"; $right; \
		"bottom"; $bottom)