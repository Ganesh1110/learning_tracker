const String draggableRnEquivalent = r'''
In React Native, creating a draggable item involves manual tracking of touch coordinates using either the `PanResponder` API combined with an `Animated.ValueXY`, or `react-native-gesture-handler` with `react-native-reanimated`.

```jsx
// React Native - Draggable item using PanResponder:
import React, { useRef } from 'react';
import { Animated, PanResponder, View, StyleSheet } from 'react-native';

const DraggableItem = () => {
  const pan = useRef(new Animated.ValueXY()).current;

  const panResponder = useRef(
    PanResponder.create({
      onStartShouldSetPanResponder: () => true,
      onPanResponderMove: Animated.event([null, { dx: pan.x, dy: pan.y }], {
        useNativeDriver: false,
      }),
      onPanResponderRelease: () => {
        // Reset or snap on release
        Animated.spring(pan, { toValue: { x: 0, y: 0 }, useNativeDriver: false }).start();
      },
    })
  ).current;

  return (
    <Animated.View
      {...panResponder.panHandlers}
      style={[pan.getLayout(), styles.box]}
    />
  );
};

const styles = StyleSheet.create({
  box: { width: 80, height: 80, backgroundColor: 'blue', borderRadius: 8 },
});
```

### The Difference in Flutter
Flutter provides `Draggable` as a declarative layout widget. Instead of manually writing gesture handlers, interpolations, and coordinate calculations, you define three child states:

1. **child**: The standard widget displayed in its static layout slot.
2. **feedback**: The widget that follows the pointer during drag interactions (usually wrapped in a `Material` to provide shadow elevation).
3. **childWhenDragging**: The widget left behind at the original position (usually a blank space or dashed outline).

It also takes a generic payload `data` (e.g., `Draggable<String>`), which is automatically passed to a matching `DragTarget` when dropped.
''';
