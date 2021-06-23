Class constructor
	
	This:C1470.stack:=cs:C1710.Stack.new("Rectangle"; "Button"; "Input"; "Text"; "Button2"; "Text1")
	This:C1470.stack2:=cs:C1710.Stack.new("Group Box"; "Text2"; "Button1"; "Input1"; "Button3")
	
	This:C1470["Group2"]:=cs:C1710.Stack.new("Rectangle1"; "Button4"; "Input2")
	
	This:C1470["Group3"]:=cs:C1710.Stack.new("Rectangle2"; "Button6"; "Input3")
	This:C1470["Group2"].elements.push(This:C1470["Group3"])
	
	
	This:C1470.stack2.perform(New object:C1471("spacing"; 10; "axis"; "vertical"))
	
	This:C1470.axis:="vertical"
	This:C1470.spacing:=20
	
	This:C1470.resize()
	
Function resize
	This:C1470.stack.perform(New object:C1471("spacing"; This:C1470.spacing; "axis"; This:C1470.axis))
	This:C1470.stack2.perform(New object:C1471("spacing"; 20; "axis"; "vertical"))
	This:C1470.Group2.perform(New object:C1471("spacing"; 20; "axis"; "vertical"))
	This:C1470.Group3.perform(New object:C1471("spacing"; 20; "axis"; "horizontal"))
	
Function toggleAxis()
	This:C1470.axis:=Choose:C955(This:C1470.axis="horizontal"; "vertical"; "horizontal")
	This:C1470.resize()
	
Function shuffle()
	var $i; $j : Integer
	var $temp : Object
	For ($i; This:C1470.stack.elements.length-1; 0; -1)
		$j:=(Random:C100%This:C1470.stack.elements.length)
		$temp:=This:C1470.stack.elements[$i]
		This:C1470.stack.elements[$i]:=This:C1470.stack.elements[$j]
		This:C1470.stack.elements[$j]:=$temp
	End for 
	This:C1470.resize()