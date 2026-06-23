const String sizeTransitionRnEquivalent = r'''
In React Native, expanding/collapsing layouts is typically accomplished by animating stylesheet layout dimensions (like height or width) inside an `Animated.View` container.

Note that React Native layout animations require setting `overflow: "hidden"` style so that child bounds are clipped while the container size is collapsing, which is handled automatically by Flutter's `SizeTransition`.

### Key Properties
• `sizeFactor`: The Animation<double> turns/scale driving the sizes.
• `axis`: Scroll axis (Axis.vertical reveals height, Axis.horizontal reveals width).
• `axisAlignment`: Alignment origin value (-1.0 reveals from start, 0.0 center, 1.0 end).
• `child`: The widget being clipped/revealed.
''';
