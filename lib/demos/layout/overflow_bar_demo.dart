import 'package:flutter/material.dart';

class OverflowBarDemo extends StatefulWidget {
  const OverflowBarDemo({super.key});

  @override
  State<OverflowBarDemo> createState() => _OverflowBarDemoState();
}

class _OverflowBarDemoState extends State<OverflowBarDemo> {
  // OverflowBar.alignment is MainAxisAlignment (row direction)
  MainAxisAlignment _rowAlignment = MainAxisAlignment.start;
  // OverflowBar.overflowAlignment is OverflowBarAlignment (column direction)
  OverflowBarAlignment _overflowAlignment = OverflowBarAlignment.start;
  double _spacing = 8.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OverflowBar lays out children in a row. When they overflow '
          'the available width it switches to a column layout automatically.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live demo area
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: OverflowBar(
            spacing: _spacing,
            alignment: _rowAlignment,
            overflowAlignment: _overflowAlignment,
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text('Confirm'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Learn more'),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Spacing slider
        Row(
          children: [
            Text('Spacing: ${_spacing.toInt()}px',
                style: theme.textTheme.bodySmall),
            Expanded(
              child: Slider(
                value: _spacing,
                min: 0,
                max: 40,
                divisions: 8,
                label: '${_spacing.toInt()}',
                onChanged: (v) => setState(() => _spacing = v),
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),
        // Row alignment chips
        Text('Row Alignment (MainAxisAlignment)',
            style: theme.textTheme.labelMedium),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          children: [
            MainAxisAlignment.start,
            MainAxisAlignment.center,
            MainAxisAlignment.end,
            MainAxisAlignment.spaceBetween,
            MainAxisAlignment.spaceEvenly,
          ].map((a) {
            return ChoiceChip(
              label: Text(a.name),
              selected: _rowAlignment == a,
              onSelected: (_) => setState(() => _rowAlignment = a),
            );
          }).toList(),
        ),

        const SizedBox(height: 8),
        // Overflow alignment chips
        Text('Overflow Alignment (OverflowBarAlignment)',
            style: theme.textTheme.labelMedium),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          children: OverflowBarAlignment.values.map((a) {
            return ChoiceChip(
              label: Text(a.name),
              selected: _overflowAlignment == a,
              onSelected: (_) =>
                  setState(() => _overflowAlignment = a),
            );
          }).toList(),
        ),
      ],
    );
  }
}
