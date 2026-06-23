const String interactiveViewerRnEquivalent = r'''
In React Native, layout pan/zoom containers are not supported out-of-the-box in a cross-platform way.

### React Native Zooming (iOS Only)
The standard `<ScrollView>` component supports basic zooming out-of-the-box, but **only on iOS**:

```jsx
import React from 'react';
import { ScrollView, Image, StyleSheet } from 'react-native';

const iOSZoomable = () => (
  <ScrollView
    minimumZoomScale={0.5}
    maximumZoomScale={3.0}
    style={styles.container}
  >
    <Image 
      source={{ uri: 'https://example.com/map.png' }} 
      style={styles.image} 
    />
  </ScrollView>
);

const styles = StyleSheet.create({
  container: { flex: 1 },
  image: { width: 400, height: 400 }
});
```

### React Native Cross-Platform Zooming (Android & iOS)
For Android support and advanced panning, React Native developers must use third-party gesture libraries (like `react-native-gesture-handler` and `react-native-reanimated`) to programmatically manipulate container style offsets:

```jsx
// React Native (requires gesture and animation libraries)
import React from 'react';
import { StyleSheet } from 'react-native';
import { Gesture, GestureDetector } from 'react-native-gesture-handler';
import Animated, { useSharedValue, useAnimatedStyle } from 'react-native-reanimated';

const ZoomableCanvas = () => {
  const scale = useSharedValue(1);
  const savedScale = useSharedValue(1);

  const pinchGesture = Gesture.Pinch()
    .onUpdate((e) => {
      scale.value = savedScale.value * e.scale;
    })
    .onEnd(() => {
      savedScale.value = scale.value;
    });

  const animatedStyle = useAnimatedStyle(() => ({
    transform: [{ scale: scale.value }],
  }));

  return (
    <GestureDetector gesture={pinchGesture}>
      <Animated.View style={[styles.canvas, animatedStyle]}>
        {/* Child components */}
      </Animated.View>
    </GestureDetector>
  );
};
```

### The Difference in Flutter
Flutter includes `InteractiveViewer` directly in the core widgets toolkit. It provides cross-platform zooming, panning, and scaling natively for any arbitrary widget subtree (images, shapes, custom canvas layouts).

It features:
1. **Interactive Transforms**: Direct integration of touch matrices (`Matrix4`).
2. **Boundary Restrictions**: `boundaryMargin` and limits to prevent users from scrolling content completely off-screen.
3. **Programmatic Alignment**: Direct control of scale, translation, and rotational viewport matrices using a `TransformationController`.
4. **Interaction Controls**: Easy configuration using `panEnabled`, `scaleEnabled`, `minScale`, and `maxScale` options directly as props.
''';
