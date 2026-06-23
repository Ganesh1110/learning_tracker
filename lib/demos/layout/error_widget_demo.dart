import 'package:flutter/material.dart';

class ErrorWidgetDemo extends StatefulWidget {
  const ErrorWidgetDemo({super.key});

  @override
  State<ErrorWidgetDemo> createState() => _ErrorWidgetDemoState();
}

class _ErrorWidgetDemoState extends State<ErrorWidgetDemo> {
  bool _hasError = false;

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
                  'Error Widget Simulation',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Simulate Exception Rendering'),
                  subtitle: const Text('Toggles between standard child and Flutter\'s ErrorWidget'),
                  value: _hasError,
                  onChanged: (val) => setState(() => _hasError = val),
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
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.hardEdge,
          child: _hasError
              ? ErrorWidget.withDetails(
                  message: 'Exception: Failed to parse user object properties.\nThis simulates a crash during widget build cycles.',
                  error: FlutterError('Simulated compile/runtime exception'),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: theme.colorScheme.primary,
                        size: 48,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'System working correctly.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Toggle the switch to see ErrorWidget.',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
