import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusableActionDetectorDemo extends StatefulWidget {
  const FocusableActionDetectorDemo({super.key});

  @override
  State<FocusableActionDetectorDemo> createState() =>
      _FocusableActionDetectorDemoState();
}

class _FocusableActionDetectorDemoState
    extends State<FocusableActionDetectorDemo> {
  bool _hovering = false;
  bool _focused = false;
  final List<String> _logs = [];

  void _addLog(String msg) {
    final time = DateTime.now().toLocal().toString().split(' ').last.substring(0, 8);
    setState(() {
      _logs.insert(0, '[$time] $msg');
      if (_logs.length > 4) _logs.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 1. Define custom intent
    const selectIntent = _CustomSelectIntent();

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
                  'FocusableActionDetector Properties',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Combines focus nodes, hover states, action mappings, and shortcut keys in a single wrapper widget to create custom focusable controls easily.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Tap to focus or hover mouse):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            children: [
              FocusableActionDetector(
                shortcuts: <ShortcutActivator, Intent>{
                  const SingleActivator(LogicalKeyboardKey.enter): selectIntent,
                  const SingleActivator(LogicalKeyboardKey.space): selectIntent,
                },
                actions: <Type, Action<Intent>>{
                  _CustomSelectIntent: CallbackAction<_CustomSelectIntent>(
                    onInvoke: (intent) {
                      _addLog('Shortcut Triggered: Action Executed!');
                      return null;
                    },
                  ),
                },
                onShowHoverHighlight: (val) {
                  setState(() => _hovering = val);
                  _addLog('Hover changed: $val');
                },
                onShowFocusHighlight: (val) {
                  setState(() => _focused = val);
                  _addLog('Focus changed: $val');
                },
                child: GestureDetector(
                  onTap: () {
                    _addLog('Tap Gesture Triggered!');
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: _focused
                          ? theme.colorScheme.primaryContainer
                          : (_hovering
                              ? theme.colorScheme.surfaceContainerHigh
                              : theme.colorScheme.surface),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _focused
                            ? theme.colorScheme.primary
                            : (_hovering
                                ? theme.colorScheme.outline
                                : theme.colorScheme.outlineVariant),
                        width: _focused ? 2.5 : 1.0,
                      ),
                      boxShadow: _hovering
                          ? [
                              BoxShadow(
                                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _focused ? Icons.keyboard : Icons.mouse,
                          color: _focused ? theme.colorScheme.primary : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Custom Button Widget',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Supports Hover, Focus, & Enter/Space keys',
                              style: TextStyle(fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Console log output
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detector Console Logs:',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    const Divider(color: Colors.grey, height: 12),
                    if (_logs.isEmpty)
                      const Text(
                        'No actions logged yet.',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    else
                      ..._logs.map((log) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            log,
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              fontFamily: 'monospace',
                              fontSize: 12,
                            ),
                          ),
                        );
                      }),
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

class _CustomSelectIntent extends Intent {
  const _CustomSelectIntent();
}
