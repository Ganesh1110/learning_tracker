const String animatedGridStateRnEquivalent = r'''
`AnimatedGridState` is the **imperative controller** for an `AnimatedGrid` widget. It is obtained via a `GlobalKey<AnimatedGridState>` and used to programmatically trigger item-level animations.

In React Native, the closest equivalent is a ref on a `FlatList` (e.g. `ref.current.scrollToIndex`) combined with `LayoutAnimation` or Reanimated's `useAnimatedRef`. However, these tools operate at a coarser granularity — affecting layout globally rather than targeting individual items.

```jsx
// React Native (closest equivalent using ref + LayoutAnimation):
const listRef = useRef(null);

const addItem = () => {
  // Affects ALL layout changes in this render, not just one item:
  LayoutAnimation.configureNext(LayoutAnimation.Presets.spring);
  setItems(prev => [...prev, newItem]);
};

const removeItem = (index) => {
  LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);
  setItems(prev => prev.filter((_, i) => i !== index));
};
```

In Flutter, **`AnimatedGridState`** is the precise, per-item solution:

```dart
final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();

// Insert at index with custom animation duration:
_gridKey.currentState!.insertItem(index, duration: Duration(milliseconds: 400));

// Remove at index with a custom exit widget:
_gridKey.currentState!.removeItem(
  index,
  (context, animation) => ScaleTransition(scale: animation, child: tile),
  duration: Duration(milliseconds: 300),
);
```

Key concepts:
- **`insertItem(index)`**: Notifies the grid that a new item has been added to your data list at `index`. The grid calls `itemBuilder` for that index, passing in the entry animation.
- **`removeItem(index, builder)`**: Passes the exiting tile (via `builder`) to a separate animation that runs independently before the item is removed from the layout.
- **Imperative control**: The state is separate from the widget tree, enabling you to decouple data-list mutation from UI animation scheduling.
''';
