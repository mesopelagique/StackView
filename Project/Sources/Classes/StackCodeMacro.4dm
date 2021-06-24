
Class constructor($conf : Object)
	
	
Function onInvoke($editor : Object)->$result : Object
	
	If ($editor.editor.currentSelection.length=0)
		ALERT:C41("No element selected")
	Else 
		
		var $groupId : Text
		$groupId:=$editor.editor.currentSelection[0]
		var $groupElements; $col : Collection
		$groupElements:=$editor.editor.form.editor.groups[$groupId]
		If ($groupElements#Null:C1517)
			
			var $code; $axis; $spacing : Text
			$code:="This[\""+$groupId+"\"]:=cs.Stack.new("
			$code:=$code+"\""+$groupElements.join("\"; \"")+"\""
			$code:=$code+")"
			$code:=$code+"\n"
			
			$axis:="vertical"
			$spacing:="0"
			If ($groupElements.length>0)
				If ($editor.editor.currentPage.objects[$groupElements[0]].userInfo#Null:C1517)
					If ($editor.editor.currentPage.objects[$groupElements[0]].userInfo.spacing#Null:C1517)
						$spacing:=String:C10($editor.editor.currentPage.objects[$groupElements[0]].userInfo.spacing)
					End if 
					If ($editor.editor.currentPage.objects[$groupElements[0]].userInfo.axis#Null:C1517)
						$axis:=String:C10($editor.editor.currentPage.objects[$groupElements[0]].userInfo.axis)
					End if 
				End if 
			End if 
			$code:=$code+"This[\""+$groupId+"\"].perform(New object(\"axis\"; \""+$axis+"\"; \"spacing\"; \""+$spacing+"\"))"
			
			SET TEXT TO PASTEBOARD:C523($code)
			
		Else 
			ALERT:C41("You must select a group")
		End if 
		
	End if 