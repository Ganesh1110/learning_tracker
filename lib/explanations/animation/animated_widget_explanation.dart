const String animatedWidgetRnEquivalent = r'''
In React Native, animating a value at 60fps (or 120fps) can cause severe performance issues if every animation tick forces the entire parent component (and its children) to re-render. To solve this, developers bind animated values directly to specialized helper components like `Animated.View`, `Animated.Text`, or custom components wrapped via `Animated.createAnimatedComponent()`. These components bypass React's standard virtual DOM reconciliation by updating style attributes directly on the native view.

```jsx
// React Native:
import React, { useEffect, useRef } from 'react';
import { Animated, View } from 'react-native';

// Custom spinning wheel using Animated.View
const PulsingCircle = ({ pulseVal }) => {
  const scale = pulseVal.interpolate({
    inputRange: [0, 1],
    outputRange: [0.8, 1.2],
  });

  // Only Animated.View binds and updates scale without re-rendering the parent:
  return (
    <Animated.View style={{
      width: 100,
      height: 100,
      borderRadius: 50,
      backgroundColor: 'salmon',
      transform: [{ scale }]
    }} />
  );
};
```

In Flutter, **`AnimatedWidget`** solves the same performance challenge. It is an abstract class that handles the lifecycle of listening to a `Listenable` (like an `Animation` or `ChangeNotifier`) and triggering rebuilds.

### How it Works:
1. **Subclassing**: You create a custom widget that extends `AnimatedWidget` and passes the `Listenable` to `super(listenable: animation)`.
2. **Auto-Rebuilding**: Whenever the animation notifies its listeners of a value change (on every frame), the `AnimatedWidget` automatically triggers its own `build` method.
3. **Rebuild Scope Isolation**: The parent widget containing the `AnimatedWidget` is **not** rebuilt on each frame. The animation-driven rebuilds are completely localized inside the `AnimatedWidget` subclass, preventing expensive layout recalculations across the rest of the widget tree.
''';
