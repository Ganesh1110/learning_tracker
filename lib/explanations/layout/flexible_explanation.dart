const String flexibleRnEquivalent = r'''
In React Native, flex sizing is controlled by a combination of three style properties on the children: `flexGrow`, `flexShrink`, and `flexBasis`. 

```jsx
// React Native: Equivalent of FlexFit.loose (shrinkable but not forced to grow)
const LooseEquivalent = () => (
  <View style={{ flexDirection: 'row' }}>
    <View style={{ width: 60, backgroundColor: 'red' }} />
    
    {/* Box behaves like FlexFit.loose:
        - It can shrink if container is too narrow (flexShrink: 1)
        - It does NOT grow beyond 100px (flexGrow: 0) */}
    <View style={{ width: 100, flexShrink: 1, backgroundColor: 'blue' }} />
  </View>
);
```

### The Difference in Flutter
Flutter splits these concerns into two widgets: `Flexible` and `Expanded`. In fact, `Expanded` is just a subclass of `Flexible` with a pre-configured `fit` value.

The `Flexible` widget takes a `fit` parameter of type `FlexFit`:

1. **FlexFit.loose** (Default):
   - The child is allowed to be smaller than the maximum space allocated to it.
   - If the child's natural size is `80px` but the flex share allows up to `150px`, the child will render at `80px` and leave the remaining `70px` empty.
   - If the container shrinks, the child will shrink down to prevent overflow.

2. **FlexFit.tight** (Equivalent to `Expanded`):
   - The child is forced to fill the entire allocated space.
   - In the example above, the child's natural size is ignored, and it is stretched to fill the full `150px`.

This makes `Flexible` the perfect choice when you want items to resize responsively on small screens but retain their natural compact size on larger layouts.
''';
