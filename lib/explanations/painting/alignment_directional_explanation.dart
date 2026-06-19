const String alignmentDirectionalRnEquivalent = r'''
In React Native, localization-aware layout is supported using start/end properties (e.g. `marginStart`, `paddingEnd`, `alignItems: 'flex-start'`). Under the hood, these values automatically flip when the device's system direction is switched to a Right-to-Left (RTL) language like Arabic or Hebrew.

```jsx
// React Native - Align elements supporting RTL out of the box:
const RTLFriendlyContainer = () => (
  <View style={{ flex: 1, flexDirection: 'row', justifyContent: 'flex-start' }}>
    {/* Will appear on the left in LTR, and on the right in RTL */}
    <Text>Start aligned text</Text>
  </View>
);
```

In Flutter, `AlignmentDirectional` maps to this start/end logic:
- **`AlignmentDirectional.topStart`**: Top-left in LTR (Left-to-Right), but automatically becomes Top-right in RTL (Right-to-Left).
- **`AlignmentDirectional.topEnd`**: Top-right in LTR, and automatically becomes Top-left in RTL.

Using `AlignmentDirectional` instead of `Alignment` ensures your layout adapts automatically to internationalization without manual code branching.
''';
