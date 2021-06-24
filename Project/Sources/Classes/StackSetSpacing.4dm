
Class constructor($conf : Object)
	
	This:C1470.axis:=$conf.axis
	
Function onInvoke($editor : Object)->$result : Object
	
	If ($editor.editor.currentSelection.length=0)
		ALERT:C41("No element selected")
	Else 
		
		var $groupElements; $col : Collection
		$groupElements:=$editor.editor.form.editor.groups[$editor.editor.currentSelection[0]]
		If ($groupElements#Null:C1517)
			
			If ($groupElements.length>0)
				var $spacing : Text
				$spacing:=Request:C163("Enter spacing")
				If ($editor.editor.currentPage.objects[$groupElements[0]].userInfo=Null:C1517)
					$editor.editor.currentPage.objects[$groupElements[0]].userInfo:=New object:C1471
				End if 
				$editor.editor.currentPage.objects[$groupElements[0]].userInfo.spacing:=Num:C11($spacing)
				
				// Notify to 4D the modification
				$result:=New object:C1471("currentPage"; $editor.editor.currentPage)
			End if 
			
		Else 
			ALERT:C41("You must select a group")
		End if 
		
	End if 