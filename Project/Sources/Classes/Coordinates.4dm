Class constructor($left : Integer; $top : Integer; $right : Integer; $bottom : Integer)
	This:C1470.left:=$left
	This:C1470.top:=$top
	This:C1470.right:=$right
	This:C1470.bottom:=$bottom
	
Function size()->$size : cs:C1710.Size
	$size:=cs:C1710.Size.new(This:C1470.bottom-This:C1470.top; This:C1470.right-This:C1470.left)
	
	
Function withHeight($height : Integer)->$coordinates : cs:C1710.Coordinates
	$coordinates:=cs:C1710.Coordinates.new(This:C1470.left; This:C1470.top; This:C1470.right; This:C1470.top+$height)