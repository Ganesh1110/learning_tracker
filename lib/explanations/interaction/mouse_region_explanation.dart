const String mouseRegionRnEquivalent = r'''
In React Native, because the primary target is mobile screens where hover states do not exist, there are no core properties to override hardware cursors or track hover coordinates.

### React Native Web Hover
For React Native Web, hover detection and styling cursor shapes are achieved using properties on `<Pressable>` or standard HTML styles:

```jsx
import React from 'react';
import { Pressable, Text, StyleSheet } from 'react-native';

const HoverableBox = () => (
  <Pressable
    onHoverIn={() => console.log('Mouse entered')}
    onHoverOut={() => console.log('Mouse left')}
    style={({ hovered }) => [
      styles.box,
      hovered && styles.hoveredBox
    ]}
  >
    <Text>Hover Me</Text>
  </Pressable>
);

const styles = StyleSheet.create({
  box: {
    padding: 16,
    backgroundColor: '#eee',
    // React Native Web specific styles:
    cursor: 'default', 
  },
  hoveredBox: {
    backgroundColor: '#ddd',
    cursor: 'pointer', // changes cursor indicator on web
  }
});
```

However, this is only supported on Web, and React Native lacks native APIs for tracking the exact hardware mouse cursor coordinate offset dynamically without registering global browser window event handlers.

### The Difference in Flutter
Flutter includes `MouseRegion` to handle hover interactions, tracking, and cursor overrides in a single unified API across Desktop (Windows, macOS, Linux) and Web.

`MouseRegion` provides:
1. **Coordinate Tracking**: The `onHover` callback exposes the cursor's local coordinate offsets (`localPosition`) in real-time.
2. **Hover Bounds Notifications**: `onEnter` and `onExit` trigger when the cursor crosses the boundaries of the widget.
3. **Cursor Overrides**: The `cursor` property overrides the hardware mouse icon with standard styles (`SystemMouseCursors.click`, `SystemMouseCursors.text`, `SystemMouseCursors.grab`, `SystemMouseCursors.forbidden`, etc.).
4. **Hit Testing Control**: The region can be configured to block hover hits from bubbling down to underlying layers.
''';
