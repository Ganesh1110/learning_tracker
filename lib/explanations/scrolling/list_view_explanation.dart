const String listViewRnEquivalent = r'''
In React Native, lists are handled differently depending on the length of the list:

### 1. ScrollView (Static Lists)
`<ScrollView>` renders all children immediately on mount. If you render a list of 1,000 items inside a `<ScrollView>`, it will instantiate 1,000 native view components at once, leading to massive memory usage and lag:

```jsx
// React Native ScrollView (Non-lazy)
<ScrollView>
  {items.map((item, idx) => (
    <Card key={idx} title={item} />
  ))}
</ScrollView>
```

### 2. FlatList (Virtualized Lazy Lists)
For long lists, React Native developers use `<FlatList>`, which loads views lazily (virtualization) and exposes props for styling dividers and list features:

```jsx
// React Native FlatList (Lazy-loaded)
import React from 'react';
import { FlatList, View, Text, StyleSheet } from 'react-native';

const MyFlatList = () => (
  <FlatList
    data={[{ id: '1', title: 'Item 1' }, { id: '2', title: 'Item 2' }]}
    renderItem={({ item }) => <Text style={styles.item}>{item.title}</Text>}
    keyExtractor={(item) => item.id}
    ItemSeparatorComponent={() => <View style={styles.separator} />}
  />
);

const styles = StyleSheet.create({
  item: { padding: 16 },
  separator: { height: 1, backgroundColor: '#eee' }
});
```

### The Difference in Flutter
Flutter maps these concepts directly to dedicated `ListView` constructors:

1. **Standard `ListView`**:
   - `ListView(children: [...])`
   - Behave similarly to React Native's `<ScrollView>` or simple array mapping. It creates all children upfront. Useful only for short lists of static items.

2. **Lazy-loaded `ListView.builder`**:
   - `ListView.builder(itemCount: 100, itemBuilder: (context, index) => ...)`
   - Matches React Native's `<FlatList>` with `renderItem`. It virtualizes items, instantiating and rendering widgets only as they scroll into view.

3. **Separated List `ListView.separated`**:
   - `ListView.separated(itemCount: 100, itemBuilder: ..., separatorBuilder: ...)`
   - Combines the lazy loading of `ListView.builder` with a dedicated callback builder to insert widgets (typically dividers) between list items, similar to `ItemSeparatorComponent` in React Native.

### Key Layout Parameters
- **`shrinkWrap`**: Set `shrinkWrap: true` if the list needs to match the height of its children (rather than filling all available parent space). In React Native, lists naturally expand/shrink based on flex styles.
- **`physics`**: Controls scroll bounce feel (`BouncingScrollPhysics` for iOS style bounce, `ClampingScrollPhysics` for Android style boundaries).
''';
