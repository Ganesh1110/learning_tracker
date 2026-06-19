const String alignmentGeometryTweenRnEquivalent = r'''
In React Native, to animate layout positions based on writing directions (RTL vs LTR), you must read the layout state manually (using `I18nManager.isRTL`), swap left/right bounds dynamically, and drive style interpolation manually:

```jsx
// React Native:
import React, { useRef } from 'react';
import { Animated, I18nManager } from 'react-native';

const RightToLeftExample = () => {
  const anim = useRef(new Animated.Value(0)).current;

  // Manually swapping beginning and end bounds based on RTL setting
  const startOffset = I18nManager.isRTL ? 200 : 0;
  const endOffset = I18nManager.isRTL ? 0 : 200;

  const translation = anim.interpolate({
    inputRange: [0, 1],
    outputRange: [startOffset, endOffset],
  });

  return <Animated.View style={{ transform: [{ translateX: translation }] }} />;
};
```

In Flutter, **`AlignmentGeometryTween`** represents an interpolation between two `AlignmentGeometry` bounds (e.g. transitioning from `AlignmentDirectional.topStart` to `Alignment.bottomRight`). 

It is text-direction aware. When `evaluate(animation)` is called, Flutter automatically resolves the LTR vs. RTL components under the hood based on the active `Directionality` in the widget tree, creating a smooth and localized transition.
''';
