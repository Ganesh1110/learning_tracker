const String alignmentGeometryRnEquivalent = r'''
In React Native, layout styles are defined via properties like `left`, `right`, `start`, and `end` on the style object. React Native accepts either absolute layout values (`left`/`right`) or localization-aware layout values (`start`/`end`) on any component's style sheet.

In Flutter, `AlignmentGeometry` is the abstract base class that provides this polymorphic behavior. Both `Alignment` (absolute) and `AlignmentDirectional` (localized) extend `AlignmentGeometry`. Most widgets (like `Container` or `Align`) take `AlignmentGeometry` in their constructor, allowing you to pass either type transparently.
''';
