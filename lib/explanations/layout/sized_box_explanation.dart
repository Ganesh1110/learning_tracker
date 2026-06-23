const String sizedBoxRnEquivalent = r'''
In React Native, layout dimensions are set directly inside style objects:
• `<View style={{ width: 100, height: 100 }} />` maps to a default `SizedBox`.
• `<View style={{ alignSelf: "stretch", flex: 1 }} />` is comparable to `SizedBox.expand()`.
• Empty spacer items `<View style={{ height: 16 }} />` are used to add margins between elements, similar to Flutter's standard empty `SizedBox(height: 16)`.

### Best Practices
• Spacing: Prefer using const `SizedBox(width/height)` for adding margins between Column/Row children, rather than Padding. Const SizedBox has extremely low compile overhead.
• Sizing constraints: Use `SizedBox` to lock button widths or aspect structures.
''';
