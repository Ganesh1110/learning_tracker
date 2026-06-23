const String decoratedSliverRnEquivalent = r'''
In React Native, scrollable lists are typically built using `<FlatList>` or `<SectionList>`. When you need to display a grouped section of items (for example, putting a card background with rounded corners and a shadow behind a group of list elements), you must style the individual items or render a custom wrapper container.

Here is how you style groups in React Native using SectionList:

```jsx
// React Native:
import React from 'react';
import { SectionList, View, Text, StyleSheet } from 'react-native';

const GroupedListExample = () => {
  const sections = [
    { title: 'Sliver Group', data: ['Item 1', 'Item 2', 'Item 3'] }
  ];

  return (
    <SectionList
      sections={sections}
      keyExtractor={(item, index) => item + index}
      renderSectionHeader={({ section: { title } }) => (
        <Text style={styles.header}>{title}</Text>
      )}
      renderItem={({ item, index, section }) => {
        // To make the items look like they are inside a card group:
        const isFirst = index === 0;
        const isLast = index === section.data.length - 1;

        return (
          <View style={[
            styles.itemContainer,
            isFirst && styles.firstItem,
            isLast && styles.lastItem
          ]}>
            <Text>{item}</Text>
          </View>
        );
      }}
    />
  );
};

const styles = StyleSheet.create({
  header: { fontSize: 16, fontWeight: 'bold', padding: 10, backgroundColor: '#f3f4f6' },
  itemContainer: {
    backgroundColor: '#fff',
    padding: 16,
    borderColor: '#e5e7eb',
    borderWidth: 1,
    borderBottomWidth: 0,
  },
  firstItem: { borderTopLeftRadius: 12, borderTopRightRadius: 12 },
  lastItem: { borderBottomLeftRadius: 12, borderBottomRightRadius: 12, borderBottomWidth: 1 },
});
```

### Key Differences
1. **Unified Group Painting vs. Item-by-Item Styling**:
   - **React Native**: Since you cannot wrap scrollable items inside a standard `<View>` layout container without breaking the lazy-rendering/virtualization of the FlatList/SectionList, you must calculate border-radius and borders item-by-item (checking if it's the first or last item in the list) to simulate a grouped card background.
   - **Flutter**: Flutter's **`DecoratedSliver`** is specifically designed for sliver viewports. It sits in the sliver list tree and wraps a sliver (like a `SliverList` or `SliverGrid`) directly. It paints the decoration (background, borders, shadow) around the entire space occupied by the wrapped sliver as a single unified shape, regardless of how many individual list items are generated dynamically inside it.

2. **Scroll Integration**:
   - Flutter's `DecoratedSliver` scrolls naturally with the viewport. The decoration's background gradient and borders stretch and move cleanly in coordination with the children's dynamic layout height changes, with no native measurement lags.
''';
