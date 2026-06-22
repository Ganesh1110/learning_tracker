import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallbackShortcutsDemo extends StatefulWidget {
  const CallbackShortcutsDemo({super.key});

  @override
  State<CallbackShortcutsDemo> createState() => _CallbackShortcutsDemoState();
}

class _CallbackShortcutsDemoState extends State<CallbackShortcutsDemo> {
  int _counter = 0;
  final FocusNode _focusNode = FocusNode();
  final List<String> _shortcutLogs = [];
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _addLog(String action) {
    setState(() {
      _shortcutLogs.insert(0, '${DateTime.now().toString().substring(11, 19)} - $action triggered');
      if (_shortcutLogs.length > 5) {
        _shortcutLogs.removeLast();
      }
    });
  }

  void _increment() {
    setState(() => _counter++);
    _addLog('Increment (+1)');
  }

  void _decrement() {
    setState(() => _counter--);
    _addLog('Decrement (-1)');
  }

  void _reset() {
    setState(() => _counter = 0);
    _addLog('Reset (0)');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Keyboard shortcut bindings using CallbackShortcuts
    final shortcutBindings = <ShortcutActivator, VoidCallback>{
      const SingleActivator(LogicalKeyboardKey.keyI): _increment,
      const SingleActivator(LogicalKeyboardKey.keyD): _decrement,
      const SingleActivator(LogicalKeyboardKey.keyR): _reset,
    };

    return CallbackShortcuts(
      bindings: shortcutBindings,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Instructions & Focus Indicator
          GestureDetector(
            onTap: () => _focusNode.requestFocus(),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isFocused
                    ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                    : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isFocused ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
                  width: _isFocused ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _isFocused ? Icons.keyboard : Icons.keyboard_hide_outlined,
                    color: _isFocused ? theme.colorScheme.primary : theme.colorScheme.outline,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _isFocused
                          ? 'Focused! Press I (inc), D (dec), or R (reset) on your physical keyboard.'
                          : 'Tap here to focus and test physical keyboard shortcuts.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: _isFocused ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Focus node wrapper for key events capture
          Focus(
            focusNode: _focusNode,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Column(
                children: [
                  Text(
                    'Counter Value',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_counter',
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Virtual Keyboard simulation controls for mobile touch users
          Text(
            'Virtual Shortcut Simulator',
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _increment,
                icon: const Icon(Icons.add),
                label: const Text('Simulate "I" key'),
              ),
              ElevatedButton.icon(
                onPressed: _decrement,
                icon: const Icon(Icons.remove),
                label: const Text('Simulate "D" key'),
              ),
              OutlinedButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh),
                label: const Text('Simulate "R" key'),
              ),
            ],
          ),
          const Divider(height: 24),

          // Action Logs Console
          Text(
            'Shortcut Events Console',
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade800),
            ),
            child: _shortcutLogs.isEmpty
                ? const Center(
                    child: Text(
                      'Console empty. Tap buttons or press physical keys.',
                      style: TextStyle(color: Colors.grey, fontSize: 11, fontStyle: FontStyle.italic),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _shortcutLogs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          _shortcutLogs[index],
                          style: const TextStyle(
                            color: Colors.yellowAccent,
                            fontFamily: 'monospace',
                            fontSize: 11,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
