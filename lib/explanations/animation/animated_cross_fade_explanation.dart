const String animatedCrossFadeRnEquivalent = r'''
In React Native, transitioning between two different UI states (such as a collapsed and an expanded card) requires manually managing the animation with `Animated.Value` or Reanimated's `useSharedValue`, and interpolating the opacity of each child separately.

```jsx
// React Native equivalent (manual cross-fade):
import React, { useRef, useState } from 'react';
import { Animated, View, TouchableOpacity, Text } from 'react-native';

const CrossFadeExample = () => {
  const [expanded, setExpanded] = useState(false);
  const anim = useRef(new Animated.Value(0)).current;

  const toggle = () => {
    Animated.timing(anim, {
      toValue: expanded ? 0 : 1,
      duration: 600,
      useNativeDriver: true,
    }).start();
    setExpanded(!expanded);
  };

  const firstOpacity = anim.interpolate({ inputRange: [0, 1], outputRange: [1, 0] });
  const secondOpacity = anim.interpolate({ inputRange: [0, 1], outputRange: [0, 1] });

  return (
    <View>
      <Animated.View style={{ opacity: firstOpacity, position: 'absolute' }}>
        {/* Compact view */}
      </Animated.View>
      <Animated.View style={{ opacity: secondOpacity }}>
        {/* Expanded view */}
      </Animated.View>
      <TouchableOpacity onPress={toggle}><Text>Toggle</Text></TouchableOpacity>
    </View>
  );
};
```

> Note: RN requires manual absolute positioning to overlay the two states, and size transitions are not built-in. You need a separate height animation for the container.

In Flutter, **`AnimatedCrossFade`** handles all of this automatically:
- **Opacity interpolation** of both children (using `firstCurve` and `secondCurve`).
- **Size interpolation** between the two children's sizes (using `sizeCurve`).
- **Clipping** so the outgoing child doesn't overflow the shrinking container.

Key parameters:
- `firstChild` / `secondChild`: The two states to fade between.
- `crossFadeState`: `CrossFadeState.showFirst` or `CrossFadeState.showSecond` — change this to trigger the animation.
- `duration`: How long the cross-fade takes.
- `firstCurve`, `secondCurve`, `sizeCurve`: Independent easing curves for each animated dimension.
''';
