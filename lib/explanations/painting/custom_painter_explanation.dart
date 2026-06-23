const String customPainterRnEquivalent = r'''
In Flutter, `CustomPainter` defines the drawing commands that are executed on a canvas. In React Native, Skia uses a declarative React-based wrapper (`<Canvas>` with nested shapes like `<Circle>`, `<Rect>`, `<Path>`), whereas web canvas or native Android (`View.onDraw`) / iOS (`UIView.draw`) use imperative code.

Here is how React Native Skia implements an imperative-style draw loop if you need to calculate rendering on-the-fly:

```jsx
// React Native (Shopify Skia Imperative drawing):
import React from 'react';
import { Canvas, useDrawCallback } from '@shopify/react-native-skia';

const ImperativePaintExample = () => {
  const onDraw = useDrawCallback((canvas, info) => {
    const paint = Skia.Paint();
    paint.setColor(Skia.Color("purple"));
    paint.setStrokeWidth(4);
    paint.setStyle(PaintStyle.Stroke);

    canvas.drawCircle(info.width / 2, info.height / 2, 80, paint);
  });

  return <Canvas style={{ flex: 1 }} onDraw={onDraw} />;
};
```

### Key Differences
1. **Lifecycle & Repainting Control**:
   - **Flutter**: `CustomPainter` uses the `shouldRepaint(CustomPainter oldDelegate)` method. This is a critical performance hook that determines if Flutter can skip the painting phase for this canvas and reuse the cached render layer. If the properties (like color or size) passed to the painter are identical to the previous render, returning `false` prevents costly re-draw cycles.
   - **React Native**: Uses standard React state diffing. If a prop changes on `<Circle>`, React re-renders the Skia component tree and updates the native Skia properties. For imperative draw callbacks, developers must manually optimize updates (e.g. using `useMemo` or React re-render controls).

2. **The Paint object**:
   - **Flutter**: You define a single `Paint` object and set properties like `.color`, `.style`, `.strokeWidth`, and `.antiAlias` before calling methods like `canvas.drawCircle(center, radius, paint)`.
   - **React Native**: React Native Skia allows passing styles directly as component properties on shape nodes (e.g., `<Circle color="purple" style="stroke" strokeWidth={4} />`) which internally instantiates and configures Skia `Paint` configurations under the hood.
''';
