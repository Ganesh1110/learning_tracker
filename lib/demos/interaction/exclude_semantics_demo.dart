import 'package:flutter/material.dart';

class ExcludeSemanticsDemo extends StatefulWidget {
  const ExcludeSemanticsDemo({super.key});

  @override
  State<ExcludeSemanticsDemo> createState() => _ExcludeSemanticsDemoState();
}

class _ExcludeSemanticsDemoState extends State<ExcludeSemanticsDemo> {
  bool _excluding = true;

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
                  'Accessibility Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Exclude Semantics'),
                  subtitle: const Text('Hides decorative sub-tree from the accessibility reader'),
                  value: _excluding,
                  onChanged: (val) => setState(() => _excluding = val),
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
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // 1. Icon wrapped with ExcludeSemantics
                      ExcludeSemantics(
                        excluding: _excluding,
                        child: CircleAvatar(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Icon(
                            Icons.star_rate,
                            color: theme.colorScheme.primary,
                            semanticLabel: 'Premium rating badge', // this will be ignored if excluding is true
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // 2. Text elements
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Special Gold Account Offer',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Includes lifetime priority updates',
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Visual simulated Screen Reader inspection window
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.record_voice_over, color: Colors.greenAccent, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'Simulated Screen Reader Output:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.grey, height: 16),
                    if (!_excluding)
                      const Text(
                        '• "Premium rating badge" (Icon)\n• "Special Gold Account Offer" (Text)\n• "Includes lifetime priority updates" (Text)',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: 'monospace',
                          fontSize: 12,
                          height: 1.5,
                        ),
                      )
                    else
                      const Text(
                        '• "Special Gold Account Offer" (Text)\n• "Includes lifetime priority updates" (Text)',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: 'monospace',
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
