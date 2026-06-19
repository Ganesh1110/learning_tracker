const String animatedAlignRnEquivalent = r'''
In React Native, animating a component's position requires manually managing animated values (via `Animated.ValueXY` or Reanimated's `useSharedValue`), triggering animations explicitly, and binding them to styled transforms.

```jsx
// React Native (using Animated API):
import React, { useRef } from 'react';
import { Animated, View, Button } from 'react-native';

const AnimatedAlignExample = () => {
  const anim = useRef(new Animated.ValueXY({ x: 0, y: 0 })).current;

  const moveToCorner = () => {
    Animated.timing(anim, {
      toValue: { x: 200, y: 300 },
      duration: 1000,
      useNativeDriver: true,
    }).start();
  };

  return (
    <View style={{ flex: 1 }}>
      <Animated.View style={anim.getTranslateTransform()}>
        <View style={{ width: 50, height: 50, backgroundColor: 'purple' }} />
      </Animated.View>
      <Button title="Move" onPress={moveToCorner} />
    </View>
  );
};
```

In Flutter, **`AnimatedAlign`** is an **implicit animation widget**. Rather than coding the animation driver manually, you simply supply a target `alignment` and a `duration`. When the target alignment changes and the widget rebuilds, Flutter handles the interpolation and transition automatically under the hood.
''';
