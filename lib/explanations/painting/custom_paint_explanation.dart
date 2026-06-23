const String customPaintRnEquivalent = r'''
In React Native, custom rendering or canvas-based drawing is not supported out-of-the-box in the core library. To draw custom shapes, paths, lines, and curves, React Native developers rely on two primary third-party libraries:
1. **`react-native-svg`**: For vector graphics, paths, shapes, and clip paths.
2. **`@shopify/react-native-skia`**: A high-performance 2D graphics engine (built on top of Skia, the same engine Flutter uses) which provides a GPU-accelerated canvas API.

Here is how you draw custom graphics in React Native using Skia:

```jsx
// React Native (Shopify Skia):
import React from 'react';
import { Canvas, Circle, Rect, Line, Paint } from '@shopify/react-native-skia';

const CustomPaintExample = () => {
  return (
    <Canvas style={{ width: 300, height: 260 }}>
      {/* Draw a circle */}
      <Circle cx={150} cy={130} r={80}>
        <Paint color="purple" style="stroke" strokeWidth={4} />
      </Circle>
    </Canvas>
  );
};
```

Alternatively, using SVG:

```jsx
// React Native (react-native-svg):
import React from 'react';
import Svg, { Circle } from 'react-native-svg';

const CustomPaintSvgExample = () => {
  return (
    <Svg width="300" height="260">
      <Circle cx="150" cy="130" r="80" fill="none" stroke="purple" strokeWidth="4" />
    </Svg>
  );
};
```

### Key Differences
1. **Core vs. Third-Party**:
   - **Flutter**: Custom drawing is a first-class citizen of the core SDK via `CustomPaint` and the `Canvas` API. You don't need any external dependencies.
   - **React Native**: Requires installing external native modules like Skia or SVG, which adds package overhead and potential native linking issues.

2. **Render Loop & Composition**:
   - **Flutter**: `CustomPaint` can sit anywhere in the widget tree. It takes a `child` widget, which lets you render text or other complex layouts *under* or *over* the custom painted background/foreground depending on whether you use the `painter` or `foregroundPainter` properties.
   - **React Native**: React Native Skia canvas draws relative to its absolute container coordinates. Overlaying native UI elements (like a `<Text>` component) directly on top of Skia layers requires absolute layout composition (e.g. wrapping everything in a `<View>` with absolute layers).
''';
