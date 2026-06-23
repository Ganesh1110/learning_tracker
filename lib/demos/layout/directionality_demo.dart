import 'package:flutter/material.dart';

class DirectionalityDemo extends StatefulWidget {
  const DirectionalityDemo({super.key});

  @override
  State<DirectionalityDemo> createState() => _DirectionalityDemoState();
}

class _DirectionalityDemoState extends State<DirectionalityDemo> {
  TextDirection _textDirection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  'Directionality Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SegmentedButton<TextDirection>(
                  segments: const [
                    ButtonSegment(
                      value: TextDirection.ltr,
                      label: Text('LTR (Left to Right)'),
                      icon: Icon(Icons.format_textdirection_l_to_r),
                    ),
                    ButtonSegment(
                      value: TextDirection.rtl,
                      label: Text('RTL (Right to Left)'),
                      icon: Icon(Icons.format_textdirection_r_to_l),
                    ),
                  ],
                  selected: {_textDirection},
                  onSelectionChanged: (Set<TextDirection> newSelection) {
                    setState(() {
                      _textDirection = newSelection.first;
                    });
                  },
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
        Directionality(
          textDirection: _textDirection,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Text flow direction
                const Text(
                  '1. Flowing text line. Observe where the text starts and aligns.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // 2. Row ordering
                const Text('2. Row ordering (Icon + Text):', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_forward_outlined),
                      SizedBox(width: 8),
                      Text('Arrow points forward'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 3. Directional Alignment
                const Text('3. AlignmentDirectional.topStart:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'Box',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 4. Directional Padding
                const Text('4. EdgeInsetsDirectional.only(start: 40):', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsetsDirectional.only(start: 40),
                  child: Container(
                    color: theme.colorScheme.secondary.withValues(alpha: 0.2),
                    padding: const EdgeInsets.all(8),
                    child: const Text('Padded item content'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
