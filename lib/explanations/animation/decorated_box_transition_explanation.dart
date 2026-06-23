const String decoratedBoxTransitionRnEquivalent = r'''
In React Native, morphing a view's decoration properties (such as background colors, borders, shadows, and rounded corners) dynamically over time is done by creating an animated style sheet. You define one or more animatable shared values (`Animated.Value` or `useSharedValue`) and bind them directly to the `style` property of an `<Animated.View>`.

Here is how you achieve decoration transitions in React Native using `react-native-reanimated`:

```jsx
// React Native (using Reanimated):
import React from 'react';
import { View, StyleSheet, Button } from 'react-native';
import Animated, {
  useSharedValue,
  withTiming,
  useAnimatedStyle,
  interpolateColor
} from 'react-native-reanimated';

const MorphingBoxExample = () => {
  const progress = useSharedValue(0);

  const startAnimation = () => {
    // Animate progress value from 0 to 1
    progress.value = withTiming(progress.value === 0 ? 1 : 0, { duration: 1500 });
  };

  const animatedStyle = useAnimatedStyle(() => {
    const backgroundColor = interpolateColor(
      progress.value,
      [0, 1],
      ['purple', 'orange']
    );
    
    return {
      backgroundColor,
      borderRadius: progress.value * 28 + 8, // Animate 8px -> 36px
      borderWidth: progress.value * 4 + 2,   // Animate 2px -> 6px
      borderColor: interpolateColor(
        progress.value,
        [0, 1],
        ['purpleaccent', 'deeporangeaccent']
      ),
    };
  });

  return (
    <View style={styles.container}>
      <Button title="Morph Card" onPress={startAnimation} />
      <Animated.View style={[styles.box, animatedStyle]} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  box: {
    width: 140,
    height: 140,
  },
});
```

### Key Differences
1. **Unified Tween Object vs Individual Value Interpolation**:
   - **React Native**: Since React Native View style objects require individual numeric/color properties, developers must manually interpolate and animate each style property (e.g. `borderRadius`, `borderWidth`, `backgroundColor`) separately from a single animated driver value.
   - **Flutter**: Flutter provides a unified **`DecorationTween`** which maps the entire `BoxDecoration` state (gradient, borders, shadows, shape corners) from `begin` to `end`. The `DecoratedBoxTransition` widget consumes this tween directly and computes the intermediate blended decoration states automatically on the fly during each animation frame.

2. **Performance Optimization**:
   - In React Native, animating layout styles (like `borderRadius` or `borderWidth`) cannot be offloaded to the native thread using `useNativeDriver: true`. This means animations running on standard React Native Animated API must run on the JavaScript thread (unless using Reanimated which runs on the UI thread), potentially leading to minor frame drops under load.
   - Flutter's `DecoratedBoxTransition` paints the intermediate decorations directly onto the hardware-accelerated canvas. This is extremely efficient and guarantees 60/120fps animations since no layout reflows or DOM changes are required.
''';
