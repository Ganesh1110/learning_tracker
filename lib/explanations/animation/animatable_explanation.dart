const String animatableRnEquivalent = r'''
In React Native, complex animations that scale, shift, and rotate concurrently rely on mapping a single driving animated value to multiple interpolated styles:

```jsx
// React Native:
import React, { useRef } from 'react';
import { Animated } from 'react-native';

const ChainedInterpolation = () => {
  const progress = useRef(new Animated.Value(0)).current;

  // Linear progress gets mapped to box width:
  const width = progress.interpolate({
    inputRange: [0, 1],
    outputRange: [50, 150],
  });

  // Re-interpolating width to control rotation:
  const rotate = width.interpolate({
    inputRange: [50, 150],
    outputRange: ['0deg', '360deg'],
  });

  return <Animated.View style={{ width, transform: [{ rotate }] }} />;
};
```

In Flutter, **`Animatable<T>`** is the abstract base class for any object that can translate an `Animation<double>` input (value between `0.0` and `1.0`) into a custom output type `T` (like `double`, `Color`, `Offset`, or `BorderRadius`).

All `Tween` subclasses are animatables.

### Chaining Animatables:
You can chain multiple animatables together using the **`chain()`** method. The most common use case is applying a custom animation curve directly to a value tween:

```dart
final Animatable<double> scaleTween = Tween<double>(begin: 0.5, end: 1.5)
    .chain(CurveTween(curve: Curves.elasticOut));
```

Calling `scaleTween.animate(controller)` returns an `Animation<double>` that evaluates the curve first and then applies the scale mapping, reducing nested builder steps.
''';
