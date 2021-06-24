
Class constructor($conf : Object)
	This:C1470.axis:=$conf.axis
	
Function onInvoke($editor : Object)->$result : Object
	var $groupName; $name : Text
	//$groupName:=Request("name?")
	$groupName:="Group"
	
	If ($editor.editor.form.editor.groups=Null:C1517)
		$editor.editor.form.editor.groups:=New object:C1471
	End if 
	
	var $max : Integer
	$max:=0
	For each ($name; $editor.editor.form.editor.groups)
		If (Position:C15($groupName; $name)=1)
			If (Num:C11($name)>$max)
				$max:=Num:C11($name)
			End if 
		End if 
	End for each 
	$groupName:=$groupName+String:C10($max+1)
	
	var $left; $top; $mouseB : Integer
	GET MOUSE:C468($left; $top; $mouseB)  // seems to not correct , seems to be according to screen, no form or window context here
	//CONVERT COORDINATES($left; $top; XY Current window; XY Screen)
	$left:=0
	$top:=0
	
	var $rectangle : Object
	$rectangle:=New object:C1471("type"; "rectangle"; \
		"class"; ""; \
		"fill"; "transparent"; \
		"width"; 120; \
		"height"; 120; \
		"visibility"; "hidden"; \
		"top"; $top; \
		"left"; $left; \
		"sizingX"; "grow"; "sizingY"; "grow"; \
		"strokeWidth"; 1; "strokeDashArray"; New collection:C1472(1; 1; 1; 1; 1; 1); "stroke"; "#da70d6")
	
	// Add rectangle in the current page
	$editor.editor.currentPage.objects[$groupName+"Rectangle"]:=$rectangle
	
	// Add group in the current page
	$editor.editor.form.editor.groups[$groupName]:=New collection:C1472($groupName+"Rectangle")
	$editor.editor.form.editor.groups[$groupName].combine($editor.editor.currentSelection)
	var $col : Collection
	$col:=New collection:C1472
	var $element : Text
	For each ($element; $editor.editor.form.editor.groups[$groupName])
		$col.push(cs:C1710.StackFormElement.new($editor.editor.currentPage.objects[$element]))
	End for each 
	If ($col.length>1)
		$col[0].setCoordinates(This:C1470.enclosingRec($col.slice(1)))
	End if 
	
	cs:C1710.Stack.new($col).perform(New object:C1471("axis"; This:C1470.axis; "spacing"; 0))
	
	// Select the new button in the form editor
	$editor.editor.currentSelection.clear()  //unselect elements
	$editor.editor.currentSelection.push($groupName)  // XXX if group could selectionned, remove "Rectangle"
	
	// Notify the modification to the 4D Form editor
	$result:=New object:C1471("currentSelection"; $editor.editor.currentSelection; \
		"currentPage"; $editor.editor.currentPage; "editor"; New object:C1471("groups"; $editor.editor.form.editor.groups))
	
	
	//════════════════════════════════════════════
	// Returns the coordinates of the rectangle enclosing the group.
Function enclosingRec($elements : Collection)->$coordinates : Object
	var $o; $element : Object
	For each ($element; $elements)
		
		$o:=$element.getCoordinates()
		If ($coordinates=Null:C1517)
			
			$coordinates:=$o
			
		Else 
			
			$coordinates.left:=Choose:C955($o.left<$coordinates.left; $o.left; $coordinates.left)
			$coordinates.top:=Choose:C955($o.top<$coordinates.top; $o.top; $coordinates.top)
			$coordinates.right:=Choose:C955($o.right>$coordinates.right; $o.right; $coordinates.right)
			$coordinates.bottom:=Choose:C955($o.bottom>$coordinates.bottom; $o.bottom; $coordinates.bottom)
			
		End if 
	End for each 