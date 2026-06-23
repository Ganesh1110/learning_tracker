const String listenerRnEquivalent = r'''
In React Native, low-level coordinate capturing and touch monitoring are managed using the **Responder System** or the **PanResponder** API.

### React Native Raw Responder
To track raw coordinates on a view without helper hooks, you define responders:

```jsx
import React, { useState } from 'react';
import { View, Text, StyleSheet } from 'react-native';

const TouchTracker = () => {
  const [coords, setCoords] = useState({ x: 0, y: 0 });

  return (
    <View
      onStartShouldSetResponder={() => true}
      onResponderMove={(event) => {
        const { locationX, locationY } = event.nativeEvent;
        setCoords({ x: locationX, y: locationY });
      }}
      onResponderRelease={() => console.log('Released')}
      style={styles.canvas}
    >
      <Text>X: {coords.x.toFixed(0)}, Y: {coords.y.toFixed(0)}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  canvas: { height: 180, backgroundColor: '#eee', justifyContent: 'center', alignItems: 'center' }
});
```

### Bridge Performance Issues
In React Native, because touch events are dispatched on the native main thread and serialized across the asynchronous bridge to the JavaScript thread:
1. High-frequency gestures (like dragging, drawing on a canvas, or complex pointer tracking) can experience layout lag.
2. If the JS thread is busy with state calculations, coordinate updates can drop frames.

### The Difference in Flutter
Flutter is fully compiled and runs its layout, paint, and interaction pipelines natively on the UI thread without a bridge serialization bottleneck.

The `Listener` widget:
1. Listens directly to raw OS events (`PointerDownEvent`, `PointerMoveEvent`, `PointerUpEvent`, `PointerHoverEvent`, `PointerCancelEvent`).
2. Provides access to rich pointer metadata:
   - `localPosition` and `position` (global coordinates).
   - `pressure` (for touch screens supporting force touch / stylus).
   - `kind` (identifies whether the pointer is a finger, mouse cursor, stylus pen, or trackball).
   - `pointer` (unique ID identifying which finger triggers the event, essential for multi-touch).
3. Bypasses the Gesture Arena. Unlike `GestureDetector` which delays event dispatching to decide if a gesture is a single tap, double tap, or swipe, `Listener` dispatches touch updates immediately.
''';
