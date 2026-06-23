import 'package:flutter/material.dart';

class PlaceholderDemo extends StatefulWidget {
  const PlaceholderDemo({super.key});

  @override
  State<PlaceholderDemo> createState() => _PlaceholderDemoState();
}

class _PlaceholderDemoState extends State<PlaceholderDemo> {
  double _strokeWidth = 2.0;
  double _fallbackHeight = 100.0;
  double _fallbackWidth = 100.0;
  Color _color = Colors.blueGrey;
  bool _constrained = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final placeholder = Placeholder(
      strokeWidth: _strokeWidth,
      fallbackHeight: _fallbackHeight,
      fallbackWidth: _fallbackWidth,
      color: _color,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Placeholder draws a box with a diagonal X to represent where '
          'other widgets will eventually be added. It fills parent constraints or '
          'uses fallback dimensions if unconstrained.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: _constrained
                ? SizedBox(
                    width: 140,
                    height: 100,
                    child: placeholder,
                  )
                : UnconstrainedBox(
                    child: placeholder,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Center(
            child: Text(
              _constrained
                  ? 'Constrained: Fills the 140 × 100 SizedBox parent.'
                  : 'Unconstrained: Uses fallbackWidth (${_fallbackWidth.toInt()}) × fallbackHeight (${_fallbackHeight.toInt()}).',
              style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Constraint toggle
        Row(
          children: [
            const Text('Unconstrained Mode:'),
            Switch(
              value: !_constrained,
              onChanged: (v) => setState(() => _constrained = !v),
            ),
          ],
        ),

        // Stroke Width slider
        Row(
          children: [
            SizedBox(
              width: 130,
              child: Text('strokeWidth: ${_strokeWidth.toStringAsFixed(1)}',
                  style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _strokeWidth,
                min: 1.0,
                max: 10.0,
                onChanged: (v) => setState(() => _strokeWidth = v),
              ),
            ),
          ],
        ),

        // Fallback Width slider
        Row(
          children: [
            SizedBox(
              width: 130,
              child: Text('fallbackWidth: ${_fallbackWidth.toInt()}',
                  style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _fallbackWidth,
                min: 50,
                max: 200,
                onChanged: (v) => setState(() => _fallbackWidth = v),
              ),
            ),
          ],
        ),

        // Fallback Height slider
        Row(
          children: [
            SizedBox(
              width: 130,
              child: Text('fallbackHeight: ${_fallbackHeight.toInt()}',
                  style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _fallbackHeight,
                min: 50,
                max: 200,
                onChanged: (v) => setState(() => _fallbackHeight = v),
              ),
            ),
          ],
        ),

        // Colors
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Placeholder Color:', style: theme.textTheme.bodySmall),
            Row(
              children: [Colors.blueGrey, Colors.red, Colors.deepPurple, Colors.teal].map((c) {
                return GestureDetector(
                  onTap: () => setState(() => _color = c),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: c,
                      shape: BoxShape.circle,
                      border: _color == c
                          ? Border.all(color: theme.colorScheme.primary, width: 2)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
