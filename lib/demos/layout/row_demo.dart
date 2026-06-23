import 'package:flutter/material.dart';

class RowDemo extends StatefulWidget {
  const RowDemo({super.key});

  @override
  State<RowDemo> createState() => _RowDemoState();
}

class _RowDemoState extends State<RowDemo> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize _mainAxisSize = MainAxisSize.max;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Row lays out its children in a horizontal array. You can control '
          'its sizing (MainAxisSize) and child alignments (MainAxisAlignment/CrossAxisAlignment).',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Row(
            mainAxisAlignment: _mainAxisAlignment,
            crossAxisAlignment: _crossAxisAlignment,
            mainAxisSize: _mainAxisSize,
            children: [
              _Box(color: Colors.red, label: '1', height: 40),
              _Box(color: Colors.green, label: '2', height: 60),
              _Box(color: Colors.blue, label: '3', height: 50),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Sizing size
        Text('MainAxisSize:', style: theme.textTheme.labelMedium),
        const SizedBox(height: 6),
        Row(
          children: MainAxisSize.values.map((size) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                label: Text(size.name),
                selected: _mainAxisSize == size,
                onSelected: (selected) {
                  if (selected) setState(() => _mainAxisSize = size);
                },
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),

        // Main Axis Alignment
        Text('MainAxisAlignment:', style: theme.textTheme.labelMedium),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: MainAxisAlignment.values.map((align) {
            return ChoiceChip(
              label: Text(align.name),
              selected: _mainAxisAlignment == align,
              onSelected: (selected) {
                if (selected) setState(() => _mainAxisAlignment = align);
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 12),

        // Cross Axis Alignment
        Text('CrossAxisAlignment:', style: theme.textTheme.labelMedium),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          children: [
            CrossAxisAlignment.start,
            CrossAxisAlignment.center,
            CrossAxisAlignment.end,
            CrossAxisAlignment.stretch,
          ].map((align) {
            return ChoiceChip(
              label: Text(align.name),
              selected: _crossAxisAlignment == align,
              onSelected: (selected) {
                if (selected) setState(() => _crossAxisAlignment = align);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _Box extends StatelessWidget {
  final Color color;
  final String label;
  final double height;

  const _Box({required this.color, required this.label, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
