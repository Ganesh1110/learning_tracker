const String absorbPointerRnEquivalent = r'''
In React Native, AbsorbPointer behaves like setting `pointerEvents: "none"` on a `View`.

```jsx
<View pointerEvents="none">
  <TouchableOpacity onPress={handlePress}>
    <Text>Can't tap me</Text>
  </TouchableOpacity>
</View>
```

Flutter's AbsorbPointer also supports toggling `absorbing` at runtime,
which is equivalent to conditionally setting `pointerEvents`:

```jsx
<View pointerEvents={isDisabled ? "none" : "auto"}>
  ...
</View>
```
''';
