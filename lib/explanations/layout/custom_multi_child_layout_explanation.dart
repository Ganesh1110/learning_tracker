const String customMultiChildLayoutRnEquivalent = r'''
In React Native, positioning a child relative to the size of another sibling child (like placing a status indicator bubble overlapping the corner of an avatar image) is typically achieved using absolute positioning with hardcoded offset estimates.

```jsx
// React Native: Positioning a badge absolutely over an avatar
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const RelativeBadge = () => {
  return (
    <View style={styles.container}>
      {/* 1. Relative Parent Anchor */}
      <View style={styles.avatar}>
        {/* Profile Content */}
      </View>
      {/* 2. Absolute Sibling positioned with hardcoded offsets */}
      <View style={styles.badge}>
        <Text style={styles.badgeText}>9</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    width: 100,
    height: 100,
    position: 'relative', // Anchor context for absolute children
  },
  avatar: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: '#3b82f6',
  },
  badge: {
    position: 'absolute',
    top: -6,          // Hardcoded offset (must guess size overlap)
    right: -6,
    width: 28,
    height: 28,
    borderRadius: 14,
    backgroundColor: 'red',
    borderWidth: 2,
    borderColor: 'white',
    justifyContent: 'center',
    alignItems: 'center',
  },
  badgeText: { color: 'white', fontSize: 10, fontWeight: 'bold' },
});
```

### Key Differences
1. **Hardcoded Estimates vs. Precise Dynamic Layout Math**:
   - **React Native**: Absolute positioning relies on static values (`top: -6, right: -6`). If the avatar size changes dynamically (e.g. 100px to 140px) or the badge size is adjusted dynamically by user preferences, the absolute offset margins must be recalculate and applied via React state variables, which introduces layout loops and rendering cycles.
   - **Flutter**: Flutter's **`CustomMultiChildLayout`** uses a layout delegate (`MultiChildLayoutDelegate`) that runs synchronously during the engine layout pass. The delegate queries the actual layout size of the first child using `layoutChild()` and computes the coordinate positioning of subsequent children using exact pixel math, completely independent of hardcoded guesses.

2. **Decoupling Constraints**:
   - **React Native**: Sibling nodes inside a standard View are laid out in order inside the Flexbox flow. Absolute elements are removed from flow but still depend on the parent's layout box.
   - **Flutter**: Children inside a `CustomMultiChildLayout` are marked with unique IDs using the `LayoutId` wrapper. The layout delegate has full control over the constraints passed to each child (e.g. forcing a child to be a square or letting it size naturally) and positions them relative to each other inside the coordinate frame. This is extremely powerful for building custom sliders, radial menus, or timeline layouts.
''';
