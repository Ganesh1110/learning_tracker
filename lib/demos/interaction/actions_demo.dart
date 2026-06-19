import 'package:flutter/material.dart';

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}

class ActionsDemo extends StatefulWidget {
  const ActionsDemo({super.key});

  @override
  State<ActionsDemo> createState() => _ActionsDemoState();
}

class _ActionsDemoState extends State<ActionsDemo> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Map intents to actions in the widget tree using the Actions widget and built-in CallbackAction
    return Actions(
      actions: <Type, Action<Intent>>{
        IncrementIntent: CallbackAction<IncrementIntent>(
          onInvoke: (intent) => _increment(),
        ),
        DecrementIntent: CallbackAction<DecrementIntent>(
          onInvoke: (intent) => _decrement(),
        ),
      },
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Counter Value: $_counter',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'These buttons invoke actions semantically using Actions.invoke():',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Invoking action via Intent
                      Actions.invoke(context, const DecrementIntent());
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Decrement'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Invoking action via Intent
                      Actions.invoke(context, const IncrementIntent());
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Increment'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
