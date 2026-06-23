const String dragTargetRnEquivalent = r'''
In React Native, detecting when a dragged item is dropped inside a target container requires manual layout calculations. You must measure the absolute coordinates of the drop zone using the `onLayout` event and then compare them to the gesture coordinates when releasing the touch.

```jsx
// React Native: Simulating a drop zone:
import React, { useState } from 'react';
import { View, StyleSheet, Text } from 'react-native';

const DropZoneDemo = () => {
  const [layout, setLayout] = useState({ x: 0, y: 0, width: 0, height: 0 });

  const handleLayout = (event) => {
    // Save target bounds
    setLayout(event.nativeEvent.layout);
  };

  const isDropZone = (gestureState) => {
    // Manual collision checking
    return (
      gestureState.moveY > layout.y &&
      gestureState.moveY < layout.y + layout.height &&
      gestureState.moveX > layout.x &&
      gestureState.moveX < layout.x + layout.width
    );
  };

  return (
    <View style={styles.container}>
      <View onLayout={handleLayout} style={styles.dropZone}>
        <Text>Drop Zone</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16 },
  dropZone: { height: 120, backgroundColor: '#f0f0f0', borderRadius: 8 },
});
```

### The Difference in Flutter
Flutter provides `DragTarget` to abstract away all coordinate comparisons. It automatically handles spatial hit-testing for overlapping nodes:

1. **onWillAcceptWithDetails**: Invoked when a `Draggable` is hovered over the target. Returning `true` signals that the target accepts this data.
2. **onAcceptWithDetails**: Invoked when the `Draggable` is dropped successfully on the target, passing the generic typed `data` payload.
3. **builder**: Builds the visual appearance of the target based on the current hover state (e.g. `candidateData` or `rejectedData`), allowing you to dynamically highlight or expand the zone when hovered.
''';
