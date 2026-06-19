const String animatedDefaultTextStyleRnEquivalent = r'''
In React Native, changing text styles (color, size, weight) does not animate by default. You need to use `Animated.Text` (via `Animated.createAnimatedComponent`) or Reanimated's `useAnimatedStyle` to interpolate style properties.

```jsx
// React Native (Reanimated approach):
import Animated, { useSharedValue, useAnimatedStyle, withTiming } from 'react-native-reanimated';

const AnimatedTextExample = () => {
  const fontSize = useSharedValue(18);
  const color = useSharedValue(0);

  const animatedStyle = useAnimatedStyle(() => ({
    fontSize: fontSize.value,
    color: `hsl(${color.value}, 70%, 50%)`,
    fontWeight: '700',
  }));

  return (
    <>
      <Animated.Text style={animatedStyle}>Flutter Widgets</Animated.Text>
      <Button title="Animate" onPress={() => {
        fontSize.value = withTiming(32, { duration: 500 });
        color.value = withTiming(240, { duration: 500 });
      }} />
    </>
  );
};
```

> Note: RN requires explicit animation setup and you must animate each style property individually. There is no equivalent of "apply a style to ALL descendants automatically".

In Flutter, **`AnimatedDefaultTextStyle`** is a powerful implicit animation widget with two key benefits:

1. **Cascading effect**: It sets a *default* text style that all descendant `Text` widgets inherit — without needing to explicitly pass a style. Any `Text` widget anywhere in the subtree will animate together automatically.
2. **Implicit animation**: Just change the `style` property and Flutter handles the interpolation seamlessly.

This makes it perfect for themes, dynamic typography, and any UI pattern where many text elements should animate in sync.
''';
