import 'package:flutter/material.dart';

class ExpandedDemo extends StatefulWidget {
  const ExpandedDemo({super.key});

  @override
  State<ExpandedDemo> createState() => _ExpandedDemoState();
}

class _ExpandedDemoState extends State<ExpandedDemo> {
  bool _isMiddleExpanded = true;
  int _flexFactor = 1;

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
                  'Expanded Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Expand Middle Child'),
                  subtitle: const Text('Toggles between fixed size and Expanded'),
                  value: _isMiddleExpanded,
                  onChanged: (val) => setState(() => _isMiddleExpanded = val),
                  contentPadding: EdgeInsets.zero,
                ),
                if (_isMiddleExpanded) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Middle Flex Factor: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButton<int>(
                        value: _flexFactor,
                        onChanged: (int? val) {
                          if (val != null) {
                            setState(() => _flexFactor = val);
                          }
                        },
                        items: const [
                          DropdownMenuItem(value: 1, child: Text('Flex: 1')),
                          DropdownMenuItem(value: 2, child: Text('Flex: 2')),
                          DropdownMenuItem(value: 3, child: Text('Flex: 3')),
                        ],
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Row Layout):',
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
              // Flex Row demonstration
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                ),
                child: Row(
                  children: [
                    // Box 1 (Fixed size)
                    Container(
                      width: 60,
                      color: Colors.red.withValues(alpha: 0.8),
                      alignment: Alignment.center,
                      child: const Text(
                        'Fixed\n60px',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Box 2 (Expanded or Fixed)
                    if (_isMiddleExpanded)
                      Expanded(
                        flex: _flexFactor,
                        child: Container(
                          color: Colors.blue.withValues(alpha: 0.8),
                          alignment: Alignment.center,
                          child: Text(
                            'Expanded\n(Flex: $_flexFactor)',
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    else
                      Container(
                        width: 80,
                        color: Colors.blue.withValues(alpha: 0.8),
                        alignment: Alignment.center,
                        child: const Text(
                          'Fixed\n80px',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    // Box 3 (Expanded with Flex 1)
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.green.withValues(alpha: 0.8),
                        alignment: Alignment.center,
                        child: const Text(
                          'Expanded\n(Flex: 1)',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '* The Red box is always a fixed 60px. The Blue box is either fixed or expanded with variable flex values. The Green box is always expanded with flex 1.',
                style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
