import 'package:flutter/material.dart';

class IntentA extends Intent {
  const IntentA();
}

class IntentB extends Intent {
  const IntentB();
}

class ActionA extends Action<IntentA> {
  final VoidCallback onInvokeCallback;
  ActionA(this.onInvokeCallback);

  @override
  Object? invoke(IntentA intent) {
    onInvokeCallback();
    return null;
  }
}

class ActionB extends Action<IntentB> {
  final VoidCallback onInvokeCallback;
  ActionB(this.onInvokeCallback);

  @override
  Object? invoke(IntentB intent) {
    onInvokeCallback();
    return null;
  }
}

// Custom ActionDispatcher that intercepts invocations and executes a callback
class LoggingDispatcher extends ActionDispatcher {
  final Function(String) onLog;

  LoggingDispatcher(this.onLog);

  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    onLog('Dispatcher ➔ Intercepted ${action.runtimeType} for ${intent.runtimeType}');
    return super.invokeAction(action, intent, context);
  }
}

class ActionDispatcherDemo extends StatefulWidget {
  const ActionDispatcherDemo({super.key});

  @override
  State<ActionDispatcherDemo> createState() => _ActionDispatcherDemoState();
}

class _ActionDispatcherDemoState extends State<ActionDispatcherDemo> {
  final List<String> _logs = [];
  late final LoggingDispatcher _loggingDispatcher;

  @override
  void initState() {
    super.initState();
    _loggingDispatcher = LoggingDispatcher((msg) {
      setState(() {
        _logs.add(msg);
      });
    });
  }

  void _handleActionA() {
    setState(() {
      _logs.add('ActionA Executed: Executing task A');
    });
  }

  void _handleActionB() {
    setState(() {
      _logs.add('ActionB Executed: Executing task B');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Pass the custom dispatcher to the Actions widget
    return Actions(
      dispatcher: _loggingDispatcher,
      actions: <Type, Action<Intent>>{
        IntentA: ActionA(_handleActionA),
        IntentB: ActionB(_handleActionB),
      },
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Clicking these buttons invokes actions. Our custom dispatcher intercepts and logs the event BEFORE executing the action:',
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Actions.invoke(context, const IntentA());
                    },
                    child: const Text('Trigger Action A'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      Actions.invoke(context, const IntentB());
                    },
                    child: const Text('Trigger Action B'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Dispatcher Interception Log:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                height: 120,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                ),
                child: _logs.isEmpty
                    ? Center(
                        child: Text(
                          'No events dispatched yet. Click buttons above.',
                          style: TextStyle(color: theme.disabledColor, fontSize: 12),
                        ),
                      )
                    : ListView.builder(
                        reverse: true,
                        itemCount: _logs.length,
                        itemBuilder: (context, index) {
                          final log = _logs[_logs.length - 1 - index];
                          final isDispatcherLog = log.startsWith('Dispatcher');
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              log,
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 11,
                                color: isDispatcherLog ? theme.colorScheme.primary : theme.colorScheme.secondary,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
