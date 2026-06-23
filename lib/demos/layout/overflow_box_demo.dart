import 'package:flutter/material.dart';

class OverflowBoxDemo extends StatefulWidget {
  const OverflowBoxDemo({super.key});

  @override
  State<OverflowBoxDemo> createState() => _OverflowBoxDemoState();
}

class _OverflowBoxDemoState extends State<OverflowBoxDemo> {
  double _maxWidth = 180;
  double _maxHeight = 80;
  bool _useOverflowBox = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final child = Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.teal, Colors.cyan],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          '200 × 100\nChild',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OverflowBox imposes its own max constraints on its child, '
          'allowing the child to paint outside the parent\'s boundaries.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Toggle
        Row(
          children: [
            const Text('Without'),
            Switch(
              value: _useOverflowBox,
              onChanged: (v) => setState(() => _useOverflowBox = v),
            ),
            const Text('OverflowBox'),
          ],
        ),
        const SizedBox(height: 8),

        // Container with clipping to show overflow boundary
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.deepPurple,
              width: 2,
            ),
          ),
          child: ClipRect(
            clipBehavior: _useOverflowBox
                ? Clip.none // let overflow show
                : Clip.hardEdge,
            child: Center(
              child: _useOverflowBox
                  ? OverflowBox(
                      maxWidth: _maxWidth,
                      maxHeight: _maxHeight,
                      child: child,
                    )
                  : SizedBox(
                      width: _maxWidth,
                      height: _maxHeight,
                      child: child,
                    ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            _useOverflowBox
                ? '⬆ Child overflows the purple border (OverflowBox allows it)'
                : '⬆ Child is clipped to the parent boundary (no OverflowBox)',
            style: theme.textTheme.bodySmall
                ?.copyWith(fontStyle: FontStyle.italic),
          ),
        ),

        const SizedBox(height: 12),

        // Sliders
        _Slider(
          label: 'maxWidth: ${_maxWidth.toInt()}',
          value: _maxWidth,
          min: 80,
          max: 280,
          onChanged: (v) => setState(() => _maxWidth = v),
        ),
        _Slider(
          label: 'maxHeight: ${_maxHeight.toInt()}',
          value: _maxHeight,
          min: 40,
          max: 180,
          onChanged: (v) => setState(() => _maxHeight = v),
        ),
      ],
    );
  }
}

class _Slider extends StatelessWidget {
  const _Slider({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });
  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 140,
            child: Text(label,
                style: Theme.of(context).textTheme.bodySmall)),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
