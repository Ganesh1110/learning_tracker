const String listenableBuilderRnEquivalent = r'''
In React Native, restricting component re-renders to small subtrees is a common performance practice managed using memoization, context selectors, or store selectors.

### React Native Scoped Renders (Zustand Selector Example)
State managers like **Zustand** use selectors to ensure components only re-render if the selected value changes, avoiding unnecessary re-renders of the parent layout:

```jsx
import React, { useRef } from 'react';
import { View, Text, Button, StyleSheet } from 'react-native';
import { create } from 'zustand';

// 1. Define global state store
const useStore = create((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
}));

// 2. Scoped counter displays only this component when count updates
const ScopedCounter = () => {
  const count = useStore((state) => state.count); // Selector prevents unnecessary renders
  return <Text style={styles.countText}>{count}</Text>;
};

// 3. Parent container does not re-render when count increments
export const ParentContainer = () => {
  const increment = useStore((state) => state.increment);
  const renders = useRef(0);
  renders.current += 1;

  return (
    <View style={styles.container}>
      <Text>Parent Renders: {renders.current}</Text>
      <ScopedCounter />
      <Button title="Increment" onPress={increment} />
    </View>
  );
};
```

### The Difference in Flutter
By default in Flutter, invoking `setState()` inside a stateful widget rebuilds that entire widget and its descendants. For complex views, rebuilding the entire screen for a tiny text update is inefficient.

`ListenableBuilder` resolves this scoping problem directly:
1. It listens to a `Listenable` object (typically a `ChangeNotifier` or `ValueNotifier`).
2. When the notifier fires a update (`notifyListeners()`), **only the layout builder subtree** inside the `ListenableBuilder` is scheduled to rebuild.
3. The parent widget's build method is **not** recalled, saving CPU cycles and preventing layout calculations in the parent hierarchy.
4. It behaves exactly like a local store selector hook in React Native.
''';
