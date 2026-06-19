const String animatedGridRnEquivalent = r'''
In React Native, animating items entering and leaving a grid-style list requires combining `FlatList` (with `numColumns`) with `LayoutAnimation` or Reanimated's `Layout` prop. Neither approach is as seamless as Flutter's built-in solution.

```jsx
// React Native (LayoutAnimation approach):
import { LayoutAnimation, FlatList, View, TouchableOpacity, Text } from 'react-native';

const AnimatedGridRN = () => {
  const [items, setItems] = useState([1, 2, 3, 4]);

  const insertItem = () => {
    LayoutAnimation.configureNext(LayoutAnimation.Presets.spring);
    setItems(prev => [...prev, prev.length + 1]);
  };

  const removeItem = () => {
    LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);
    setItems(prev => prev.slice(0, -1));
  };

  return (
    <FlatList
      data={items}
      numColumns={3}
      keyExtractor={(item) => item.toString()}
      renderItem={({ item }) => <View style={{ flex: 1, height: 80, margin: 4 }}><Text>{item}</Text></View>}
    />
  );
};
```

> Note: `LayoutAnimation` in RN is a global configuration that affects all layout changes in a render cycle and doesn't support fine-grained, per-item entry/exit animations. Reanimated's `entering`/`exiting` props on individual items offer more control but require more setup.

In Flutter, **`AnimatedGrid`** provides first-class support for animated item insertions and removals in a grid layout:
- Items **enter** with a custom `itemBuilder` that receives an `animation` parameter — wire it to `ScaleTransition`, `FadeTransition`, or `SlideTransition`.
- Items **exit** with a `removeItem` builder that also receives the outgoing animation.
- The grid is controlled imperatively via **`AnimatedGridState`**, obtained through a `GlobalKey<AnimatedGridState>`.

This makes item-level, per-animation-curve control trivially simple.
''';
