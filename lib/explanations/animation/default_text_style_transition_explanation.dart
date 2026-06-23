const String defaultTextStyleTransitionRnEquivalent = r'''
In React Native, animating text styling requires using the `Animated` library (e.g., `Animated.Text`) or `react-native-reanimated`. We interpolate animated values into style properties like font size, line height, and color.

```jsx
// React Native - Animating Font Size using Animated API:
import React, { useRef } from 'react';
import { Animated, Button, View, StyleSheet } from 'react-native';

const AnimatedTextDemo = () => {
  const animValue = useRef(new Animated.Value(0)).current;

  const startAnimation = () => {
    Animated.timing(animValue, {
      toValue: 1,
      duration: 1000,
      useNativeDriver: false, // Text size styling cannot use native driver
    }).start();
  };

  const fontSize = animValue.interpolate({
    inputRange: [0, 1],
    outputRange: [16, 32],
  });

  const textColor = animValue.interpolate({
    inputRange: [0, 1],
    outputRange: ['rgba(0,0,255,1)', 'rgba(128,0,128,1)'],
  });

  return (
    <View style={styles.container}>
      <Animated.Text style={{ fontSize, color: textColor }}>
        MORPHING TEXT
      </Animated.Text>
      <Button title="Animate" onPress={startAnimation} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    padding: 16,
    alignItems: 'center',
  },
});
```

### The Difference in Flutter
Flutter's `DefaultTextStyleTransition` acts as an animation listener wrapper. It takes an `Animation<TextStyle>` (usually created via a `TextStyleTween` coupled with an `AnimationController`) and updates the default styling of all child `Text` widgets continuously as the animation ticks.

Unlike React Native, where interpolations must be declared item-by-item (`fontSize`, `color`, `letterSpacing`), Flutter's `TextStyleTween` handles the interpolation of all text properties (color, sizes, shadows, weight, letter-spacing, height) automatically in one single Tween mapping.
''';
