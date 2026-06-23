const String fadeTransitionRnEquivalent = r'''
In React Native, animating opacity is done using the standard `Animated` library (e.g. `Animated.View` with `opacity` styling) or using `react-native-reanimated`.

```jsx
// React Native - Opacity Fade Animation:
import React, { useRef } from 'react';
import { Animated, View, StyleSheet, Button } from 'react-native';

const FadeDemo = () => {
  const fadeAnim = useRef(new Animated.Value(0)).current;

  const fadeIn = () => {
    Animated.timing(fadeAnim, {
      toValue: 1,
      duration: 1000,
      useNativeDriver: true, // Animates on the native UI thread
    }).start();
  };

  return (
    <View style={styles.container}>
      <Animated.View style={[styles.card, { opacity: fadeAnim }]} />
      <Button title="Fade In" onPress={fadeIn} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  card: { width: 150, height: 100, backgroundColor: 'purple', borderRadius: 8 },
});
```

### The Difference in Flutter
In Flutter, `FadeTransition` is an explicit animation widget. It accepts an `Animation<double>` directly into its `opacity` parameter.

Key advantages in Flutter:
1. **Performance**: It maps directly to an opacity layer in the graphics compositor. The descendant widget tree is NOT rebuilt on every frame; only the paint-phase alpha compositor is updated.
2. **Clean separation**: By using transition widgets, you don't need to wrap your layouts in general-purpose builder callbacks (like `AnimatedBuilder`), keeping layout hierarchies readable.
''';
