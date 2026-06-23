import 'package:flutter/material.dart';

class IntrinsicWidthDemo extends StatefulWidget {
  const IntrinsicWidthDemo({super.key});

  @override
  State<IntrinsicWidthDemo> createState() => _IntrinsicWidthDemoState();
}

class _IntrinsicWidthDemoState extends State<IntrinsicWidthDemo> {
  bool _useIntrinsicWidth = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // List of widgets in the button column
    final buttonsContent = [
      ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.save),
        label: const Text('Save'),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primaryContainer,
          foregroundColor: theme.colorScheme.onPrimaryContainer,
        ),
      ),
      const SizedBox(height: 8),
      ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward),
        label: const Text('Save & Continue'),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.secondaryContainer,
          foregroundColor: theme.colorScheme.onSecondaryContainer,
        ),
      ),
      const SizedBox(height: 8),
      ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.delete_forever),
        label: const Text('Discard All Changes'),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.errorContainer,
          foregroundColor: theme.colorScheme.onErrorContainer,
        ),
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
                  'IntrinsicWidth Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'In a Column, children usually size independently or stretch full screen. Wrap in IntrinsicWidth to force all children to match the width of the widest child.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Wrap in IntrinsicWidth', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Toggle to see the buttons synchronize width or display independently'),
                  value: _useIntrinsicWidth,
                  onChanged: (val) => setState(() => _useIntrinsicWidth = val),
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
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: _useIntrinsicWidth
              ? IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: buttonsContent,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: buttonsContent,
                ),
        ),
      ],
    );
  }
}
