import 'dart:math' as math;
import 'package:flutter/material.dart';

class ContainerDemo extends StatefulWidget {
  const ContainerDemo({super.key});

  @override
  State<ContainerDemo> createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  double _padding = 16.0;
  double _margin = 16.0;
  double _radius = 16.0;
  double _borderWidth = 2.0;
  double _rotationAngle = 0.0; // In degrees
  Alignment _alignment = Alignment.center;

  final Map<String, Alignment> _alignments = {
    'Center': Alignment.center,
    'Top Left': Alignment.topLeft,
    'Bottom Right': Alignment.bottomRight,
    'Top Right': Alignment.topRight,
    'Bottom Left': Alignment.bottomLeft,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Container Styling Properties',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Padding Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Padding: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _padding,
                    min: 0.0,
                    max: 40.0,
                    onChanged: (val) => setState(() => _padding = val),
                  ),
                ),
                Text('${_padding.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Margin Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Margin: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _margin,
                    min: 0.0,
                    max: 40.0,
                    onChanged: (val) => setState(() => _margin = val),
                  ),
                ),
                Text('${_margin.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Border Radius Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Radius: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _radius,
                    min: 0.0,
                    max: 60.0,
                    onChanged: (val) => setState(() => _radius = val),
                  ),
                ),
                Text('${_radius.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Border Width Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Border: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _borderWidth,
                    min: 0.0,
                    max: 10.0,
                    onChanged: (val) => setState(() => _borderWidth = val),
                  ),
                ),
                Text('${_borderWidth.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Rotation Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Rotate: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _rotationAngle,
                    min: 0.0,
                    max: 360.0,
                    onChanged: (val) => setState(() => _rotationAngle = val),
                  ),
                ),
                Text('${_rotationAngle.toStringAsFixed(0)}°', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Child Alignment
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Child Align: '),
                DropdownButton<Alignment>(
                  value: _alignment,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _alignment = val);
                    }
                  },
                  items: _alignments.entries.map((e) {
                    return DropdownMenuItem(value: e.value, child: Text(e.key));
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Container(
            // Outer container simulating parent constraints limits
            width: 260,
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              // The main Container under test
              margin: EdgeInsets.all(_margin),
              padding: EdgeInsets.all(_padding),
              alignment: _alignment,
              transform: Matrix4.rotationZ(_rotationAngle * math.pi / 180.0),
              transformAlignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(_radius),
                border: _borderWidth > 0
                    ? Border.all(color: theme.colorScheme.tertiary, width: _borderWidth)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.home,
                    color: theme.colorScheme.primary,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
