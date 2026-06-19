const String alignTransitionRnEquivalent = r'''
In React Native, to have full playback control (pause, resume, loop, reverse) over a layout or alignment animation, you use an explicit `Animated.Value` or `Animated.ValueXY` driven by animations such as `Animated.loop` or `Animated.sequence`:

```jsx
// React Native:
import React, { useRef } from 'react';
import { Animated, View, Button } from 'react-native';

const ExplicitAlignExample = () => {
  const anim = useRef(new Animated.Value(0)).current;

  const startAnim = () => {
    Animated.loop(
      Animated.sequence([
        Animated.timing(anim, { toValue: 1, duration: 1000, useNativeDriver: false }),
        Animated.timing(anim, { toValue: 0, duration: 1000, useNativeDriver: false }),
      ])
    ).start();
  };

  const left = anim.interpolate({ inputRange: [0, 1], outputRange: [0, 150] });

  return (
    <View>
      <Animated.View style={{ position: 'absolute', left }} />
      <Button title="Loop Animation" onPress={startAnim} />
    </View>
  );
};
```

In Flutter, **`AlignTransition`** is an **explicit transition widget**. 
Unlike implicit widgets (like `AnimatedAlign` which animate automatically on value updates), explicit transition widgets require an `AnimationController` and an `Animation` object (e.g. `Animation<AlignmentGeometry>`). 

This provides full control over the animation lifecycle:
- Starting, stopping, pausing, reversing.
- Looping (`repeat()`) or bouncing back and forth (`repeat(reverse: true)`).
- Chaining multiple curves or timing sequences together.
''';
