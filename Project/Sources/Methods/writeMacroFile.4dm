//%attributes = {"invisible":true,"preemptive":"capable"}
var $macros : Object
$macros:=New object:C1471("macros"; New object:C1471(\
"stack: create"; New object:C1471("class"; "StackCreateMacro"); \
"stack: align vertically"; New object:C1471("class"; "StackMacro"; "axis"; "vertical"); \
"stack: align horizontally"; New object:C1471("class"; "StackMacro"; "axis"; "horizontal"); \
"stack: generate new code"; New object:C1471("class"; "StackCodeMacro"); \
"stack: set spacing"; New object:C1471("class"; "StackSetSpacing")))

Folder:C1567(fk database folder:K87:14).file("Project/Sources/FormMacros.json").setText(JSON Stringify:C1217($macros; *))