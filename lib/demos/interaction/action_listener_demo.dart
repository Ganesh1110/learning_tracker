import 'package:flutter/material.dart';

class LoggedIntent extends Intent {
  const LoggedIntent();
}

class LoggedAction extends Action<LoggedIntent> {
  final VoidCallback onInvokeCallback;
  bool _actionEnabled = true;

  LoggedAction(this.onInvokeCallback);

  bool get actionEnabled => _actionEnabled;

  set actionEnabled(bool value) {
    if (_actionEnabled != value) {
      _actionEnabled = value;
      notifyActionListeners();
    }
  }

  @override
  bool isEnabled(LoggedIntent intent) => _actionEnabled;

  @override
  Object? invoke(LoggedIntent intent) {
    onInvokeCallback();
    return null;
  }
}

class ActionListenerDemo extends StatefulWidget {
  const ActionListenerDemo({super.key});

  @override
  State<ActionListenerDemo> createState() => _ActionListenerDemoState();
}

class _ActionListenerDemoState extends State<ActionListenerDemo> {
  final List<String> _logs = [];
  late final LoggedAction _customAction;

  @override
  void initState() {
    super.initState();
    _customAction = LoggedAction(() {
      setState(() {
        _logs.add('Action Invoked! (at ${DateTime.now().second}s)');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Switch to enable/disable the action (updates action state to test state changes)
        SwitchListTile(
          title: const Text('Enable Action'),
          subtitle: const Text('Toggling updates the action state monitored by ActionListener'),
          value: _customAction.actionEnabled,
          onChanged: (val) {
            setState(() {
              _customAction.actionEnabled = val;
            });
          },
        ),
        const SizedBox(height: 16),

        // The ActionListener widget wraps its subtree and intercepts action state changes
        ActionListener(
          action: _customAction,
          listener: (Action<Intent> action) {
            setState(() {
              _logs.add('ActionListener: State changed! [isEnabled: ${action.isEnabled(const LoggedIntent())}]');
            });
          },
          child: Center(
            child: ElevatedButton.icon(
              onPressed: _customAction.actionEnabled
                  ? () => _customAction.invoke(const LoggedIntent())
                  : null,
              icon: const Icon(Icons.flash_on_rounded),
              label: const Text('Invoke CustomAction'),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'ActionListener Event Log:',
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
                    'No events recorded yet. Click Invoke or Toggle Switch.',
                    style: TextStyle(color: theme.disabledColor, fontSize: 12),
                  ),
                )
              : ListView.builder(
                  reverse: true,
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    final log = _logs[_logs.length - 1 - index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        log,
                        style: const TextStyle(fontFamily: 'monospace', fontSize: 11),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
