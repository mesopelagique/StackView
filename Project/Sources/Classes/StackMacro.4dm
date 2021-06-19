
Class constructor($conf : Object)
	
	This:C1470.axis:=$conf.axis
	
Function onInvoke($editor : Object)->$result : Object
	
	If ($editor.editor.currentSelection.length=0)
		ALERT:C41("No element selected")
	Else 
		
		var $groupElements; $col : Collection
		$groupElements:=$editor.editor.form.editor.groups[$editor.editor.currentSelection[0]]
		If ($groupElements#Null:C1517)
			
			$col:=New collection:C1472
			var $element : Text
			For each ($element; $groupElements)
				$col.push(cs:C1710.StackFormElement.new($editor.editor.currentPage.objects[$element]))
			End for each 
			
			// XXX find the element to put as reference for size as first in $col!!
			// because I cannot be sure about it when grouping object?
			
			cs:C1710.Stack.new($col).perform(New object:C1471("axis"; This:C1470.axis))
			
			// Notify to 4D the modification
			$result:=New object:C1471("currentPage"; $editor.editor.currentPage)
			
		Else 
			ALERT:C41("You must select a group")
		End if 
		
	End if 