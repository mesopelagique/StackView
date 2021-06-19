Class constructor($formObject : Object)
	This:C1470.object:=$formObject
	This:C1470.hasChange:=False:C215
	
Function getCoordinates()->$coordinates : Object
	$coordinates:=New object:C1471(\
		"left"; This:C1470.object.left; \
		"right"; This:C1470.object.left+This:C1470.object.width; \
		"top"; This:C1470.object.top; \
		"bottom"; This:C1470.object.top+This:C1470.object.height)
	
Function setCoordinates($coordinates : Object)
	This:C1470.object.left:=$coordinates.left
	This:C1470.object.top:=$coordinates.top
	This:C1470.object.width:=$coordinates.right-$coordinates.left
	This:C1470.object.height:=$coordinates.bottom-$coordinates.top
	This:C1470.hasChange:=True:C214