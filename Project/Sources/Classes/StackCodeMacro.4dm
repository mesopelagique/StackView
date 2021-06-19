
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
			
			var $code : Text
			$code:="This[\""+$groupId+"\"]:=cs.Stack.new("
			$code:=$code+"\""+$groupElements.join("\"; \"")+"\""
			$code:=$code+")"
			
			SET TEXT TO PASTEBOARD:C523($code)
			
		Else 
			ALERT:C41("You must select a group")
		End if 
		
	End if 