const String animatedListRnEquivalent = r'''
In React Native, animating items in a `FlatList` during insertions or removals uses `LayoutAnimation` (global, coarse) or Reanimated's `entering`/`exiting` props (per-item, fine-grained).

```jsx
// React Native (Reanimated per-item animations):
import Animated, { FadeInLeft, FadeOutRight, Layout } from 'react-native-reanimated';
import { FlatList } from 'react-native';

const AnimatedListRN = () => {
  const [items, setItems] = useState(['Item 1', 'Item 2', 'Item 3']);

  const insert = () => setItems(prev => ['New Item', ...prev]);

  const remove = (index) => setItems(prev => prev.filter((_, i) => i !== index));

  return (
    <FlatList
      data={items}
      keyExtractor={(item, index) => `${item}-${index}`}
      renderItem={({ item, index }) => (
        <Animated.View
          entering={FadeInLeft.duration(400)}
          exiting={FadeOutRight.duration(350)}
          layout={Layout.springify()}
        >
          <Text>{item}</Text>
        </Animated.View>
      )}
    />
  );
};
```

> Note: Reanimated's `layout` prop (for reordering other items when one is removed) requires additional configuration and may have edge cases on iOS. In Flutter, layout reflow animation is built-in.

In Flutter, **`AnimatedList`** provides this capability out of the box with precise, per-item control:
- **Entry animation**: `itemBuilder` receives an `Animation<double>` for each item as it enters. You can combine any transition widgets: `FadeTransition`, `SizeTransition`, `SlideTransition`, `ScaleTransition`.
- **Exit animation**: `AnimatedListState.removeItem()` accepts a builder for the exiting item, allowing a completely different animation for removal vs insertion.
- The state is accessed via `GlobalKey<AnimatedListState>` — the same imperative pattern as `AnimatedGrid`.

This makes `AnimatedList` the go-to widget for **notification feeds**, **task managers**, **chat messages**, and any list that needs smooth, per-row transitions.
''';
