# Button Widget

A custom Flutter button widget that provides two different styling options: gradient and solid color.

## Features

- **Stateless Widget**: The button is implemented as a `StatelessWidget`, making it lightweight and immutable.
- **Two Button Types**:
  - `Button.solid`: Creates a button with a solid background color
  - `Button.gradient`: Creates a button with a gradient background

## Implementation

The widget uses named constructors (`Button.solid` and `Button.gradient`) to create different button variants. In the `build` method, the widget conditionally applies either a gradient or solid color based on whether both `from` and `to` color parameters are provided.

## Current Limitations

The current implementation has some drawbacks:

- **Unnecessary constructor parameters**: Both constructors accept all parameters (`from`, `to`, `solidColor`), even when not required for the specific button type. This creates a messy API where developers must provide unused parameters.
- **Code complexity**: Mixing two different button types in a single widget adds conditional logic that could be simplified.

## Future Improvements

In the future, this widget should be refactored into two separate widgets (`SolidButton` and `GradientButton`) to provide a cleaner API, improve type safety, and eliminate unnecessary parameters.
