const String sizedOverflowBoxRnEquivalent = r'''
In React Native, layout overflow behaviors are configured directly using stylesheets:
• `{ overflow: "visible" }` (default): allows children to draw outside the view boundaries, which maps to a standard `SizedOverflowBox` without clipping.
• `{ overflow: "hidden" }`: clips overflowing content, comparable to wrapping `SizedOverflowBox` inside a `ClipRect` widget.

### Key Properties
• `size`: The virtual layout size associated with this container.
• `alignment`: Alignment of child relative to parent bounds (defaults to Alignment.center).
• `child`: The child element which is allowed to overflow.
''';
