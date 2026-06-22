const String compositedTransformTargetRnEquivalent = r'''
In React Native, linking a floating popover, dropdown list, or tooltip to a specific anchor view (the target) requires measuring the screen-space coordinates of the target view and passing them to an absolutely positioned overlay component.

This is done using refs and calling `.measure()` on the target component:

```jsx
// React Native: Anchoring a tooltip to a button
import React, { useRef, useState } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, Modal } from 'react-native';

const AnchorExample = () => {
  const buttonRef = useRef(null);
  const [layout, setLayout] = useState({ x: 0, y: 0, width: 0, height: 0 });
  const [showTooltip, setShowTooltip] = useState(false);

  const measureButton = () => {
    buttonRef.current.measure((fx, fy, width, height, px, py) => {
      // px, py are coordinates relative to the screen
      setLayout({ x: px, y: py, width, height });
      setShowTooltip(true);
    });
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity
        ref={buttonRef}
        style={styles.button}
        onPress={measureButton}
      >
        <Text style={styles.buttonText}>Click Me</Text>
      </TouchableOpacity>

      {showTooltip && (
        <Modal transparent visible={showTooltip}>
          <TouchableOpacity
            style={styles.modalBackdrop}
            onPress={() => setShowTooltip(false)}
          >
            {/* Position absolute based on target measurements */}
            <View style={[
              styles.tooltip,
              {
                position: 'absolute',
                left: layout.x,
                top: layout.y + layout.height + 8 // Position below button
              }
            ]}>
              <Text>Tooltip content linked to Button</Text>
            </View>
          </TouchableOpacity>
        </Modal>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  button: { padding: 12, backgroundColor: '#6200ee', borderRadius: 8 },
  buttonText: { color: 'white', fontWeight: 'bold' },
  modalBackdrop: { flex: 1 },
  tooltip: {
    width: 200,
    padding: 12,
    backgroundColor: '#ffeb3b',
    borderRadius: 6,
    elevation: 4,
  },
});
```

### Key Differences
1. **GPU Layer Linking vs. Asynchronous Measurement Hooks**:
   - **React Native**: Positioning an overlay requires invoking asynchronous layout measures (`.measure(...)`) through the JS-to-native bridge. If the screen is scrolled, the button moves, but the popover remains static unless you continuously re-measure the button or hook into scrolling events to update the state coordinates.
   - **Flutter**: Flutter uses a compositor-level linkage. By wrapping the anchor widget in a **`CompositedTransformTarget`** and the overlay widget in a **`CompositedTransformFollower`**, you link their visual render layers using a shared **`LayerLink`** token. The GPU compositor automatically translates and matches their screen-space coordinates, making position tracking instant, fluid, and completely lag-free during scroll animations or complex parent transforms.

2. **Overlay Integration**:
   - `CompositedTransformTarget` marks the coordinate system source in the render tree. It works in partnership with `CompositedTransformFollower`, which applies the same transformation matrix (offset, rotation, scale) to its own child widget, keeping them visually aligned.
''';
