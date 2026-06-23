import 'package:flutter/material.dart';

class _CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class ListenableBuilderDemo extends StatefulWidget {
  const ListenableBuilderDemo({super.key});

  @override
  State<ListenableBuilderDemo> createState() => _ListenableBuilderDemoState();
}

class _ListenableBuilderDemoState extends State<ListenableBuilderDemo> {
  final _CounterNotifier _notifier = _CounterNotifier();
  int _parentRebuildCount = 0;

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _parentRebuildCount++;
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
                  'ListenableBuilder Sandbox',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ListenableBuilder listens to a ChangeNotifier or Listenable and rebuilds only its builder subtree when notified, leaving the rest of the parent tree untouched.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        // Interactive Panel
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            children: [
              // Parent Rebuild Count indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Parent Widget Rebuilds: ', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '$_parentRebuildCount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onErrorContainer,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              
              // ListenableBuilder Display
              ListenableBuilder(
                listenable: _notifier,
                builder: (BuildContext context, Widget? child) {
                  return Column(
                    children: [
                      const Text(
                        'Scoped Listenable Subtree',
                        style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${_notifier.count}',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),

              // Controls
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _notifier.increment(),
                      icon: const Icon(Icons.add),
                      label: const Text('Increment Notifier'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Force parent state change to show build increments
                        setState(() {});
                      },
                      child: const Text('Force Parent State'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => _notifier.reset(),
                  child: const Text('Reset Counter'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
