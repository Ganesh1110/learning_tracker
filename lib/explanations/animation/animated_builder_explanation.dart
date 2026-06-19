const String animatedBuilderRnEquivalent = r'''
In React Native, custom animations (like rotation, scaling, or color transformations) are declared using animated values, which are interpolated and assigned inside dynamic styles:

```jsx
// React Native:
import React, { useRef, useEffect } from 'react';
import { Animated, Easing } from 'react-native';

const SpinWidget = () => {
  const spinAnim = useRef(new Animated.Value(0)).current;

  useEffect(() => {
    Animated.loop(
      Animated.timing(spinAnim, {
        toValue: 1,
        duration: 3000,
        easing: Easing.linear,
        useNativeDriver: true,
      })
    ).start();
  }, []);

  const spin = spinAnim.interpolate({
    inputRange: [0, 1],
    outputRange: ['0deg', '360deg'],
  });

  return (
    <Animated.View style={{ transform: [{ rotate: spin }] }}>
      <View style={{ width: 100, height: 100, backgroundColor: 'blue' }} />
    </Animated.View>
  );
};
```

In Flutter, **`AnimatedBuilder`** is used to rebuild only the animated parts of your widget hierarchy. 
It requires:
1. An `Animation` or `Listenable` object (the driver).
2. A `builder` function that describes how to transform the layout on each frame.
3. An optional pre-built `child` widget. 

### Performance optimization:
The pre-built `child` argument is passed into the `builder` callback. Because the static parts of the subtree are created outside the builder and passed in, Flutter **does not rebuild them** on every frame. Only the layout transformations (e.g. `Transform.rotate` or `Transform.scale`) are executed, ensuring 60fps/120fps performance.
''';
