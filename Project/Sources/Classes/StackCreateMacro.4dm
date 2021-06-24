
Class constructor($conf : Object)
	This:C1470.axis:=$conf.axis
	
Function onInvoke($editor : Object)->$result : Object
	var $groupName; $name : Text
	//$groupName:=Request("name?")
	$groupName:="Group"
	
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
	
	var $mouseX; $mouseY : Real
	var $mouseB : Integer
	GET MOUSE:C468($mouseX; $mouseY; $mouseB)  // seems to not correct on my macos
	
	var $rectangle : Object
	$rectangle:=New object:C1471("type"; "rectangle"; \
		"class"; ""; \
		"fill"; "transparent"; \
		"width"; 120; \
		"height"; 120; \
		"visibility"; "hidden"; \
		"top"; Int:C8($mouseY/2); \
		"left"; Int:C8($mouseX/2); \
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
	
	cs:C1710.Stack.new($col).perform(New object:C1471("axis"; This:C1470.axis; "spacing"; 0))
	
	// Select the new button in the form editor
	$editor.editor.currentSelection.clear()  //unselect elements
	$editor.editor.currentSelection.push($groupName)  // XXX if group could selectionned, remove "Rectangle"
	
	// Notify the modification to the 4D Form editor
	$result:=New object:C1471("currentSelection"; $editor.editor.currentSelection; \
		"currentPage"; $editor.editor.currentPage; "editor"; New object:C1471("groups"; $editor.editor.form.editor.groups))