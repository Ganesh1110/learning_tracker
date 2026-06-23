import 'package:flutter/material.dart';

class IntrinsicHeightDemo extends StatefulWidget {
  const IntrinsicHeightDemo({super.key});

  @override
  State<IntrinsicHeightDemo> createState() => _IntrinsicHeightDemoState();
}

class _InteractiveColumn extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  final Color textColor;

  const _InteractiveColumn({
    required this.title,
    required this.content,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              content,
              style: TextStyle(
                color: textColor.withValues(alpha: 0.8),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntrinsicHeightDemoState extends State<IntrinsicHeightDemo> {
  bool _useIntrinsicHeight = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Define columns content
    final rowContent = [
      _InteractiveColumn(
        title: 'Short Column',
        content: 'This column only has a tiny amount of text.',
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.7),
        textColor: theme.colorScheme.onPrimaryContainer,
      ),
      VerticalDivider(
        width: 16,
        thickness: 3,
        color: theme.colorScheme.primary,
      ),
      _InteractiveColumn(
        title: 'Tall Column',
        content: 'This column contains significantly more text content, causing it to occupy more vertical space than the others. Under normal Row rules, neighboring columns do not match this height.',
        color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.7),
        textColor: theme.colorScheme.onSecondaryContainer,
      ),
      VerticalDivider(
        width: 16,
        thickness: 3,
        color: theme.colorScheme.secondary,
      ),
      _InteractiveColumn(
        title: 'Medium Column',
        content: 'Moderate height details go here in this third container.',
        color: theme.colorScheme.tertiaryContainer.withValues(alpha: 0.7),
        textColor: theme.colorScheme.onTertiaryContainer,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 0,
          color: theme.colorScheme.surfaceContainerLow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IntrinsicHeight Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Normally, Row children expand independently. Wrapping a Row in IntrinsicHeight dynamically forces all children to match the height of the tallest child.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Wrap in IntrinsicHeight', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Toggle to see the columns adjust height and dividers render'),
                  value: _useIntrinsicHeight,
                  onChanged: (val) => setState(() => _useIntrinsicHeight = val),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: _useIntrinsicHeight
              ? IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: rowContent,
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: rowContent,
                ),
        ),
      ],
    );
  }
}
