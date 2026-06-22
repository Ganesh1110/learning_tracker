const String clipRSuperellipseRnEquivalent = r'''
In React Native, clipping a view to a superellipse (frequently called a "squircle" or "smooth corners" layout, popularized by iOS app icons and hardware designs) is not natively supported by the standard `StyleSheet` properties. All React Native `borderRadius` properties default to standard circular arc corners.

To implement a squircle or superellipse shape in React Native, developers must use third-party libraries or custom SVG layers:
1. **`react-native-figma-squircle`** or **`react-native-smooth-corners`**: Third-party packages that use native implementations (like iOS `CALayer.cornerCurve = 'continuous'`) or custom canvas drawing to overlay squircle-shaped mask views.
2. **`react-native-svg`**: Implementing custom SVG paths using Bezier curve calculations to draw squircle bounds manually.
3. **`@shopify/react-native-skia`**: Drawing custom squircle paths programmatically using Skia's drawing APIs.

```jsx
// React Native: Approximating a squircle using SVG
import React from 'react';
import { View, StyleSheet } from 'react-native';
import Svg, { Path } from 'react-native-svg';

const SquircleBox = ({ size = 150, color = '#6200ee' }) => {
  // A mathematically generated superellipse path for size 150
  const pathData = "M 75,0 C 135,0 150,15 150,75 C 150,135 135,150 75,150 C 15,150 0,135 0,75 C 0,15 15,0 75,0 Z";

  return (
    <View style={styles.container}>
      <Svg width={size} height={size} viewBox="0 0 150 150">
        <Path d={pathData} fill={color} />
      </Svg>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    justifyContent: 'center',
  },
});
```

### Key Differences
1. **Standard System-Level Squircle Clipping**:
   - **React Native**: Since Yoga and cross-platform native rendering engines do not expose iOS's continuous corner curves globally (Android does not have a direct native equivalency; it must draw customized paths), creating smooth continuous corners is a non-trivial styling task, often requiring separate drawing canvases or third-party wrappers.
   - **Flutter**: Flutter's **`ClipRSuperellipse`** widget provides direct, system-level clipping using a superellipse shape (squircle). Because Flutter controls the full pixel pipeline, it renders mathematically precise continuous curves on *both* Android and iOS out-of-the-box, without needing separate platform-specific layout files or SVG packages.

2. **Corner Curve Smoothness**:
   - Standard rounded rectangles (`ClipRRect` / React Native `borderRadius`) connect a straight line to a circular arc at the corner, creating an abrupt change in curvature (known as a tangent discontinuity in design).
   - Superellipses (`ClipRSuperellipse`) smoothly transition from the straight edge into the curve, avoiding visual corner "hinges" or sharp transitions.
''';
