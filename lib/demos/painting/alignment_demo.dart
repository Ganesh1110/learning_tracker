import 'package:flutter/material.dart';

class AlignmentDemo extends StatefulWidget {
  const AlignmentDemo({super.key});

  @override
  State<AlignmentDemo> createState() => _AlignmentDemoState();
}

class _AlignmentDemoState extends State<AlignmentDemo> {
  double _x = 0.0;
  double _y = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Coordinates display
        Text(
          'Alignment(${_x.toStringAsFixed(2)}, ${_y.toStringAsFixed(2)})',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),

        // Sliders for X and Y coordinates
        Row(
          children: [
            const Text('X: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: Slider(
                value: _x,
                min: -1.0,
                max: 1.0,
                onChanged: (val) => setState(() => _x = val),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Y: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: Slider(
                value: _y,
                min: -1.0,
                max: 1.0,
                onChanged: (val) => setState(() => _y = val),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Grid canvas
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              // Axis lines for visualization
              Center(
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              Center(
                child: Container(
                  width: 1,
                  height: double.infinity,
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              // Coordinate labels
              const Align(
                alignment: Alignment(-0.95, -0.9),
                child: Text('(-1, -1)', style: TextStyle(fontSize: 9, color: Colors.grey)),
              ),
              const Align(
                alignment: Alignment(0.95, 0.9),
                child: Text('(1, 1)', style: TextStyle(fontSize: 9, color: Colors.grey)),
              ),
              const Align(
                alignment: Alignment(0.08, -0.08),
                child: Text('(0, 0)', style: TextStyle(fontSize: 9, color: Colors.grey)),
              ),
              // Aligned widget
              Align(
                alignment: Alignment(_x, _y),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: const Icon(Icons.location_searching_rounded, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
