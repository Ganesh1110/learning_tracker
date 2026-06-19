const String animatedSizeRnEquivalent = r'''
In React Native, when a component's inner layout updates (e.g., toggling a detailed text view, or expanding a accordion card), the container's height jumps instantly by default. To make this size transition smooth, developers must use `LayoutAnimation` globally, or perform manual measurements to animate dynamic values.

```jsx
// React Native (using Reanimated for a smooth accordion):
import React, { useState } from 'react';
import { View, Text, Button } from 'react-native';
import Animated, { useAnimatedStyle, withTiming } from 'react-native-reanimated';

const ExpandableCard = () => {
  const [expanded, setExpanded] = useState(false);

  // Note: For Reanimated, animating to dynamic "auto" heights is notoriously tricky
  // and often requires measuring the layout via `onLayout` to retrieve a pixel value:
  const [contentHeight, setContentHeight] = useState(0);

  const animatedStyle = useAnimatedStyle(() => {
    return {
      height: withTiming(expanded ? contentHeight + 40 : 60, { duration: 300 }),
    };
  });

  return (
    <Animated.View style={[{ overflow: 'hidden', backgroundColor: '#f0f0f0' }, animatedStyle]}>
      <Text>Card Header</Text>
      <View
        onLayout={(e) => setContentHeight(e.nativeEvent.layout.height)}
        style={{ position: 'absolute', opacity: 0 }}
      >
        <Text>This is the dynamic, hidden content that is measured to animate the height.</Text>
      </View>
      {expanded && <Text>This is the dynamic content...</Text>}
      <Button title={expanded ? "Collapse" : "Expand"} onPress={() => setExpanded(!expanded)} />
    </Animated.View>
  );
};
```

In Flutter, **`AnimatedSize`** is an implicit transition widget that listens directly to the layout phase of its child. When the child changes size, `AnimatedSize` intercepts the new constraints and automatically animates its boundaries from its old size to its new size over the specified `duration` and `curve`. No manual height measuring or absolute layouts are required!
''';
