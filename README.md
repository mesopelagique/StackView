# StackView

 Stack layout experimentation with form objects

![Screencast](Screencast.gif)

## In form editor

Create a rectangle for the stack, then group it with some form objects.

> Rectangle must be under other objects and first in group

## In code

Init the stack and keep it somewhere

```4d
	This.stack:=cs.Stack.new("Rectangle"; "Button"; "Input"; "Text"; "Button2")
```
> The first element must be the rectangle

then in `On Load` and `On Resize` call `perform` to move objects according to wanted options

```4d
	This.stack.perform(New object("spacing"; 20; "axis"; "vertical")) // could be horizontal
 ```

## Form macros

to help there is two macros

### stack: align vertically & horizontally

you could in macro menu apply horizontal or vertical stack alignment to selected group

#### stack: set spacing

Before applying alignment you could register the spacing.

> this will register custom json key in Form in first element of group, the rectangle

### stack: generate new code

it generate the code to init a `cs.Stack` with all selected group elements.
