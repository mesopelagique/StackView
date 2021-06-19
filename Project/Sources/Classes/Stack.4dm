
Class constructor($elements : Variant)
	
	C_VARIANT:C1683(${2})
	
	C_LONGINT:C283($i)
	C_TEXT:C284($t)
	
	Case of 
			
		: (Value type:C1509($elements)=Is collection:K8:32)
			
			This:C1470.elements:=New collection:C1472
			var $element : Variant
			For each ($element; $elements)
				Case of 
					: (Value type:C1509($element)=Is text:K8:3)
						
						This:C1470.elements.push(cs:C1710.StackRuntimeElement.new($element))
						
					: (Value type:C1509($element)=Is object:K8:27)
						This:C1470.elements.push($element)
						
				End case 
			End for each 
			
		: (Value type:C1509($elements)=Is object:K8:27)
			
			This:C1470.elements:=New collection:C1472
			
			For ($i; 1; Count parameters:C259; 1)
				
				This:C1470.elements.push(${$i})
				
			End for 
			
		: (Value type:C1509($elements)=Is text:K8:3)
			
			This:C1470.elements:=New collection:C1472
			
			
			For ($i; 1; Count parameters:C259; 1)
				
				For each ($t; Split string:C1554(${$i}; ","))
					
					This:C1470.elements.push(cs:C1710.StackRuntimeElement.new($t))
					
				End for each 
				
			End for 
		Else 
			
			This:C1470.elements:=New collection:C1472(New object:C1471)  // ASSERT
			
	End case 
	
	This:C1470.background:=This:C1470.elements[0]
	This:C1470.elements:=This:C1470.elements.slice(1)
	
Function getCoordinates
	var $0 : Object
	$0:=This:C1470.background.getCoordinates()
	
Function perform($options : Object)
	var $coordinates; $size : Object
	$coordinates:=This:C1470.getCoordinates()
	$size:=$coordinates.size()
	
	If ($options.axis=Null:C1517)
		$options.axis:="vertical"
	End if 
	If ($options.spacing=Null:C1517)
		$options.spacing:=0
	End if 
	
	var $exectedElementSize : Object
	// Case of 
	// : ($options.alignment = "fill")
	Case of 
		: ($options.axis="horizontal")
			$exectedElementSize:=cs:C1710.Size.new($size.height; $size.width/This:C1470.elements.length-((This:C1470.elements.length-1)*$options.spacing/This:C1470.elements.length))
		: ($options.axis="vertical")
			$exectedElementSize:=cs:C1710.Size.new($size.height/This:C1470.elements.length-((This:C1470.elements.length-1)*$options.spacing/This:C1470.elements.length); $size.width)
		Else 
			ASSERT:C1129(False:C215; "Unknown axis "+$options.axis)
	End case 
	// : ($options.alignment = "left")
	// : ($options.alignment = "right")
	//End case
	
	var $pos : Integer
	$pos:=0
	var $o : Object
	var $newCoordinates : Object
	For each ($o; This:C1470.elements)
		
		Case of 
			: ($options.axis="horizontal")
				
				$newCoordinates:=cs:C1710.Coordinates.new(\
					$coordinates.left+($pos*$exectedElementSize.width)+($options.spacing*$pos); \
					$coordinates.top; \
					$coordinates.left+(($pos+1)*$exectedElementSize.width)+($options.spacing*$pos); \
					$coordinates.bottom)
				
			: ($options.axis="vertical")
				
				$newCoordinates:=cs:C1710.Coordinates.new(\
					$coordinates.left; \
					$coordinates.top+($pos*$exectedElementSize.height)+($options.spacing*$pos); \
					$coordinates.left+$size.width/*$coordinates.right*/; \
					$coordinates.top+(($pos+1)*$exectedElementSize.height)+($options.spacing*$pos))
				
		End case 
		
		$o.setCoordinates($newCoordinates)
		
		$pos:=$pos+1
	End for each 
	