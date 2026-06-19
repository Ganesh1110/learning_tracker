const String animatedSlideRnEquivalent = r'''
In React Native, sliding or translating a component relative to its own size requires utilizing absolute translates in styles. Since React Native style transforms (`translateX` and `translateY`) do not natively support percentage values, sliding a component exactly by 100% of its own width/height typically requires dynamically measuring the layout using the `onLayout` callback first.

```jsx
// React Native (sliding an element by its own width):
import React, { useState } from 'react';
import { View, Button } from 'react-native';
import Animated, { useAnimatedStyle, withTiming, useSharedValue } from 'react-native-reanimated';

const SlideBox = () => {
  const [active, setActive] = useState(false);
  const widthVal = useSharedValue(0);
  const slideProgress = useSharedValue(0);

  const slideStyle = useAnimatedStyle(() => {
    // Translating dynamically based on measured width:
    const translate = slideProgress.value * widthVal.value;
    return {
      transform: [{ translateX: withTiming(translate, { duration: 300 }) }],
    };
  });

  return (
    <View style={{ flex: 1, overflow: 'hidden' }}>
      <Animated.View 
        onLayout={(e) => { widthVal.value = e.nativeEvent.layout.width; }}
        style={[{ width: 100, height: 100, backgroundColor: 'blue' }, slideStyle]}
      />
      <Button title="Toggle Slide" onPress={() => { slideProgress.value = active ? 0 : 1; setActive(!active); }} />
    </View>
  );
};
```

In Flutter, **`AnimatedSlide`** performs this layout-relative displacement automatically. Instead of pixel distances, it accepts a fractional **`Offset`** where:
* `Offset(1.0, 0.0)` slides the child right by exactly its own width.
* `Offset(0.0, -0.5)` slides the child up by exactly half of its own height.

When the `offset` property changes, `AnimatedSlide` implicitly animates the transition over the designated `duration` and `curve`.
''';
