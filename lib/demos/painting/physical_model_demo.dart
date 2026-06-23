import 'package:flutter/material.dart';

class PhysicalModelDemo extends StatefulWidget {
  const PhysicalModelDemo({super.key});

  @override
  State<PhysicalModelDemo> createState() => _PhysicalModelDemoState();
}

class _PhysicalModelDemoState extends State<PhysicalModelDemo> {
  double _elevation = 8;
  Color _color = Colors.white;
  Color _shadowColor = Colors.black;
  double _borderRadius = 12;

  static const _colors = [
    Colors.white,
    Colors.indigo,
    Colors.teal,
    Colors.deepOrange,
    Colors.pink,
  ];

  static const _shadowColors = [
    Colors.black,
    Colors.indigo,
    Colors.deepPurple,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PhysicalModel applies a material shadow with configurable '
          'elevation, color, shadow color, and border radius. It is the '
          'low-level widget behind Card and Material.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 20),

        // Live demo card
        Center(
          child: AnimatedPhysicalModel(
            duration: const Duration(milliseconds: 300),
            elevation: _elevation,
            color: _color,
            shadowColor: _shadowColor,
            borderRadius: BorderRadius.circular(_borderRadius),
            shape: BoxShape.rectangle,
            child: SizedBox(
              width: 180,
              height: 90,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.layers_rounded, size: 28),
                    const SizedBox(height: 4),
                    Text(
                      'Elevation: ${_elevation.toInt()}',
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Elevation slider
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text('Elevation: ${_elevation.toInt()}',
                    style: theme.textTheme.bodySmall)),
            Expanded(
              child: Slider(
                value: _elevation,
                min: 0,
                max: 24,
                divisions: 24,
                label: '${_elevation.toInt()}',
                onChanged: (v) => setState(() => _elevation = v),
              ),
            ),
          ],
        ),

        // Border radius slider
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text('Radius: ${_borderRadius.toInt()}',
                    style: theme.textTheme.bodySmall)),
            Expanded(
              child: Slider(
                value: _borderRadius,
                min: 0,
                max: 45,
                divisions: 9,
                label: '${_borderRadius.toInt()}',
                onChanged: (v) =>
                    setState(() => _borderRadius = v),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Color picker
        Text('Surface Color', style: theme.textTheme.labelMedium),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          children: _colors
              .map((c) => GestureDetector(
                    onTap: () => setState(() => _color = c),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: c,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _color == c
                              ? theme.colorScheme.primary
                              : Colors.grey.shade300,
                          width: _color == c ? 2.5 : 1,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 10),

        // Shadow color picker
        Text('Shadow Color', style: theme.textTheme.labelMedium),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          children: _shadowColors
              .map((c) => GestureDetector(
                    onTap: () => setState(() => _shadowColor = c),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: c,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _shadowColor == c
                              ? theme.colorScheme.primary
                              : Colors.grey.shade300,
                          width: _shadowColor == c ? 2.5 : 1,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
