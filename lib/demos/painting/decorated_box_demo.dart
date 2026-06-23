import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatefulWidget {
  const DecoratedBoxDemo({super.key});

  @override
  State<DecoratedBoxDemo> createState() => _DecoratedBoxDemoState();
}

class _DecoratedBoxDemoState extends State<DecoratedBoxDemo> {
  double _borderRadius = 16.0;
  double _borderWidth = 3.0;
  double _shadowBlur = 10.0;
  String _gradientType = 'Linear';
  DecorationPosition _position = DecorationPosition.background;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Setup linear or radial gradient
    final Gradient gradient = _gradientType == 'Linear'
        ? LinearGradient(
            colors: [theme.colorScheme.primaryContainer, theme.colorScheme.tertiaryContainer],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : RadialGradient(
            colors: [theme.colorScheme.primaryContainer, theme.colorScheme.surfaceContainerHighest],
            radius: 0.8,
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'DecoratedBox Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Border Radius Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Corner Radius: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _borderRadius,
                    min: 0.0,
                    max: 40.0,
                    onChanged: (val) => setState(() => _borderRadius = val),
                  ),
                ),
                Text('${_borderRadius.toStringAsFixed(0)}px'),
              ],
            ),

            // Border Width Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Border Width: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _borderWidth,
                    min: 0.0,
                    max: 8.0,
                    onChanged: (val) => setState(() => _borderWidth = val),
                  ),
                ),
                Text('${_borderWidth.toStringAsFixed(1)}px'),
              ],
            ),

            // Shadow Blur Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Shadow Blur: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _shadowBlur,
                    min: 0.0,
                    max: 24.0,
                    onChanged: (val) => setState(() => _shadowBlur = val),
                  ),
                ),
                Text('${_shadowBlur.toStringAsFixed(0)}px'),
              ],
            ),

            // Gradient Type ChoiceChips
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Gradient: '),
                ChoiceChip(
                  label: const Text('Linear'),
                  selected: _gradientType == 'Linear',
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _gradientType = 'Linear');
                    }
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Radial'),
                  selected: _gradientType == 'Radial',
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _gradientType = 'Radial');
                    }
                  },
                ),
              ],
            ),

            // Position ChoiceChips
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Draw Layer: '),
                ChoiceChip(
                  label: const Text('Background'),
                  selected: _position == DecorationPosition.background,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _position = DecorationPosition.background);
                    }
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Foreground'),
                  selected: _position == DecorationPosition.foreground,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _position = DecorationPosition.foreground);
                    }
                  },
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
        const SizedBox(height: 8),
        Text(
          _position == DecorationPosition.foreground
              ? 'Foreground position: The decoration is painted over the child, partially obscuring the content.'
              : 'Background position: The decoration is painted behind the child, acting as a background style.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 16),

        Center(
          child: DecoratedBox(
            position: _position,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(_borderRadius),
              border: Border.all(
                color: theme.colorScheme.primary,
                width: _borderWidth,
              ),
              boxShadow: [
                if (_shadowBlur > 0)
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: _shadowBlur,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Decorated Child Text',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Paints: ${_position.name.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 11,
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
