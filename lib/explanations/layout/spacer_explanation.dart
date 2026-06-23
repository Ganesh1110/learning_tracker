const String spacerRnEquivalent = r'''
In React Native, flex spacing matches the CSS flexbox standard.
• To insert an expanding spacer that fills all empty layout space inside a container, you use an empty `<View>` styled with `flex: 1` (or any non-zero flex integer):
  ```jsx
  <View style={{ flexDirection: 'row' }}>
    <Text>Item A</Text>
    <View style={{ flex: 1 }} /> // acts exactly like Spacer(flex: 1)
    <Text>Item B</Text>
  </View>
  ```
• To configure multiple relative spacers, you allocate proportional flex integers:
  ```jsx
  <View style={{ flex: 1 }} /> // Spacer(flex: 1)
  <View style={{ flex: 2 }} /> // Spacer(flex: 2)
  ```
• For uniform distributions, you would typically use alignment styles on the parent view, such as `justifyContent: 'space-between'` or `justifyContent: 'space-around'`, which maps directly to Flutter's `MainAxisAlignment.spaceBetween`.

### Best Practices
• Flex Constraints: `Spacer` must be placed inside a Row, Column, or Flex container. Placing it outside will lead to layout errors because it depends on flexbox parent alignment.
• Spacer vs SizedBox: Use `SizedBox` for fixed, constant pixel spacing (e.g. `SizedBox(height: 12)`). Use `Spacer` when you want the gap size to adapt and expand dynamically according to screen height/width.
''';
