# StackView

 Stack layout experimentation with form objects inpired by [UIStackView](https://developer.apple.com/documentation/uikit/uistackview)

![Screencast](Screencast.gif)

## In form editor

Create a rectangle or maybe a groupbox for the stack background , then group it with some form objects.

> Rectangle must be under other objects so first in group

## In code

Init the stack and keep it somewhere (`Form`, class instance in `Form`, ...)

```4d
	Form.stack:=cs.Stack.new("Rectangle"; "Button"; "Input"; "Text"; "Button2")
```
> The first element must be the rectangle

then in `On Load` and `On Resize` call `perform` to move objects according to wanted options

```4d
	Form.stack.perform(New object("spacing"; 20; "axis"; "vertical")) // could be horizontal
 ```

## Form macros

to help there is some macros

### stack: align vertically & horizontally

you could in form macro menu apply horizontal or vertical stack alignment to the selected group

#### stack: set spacing

Before applying alignment you could register the spacing.

> this will register custom json key in Form in first element of group, the rectangle

### stack: generate new code

it generate the code to init a `cs.Stack` with all selected group elements.

## TODO

- [ ] some inner padding conf variable
- [ ] other distributions than `fill` one, for instance align the objects to the left instead of taking the full width
