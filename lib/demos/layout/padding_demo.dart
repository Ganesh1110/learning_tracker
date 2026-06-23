import 'package:flutter/material.dart';

class PaddingDemo extends StatefulWidget {
  const PaddingDemo({super.key});

  @override
  State<PaddingDemo> createState() => _PaddingDemoState();
}

class _PaddingDemoState extends State<PaddingDemo> {
  double _top = 8;
  double _right = 8;
  double _bottom = 8;
  double _left = 8;
  bool _symmetric = true;

  EdgeInsets get _padding => _symmetric
      ? EdgeInsets.symmetric(
          horizontal: _left, vertical: _top)
      : EdgeInsets.fromLTRB(_left, _top, _right, _bottom);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Padding adds empty space around its child. Equivalent to '
          'the padding style prop on a React Native View.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Visual demo
        Center(
          child: Container(
            color: Colors.indigo.withAlpha(40),
            child: Padding(
              padding: _padding,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Child widget',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'Blue area = Padding  •  Indigo box = child',
              style: theme.textTheme.bodySmall
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Mode toggle
        Row(
          children: [
            const Text('Symmetric'),
            Switch(
              value: _symmetric,
              onChanged: (v) => setState(() => _symmetric = v),
            ),
            const Text('LTRB'),
          ],
        ),

        const SizedBox(height: 4),

        if (_symmetric) ...[
          _SliderRow(
            label: 'H: ${_left.toInt()}',
            value: _left,
            onChanged: (v) => setState(() => _left = v),
          ),
          _SliderRow(
            label: 'V: ${_top.toInt()}',
            value: _top,
            onChanged: (v) => setState(() => _top = v),
          ),
        ] else ...[
          _SliderRow(
              label: 'Left: ${_left.toInt()}',
              value: _left,
              onChanged: (v) => setState(() => _left = v)),
          _SliderRow(
              label: 'Top: ${_top.toInt()}',
              value: _top,
              onChanged: (v) => setState(() => _top = v)),
          _SliderRow(
              label: 'Right: ${_right.toInt()}',
              value: _right,
              onChanged: (v) => setState(() => _right = v)),
          _SliderRow(
              label: 'Bottom: ${_bottom.toInt()}',
              value: _bottom,
              onChanged: (v) => setState(() => _bottom = v)),
        ],
      ],
    );
  }
}

class _SliderRow extends StatelessWidget {
  const _SliderRow(
      {required this.label,
      required this.value,
      required this.onChanged});
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 80,
            child: Text(label,
                style: Theme.of(context).textTheme.bodySmall)),
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 48,
            divisions: 12,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
