import 'package:flutter/material.dart';

class RotatedBoxDemo extends StatefulWidget {
  const RotatedBoxDemo({super.key});

  @override
  State<RotatedBoxDemo> createState() => _RotatedBoxDemoState();
}

class _RotatedBoxDemoState extends State<RotatedBoxDemo> {
  int _quarterTurns = 1;
  bool _useRotatedBox = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // The widget to rotate
    final rotatedChild = Container(
      width: 140,
      height: 70,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.teal, Colors.green],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Rotated Widget',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RotatedBox rotates its child by increments of 90 degrees. Unlike '
          'Transform.rotate, it updates the layout bounds, affecting parent layout.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area with container showing layout bounds
        Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.redAccent.withOpacity(0.5),
                width: 1.5,
              ),
            ),
            child: _useRotatedBox
                ? RotatedBox(
                    quarterTurns: _quarterTurns,
                    child: rotatedChild,
                  )
                : Transform.rotate(
                    angle: _quarterTurns * (3.14159265 / 2),
                    child: rotatedChild,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Center(
            child: Text(
              _useRotatedBox
                  ? '⬆ RotatedBox: Red border fits the rotated dimensions.'
                  : '⬆ Transform.rotate: Red border keeps original horizontal bounds (clipping might occur).',
              style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic, fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Turns Selector (Quarter Turns)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quarter Turns (90°):', style: theme.textTheme.bodySmall),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 0, label: Text('0°')),
                ButtonSegment(value: 1, label: Text('90°')),
                ButtonSegment(value: 2, label: Text('180°')),
                ButtonSegment(value: 3, label: Text('270°')),
              ],
              selected: {_quarterTurns},
              onSelectionChanged: (val) {
                setState(() => _quarterTurns = val.first);
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Widget Selector
        Row(
          children: [
            const Text('Transform.rotate'),
            Switch(
              value: _useRotatedBox,
              onChanged: (v) => setState(() => _useRotatedBox = v),
            ),
            const Text('RotatedBox'),
          ],
        ),
      ],
    );
  }
}
