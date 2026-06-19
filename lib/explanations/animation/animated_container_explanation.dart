const String animatedContainerRnEquivalent = r'''
In React Native, to animate container properties (width, height, background color, border radius, padding, etc.), you have to define multiple animated values and drive them in tandem, or use layout animations which can be tricky to configure:

```jsx
// React Native:
import React, { useRef } from 'react';
import { Animated, View, Button } from 'react-native';

const AnimatedContainerExample = () => {
  const widthAnim = useRef(new Animated.Value(100)).current;
  const radiusAnim = useRef(new Animated.Value(8)).current;

  const triggerAnimation = () => {
    Animated.parallel([
      Animated.timing(widthAnim, { toValue: 200, duration: 500, useNativeDriver: false }),
      Animated.timing(radiusAnim, { toValue: 50, duration: 500, useNativeDriver: false }),
    ]).start();
  };

  return (
    <View>
      <Animated.View style={{
        width: widthAnim,
        height: 100,
        borderRadius: radiusAnim,
        backgroundColor: 'pink',
      }} />
      <Button title="Animate" onPress={triggerAnimation} />
    </View>
  );
};
```

In Flutter, **`AnimatedContainer`** makes this trivial. It operates exactly like a standard `Container`, but automatically animates any changes to its layout properties (like `width`, `height`, `decoration` / `color`, `padding`, `margin`, `alignment`, etc.) when they change on a widget rebuild. You only need to supply a `duration` and `curve`.
''';
