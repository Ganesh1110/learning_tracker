const String alignRnEquivalent = r'''
In React Native, child alignment inside a parent is accomplished using Flexbox properties or absolute positioning. 

```jsx
// React Native - Align Top Right using Flexbox:
const FlexAlign = () => (
  <View style={{ flex: 1, alignItems: 'flex-end', justifyContent: 'flex-start' }}>
    <View style={{ width: 50, height: 50, backgroundColor: 'blue' }} />
  </View>
);

// React Native - Align Top Right using Absolute positioning:
const AbsoluteAlign = () => (
  <View style={{ flex: 1, position: 'relative' }}>
    <View style={{ position: 'absolute', top: 0, right: 0, width: 50, height: 50, backgroundColor: 'blue' }} />
  </View>
);
```

In Flutter, the `Align` widget simplifies this. It takes a single child and positions it inside itself according to an `Alignment` parameter (e.g. `Alignment.topRight`), and can also automatically size itself to wrap around the child if no constraints are given.
''';
