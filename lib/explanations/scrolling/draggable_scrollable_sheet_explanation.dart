const String draggableScrollableSheetRnEquivalent = r'''
In React Native, creating a highly performant draggable bottom sheet that integrates smoothly with list scrolling is usually achieved using third-party libraries like `@gorhom/bottom-sheet` or `react-native-swipe-up-panel`.

```jsx
// React Native: Using @gorhom/bottom-sheet:
import React, { useRef, useMemo } from 'react';
import { View, StyleSheet, Text } from 'react-native';
import BottomSheet, { BottomSheetFlatList } from '@gorhom/bottom-sheet';

const BottomSheetDemo = () => {
  const bottomSheetRef = useRef(null);

  // Snap points defined in percentages or logical pixels
  const snapPoints = useMemo(() => ['25%', '50%', '90%'], []);

  const data = Array.from({ length: 20 }, (_, i) => `Item ${i + 1}`);

  return (
    <View style={styles.container}>
      <BottomSheet ref={bottomSheetRef} index={0} snapPoints={snapPoints}>
        <BottomSheetFlatList
          data={data}
          keyExtractor={(item) => item}
          renderItem={({ item }) => (
            <View style={styles.item}><Text>{item}</Text></View>
          )}
        />
      </BottomSheet>
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: 'grey' },
  item: { padding: 16, borderBottomWidth: 1, borderColor: '#eee' },
});
```

### The Difference in Flutter
Flutter includes `DraggableScrollableSheet` in the core widgets library. It handles layout mapping and links dragging gesture speeds to a list's inner scroll.

Key properties:
1. **builder**: A callback yielding a `ScrollController`. You **must** pass this controller to the child scroll view (`ListView`, `GridView`, or `SingleChildScrollView`). This connects sheet expansion logic to list scrolling.
2. **initialChildSize, minChildSize, maxChildSize**: Percentages of the parent height (from 0.0 to 1.0) defining how large the sheet is.
3. **snap**: Toggles snapping behaviors, bringing the sheet back to defined thresholds (min, max, initial) when released.

When the user drags the list:
- If the sheet is not fully expanded, dragging drags the sheet body up.
- Once the sheet hits `maxChildSize`, dragging switches to scrolling inside the list child.
''';
