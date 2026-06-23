const String gestureDetectorRnEquivalent = r'''
In React Native, basic touch actions are handled using `<TouchableOpacity>`, `<TouchableWithoutFeedback>`, or the modern `<Pressable>` widget.

```jsx
// React Native - Basic tap gesture:
import React from 'react';
import { Pressable, Text, StyleSheet } from 'react-native';

const TapButton = () => (
  <Pressable
    onPress={() => console.log('Tap!')}
    onLongPress={() => console.log('Long Press!')}
    style={styles.button}
  >
    <Text>Press Me</Text>
  </Pressable>
);

const styles = StyleSheet.create({
  button: { padding: 12, backgroundColor: 'blue' }
});
```

However, if you need to detect complex gestures like double-taps, pan-drags, swipes, or pinch-zooms, you must write low-level calculations inside `PanResponder`, or import the third-party library `react-native-gesture-handler` (using `TapGestureHandler`, `PanGestureHandler`, etc.).

### The Difference in Flutter
Flutter includes `GestureDetector` directly in the core widgets library. It acts as a comprehensive gesture recognition wrapper for any widget.

It supports a massive range of gestures natively without external packages:
1. **Tap**: `onTap`, `onDoubleTap`, `onTapDown`, `onTapCancel`
2. **Long Press**: `onLongPress`, `onLongPressStart`, `onLongPressEnd`
3. **Vertical/Horizontal Drag**: `onVerticalDragUpdate`, `onHorizontalDragUpdate`
4. **General Pan (2D dragging)**: `onPanStart`, `onPanUpdate`, `onPanEnd`
5. **Scale (Pinch/Zoom)**: `onScaleStart`, `onScaleUpdate`, `onScaleEnd`

Under the hood, `GestureDetector` delegates touches to a gesture arena that resolves competing gestures (e.g. distinguishing a single tap from a double tap) automatically.
''';
