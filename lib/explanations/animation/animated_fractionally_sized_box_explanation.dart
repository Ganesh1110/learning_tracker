const String animatedFractionallySizedBoxRnEquivalent = r'''
In React Native, sizing a component as a fraction of its parent uses percentage strings (`width: '60%'`). Animating that fraction requires Reanimated's `useSharedValue` and `useAnimatedStyle`.

```jsx
// React Native equivalent (Reanimated):
import Animated, { useSharedValue, useAnimatedStyle, withTiming } from 'react-native-reanimated';

const FractionalSizeExample = () => {
  const widthFactor = useSharedValue(0.6);

  const animatedStyle = useAnimatedStyle(() => ({
    width: `${widthFactor.value * 100}%`,
    height: 100,
    backgroundColor: 'purple',
  }));

  return (
    <View style={{ width: '100%', height: 200, justifyContent: 'center' }}>
      <Animated.View style={animatedStyle} />
      <Button title="Resize" onPress={() => { widthFactor.value = withTiming(0.9); }} />
    </View>
  );
};
```

> Note: RN does not animate the `alignment` of a child within its parent as an intrinsic concept — you need separate positioning logic (e.g. `justifyContent`, `alignItems`, or `top`/`left` transforms).

In Flutter, **`AnimatedFractionallySizedBox`** is a first-class implicit animation widget that:
- Sizes its child as a **fraction of the parent constraints** using `widthFactor` and `heightFactor` (values 0.0 to 1.0).
- Animates the size **and the alignment** simultaneously as they change, all in one widget.

This is particularly powerful for **progress indicators**, **expandable panels**, and **responsive layout transitions** that animate smoothly as screen size or state changes.
''';
