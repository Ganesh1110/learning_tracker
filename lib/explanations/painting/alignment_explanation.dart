const String alignmentRnEquivalent = r'''
In React Native, coordinates or percentage-based positioning is defined using absolute numbers or percentages in style properties (e.g. `top: '20%'`, `left: '50%'`, or `transform: [{ translateX: -50 }, { translateY: -50 }]` for anchoring).

In Flutter, the `Alignment` class represents a point within a rectangle using a fractional coordinate system:
- **`Alignment(0.0, 0.0)`** represents the exact **center** of the box.
- **`Alignment(-1.0, -1.0)`** is the **top left**.
- **`Alignment(1.0, 1.0)`** is the **bottom right**.

This coordinate system makes it easy to specify custom alignment points (like `Alignment(-0.5, 0.5)`) which automatically scale regardless of the absolute width and height of the parent container.
''';
