const String gridViewRnEquivalent = r'''
In React Native, grids are created using the standard `<FlatList>` component by specifying the `numColumns` prop.

```jsx
// React Native - Grid layout using FlatList:
import React from 'react';
import { FlatList, View, Text, StyleSheet } from 'react-native';

const GridDemo = () => {
  const data = Array.from({ length: 12 }, (_, i) => `Item ${i + 1}`);

  return (
    <FlatList
      data={data}
      numColumns={3} // Sets grid column count
      keyExtractor={(item) => item}
      renderItem={({ item }) => (
        <View style={styles.gridCell}>
          <Text>{item}</Text>
        </View>
      )}
    />
  );
};

const styles = StyleSheet.create({
  gridCell: {
    flex: 1,
    height: 100,
    margin: 4, // Spacing gaps require manual margins
    backgroundColor: '#ddd',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
```

### The Difference in Flutter
Flutter provides `GridView` as a dedicated layout component rather than a configuration option on standard lists.

Gaps and dimensions are defined cleanly inside a layout delegate (`SliverGridDelegate`):

1. **GridView.count**: A shorthand for fixed column counts:
   ```dart
   GridView.count(
     crossAxisCount: 3,
     crossAxisSpacing: 8.0, // horizontal gap
     mainAxisSpacing: 8.0,  // vertical gap
     childAspectRatio: 1.0, // width / height ratio
     children: [...],
   )
   ```
2. **GridView.builder**: Optimizes resource consumption for long or infinite lists, rendering only visible elements using index callbacks.
3. **childAspectRatio**: Dictates cell heights. Unlike React Native where item height is set explicitly in styles, Flutter calculates cell heights relative to cell widths using the ratio. A ratio of `1.0` makes cells perfectly square; a ratio of `2.0` makes cells twice as wide as they are tall.
''';
