const String customScrollViewRnEquivalent = r'''
In React Native, scrollable lists are implemented using `<ScrollView>`, `<FlatList>`, or `<SectionList>`. To achieve collapsing headers, parallax effects, or sticky headers that react to scroll offset coordinates, React Native developers generally have to orchestrate animations using the `Animated` API or the performance-optimized `react-native-reanimated` library.

Here is how React Native implements a scrollable container with a dynamic collapsing header:

```jsx
// React Native (using Reanimated for a collapsing header):
import React from 'react';
import { View, StyleSheet } from 'react-native';
import Animated, {
  useSharedValue,
  useAnimatedScrollHandler,
  useAnimatedStyle,
  interpolate,
  Extrapolate
} from 'react-native-reanimated';

const CollapsingHeaderExample = () => {
  const scrollY = useSharedValue(0);

  const scrollHandler = useAnimatedScrollHandler((event) => {
    scrollY.value = event.contentOffset.y;
  });

  const headerStyle = useAnimatedStyle(() => {
    const height = interpolate(
      scrollY.value,
      [0, 100],
      [130, 60],
      Extrapolate.CLAMP
    );
    return { height };
  });

  return (
    <View style={styles.container}>
      {/* Animated Header */}
      <Animated.View style={[styles.header, headerStyle]} />

      {/* Scrollable list */}
      <Animated.FlatList
        data={Array.from({ length: 20 })}
        keyExtractor={(_, i) => i.toString()}
        renderItem={({ index }) => <Card title={`Item ${index}`} />}
        onScroll={scrollHandler}
        scrollEventThrottle={16}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1 },
  header: { backgroundColor: '#3b82f6', position: 'absolute', top: 0, left: 0, right: 0, zIndex: 10 },
});
```

### Key Differences
1. **The Sliver Concept vs Box Layout**:
   - **Flutter**: Layout is split into **Boxes** (standard widgets like `Container`, `Padding`) and **Slivers** (widgets that are specifically designed to layout inside a viewport like `CustomScrollView`). Slivers compute their dimensions lazily based on the viewport's current scroll configuration, offset, and target. This allows complex animations (pinned app bars, snapping headers, staggered lists, grids) to be native and lag-free.
   - **React Native**: React Native layouts are Flexbox-based (`yoga` engine). A ScrollView is simply a View layout where children are overflowed. To coordinate sticky grids and lists inside a single scroll viewport, React Native must measure and position items, often triggering JavaScript thread overhead unless using advanced custom virtualized lists.

2. **Unified Viewport vs Multiple Lists**:
   - In React Native, embedding a grid within a scrollable list is typically done using `ListHeaderComponent` / `ListFooterComponent` or flat nesting (which triggers warning warnings about nesting virtual lists).
   - In Flutter, you can seamlessly combine `SliverAppBar`, `SliverGrid`, and `SliverList` sequentially inside a single `CustomScrollView`. They all share a single scroll controller and viewport, providing natural inertia, scroll bounce, and unified gestures.
''';
