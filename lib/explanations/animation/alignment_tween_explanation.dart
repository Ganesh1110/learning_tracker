const String alignmentTweenRnEquivalent = r'''
In React Native, animations using coordinates are absolute. Animating an item from one coordinate layout boundary to another utilizes interpolation mappings directly onto 2D coordinate values:

```jsx
// React Native:
import React, { useRef } from 'react';
import { Animated } from 'react-native';

const CartesianAnim = () => {
  const anim = useRef(new Animated.Value(0)).current;

  // Simple linear interpolation from top-left (0,0) to bottom-right (200, 300)
  const left = anim.interpolate({ inputRange: [0, 1], outputRange: [0, 200] });
  const top = anim.interpolate({ inputRange: [0, 1], outputRange: [0, 300] });

  return <Animated.View style={{ position: 'absolute', left, top }} />;
};
```

In Flutter, **`AlignmentTween`** specifically interpolates between two absolute `Alignment` objects (which are defined by horizontal `x` and vertical `y` fractions relative to the center of a box, ranging from `-1.0` to `1.0`). 

Unlike `AlignmentGeometryTween`, `AlignmentTween` is strictly Cartesian and does not resolve or swap coordinates based on reading direction (LTR/RTL). It is highly efficient for pure coordinate-based layouts (such as particle effects, card swipes, or parallax effects).
''';
