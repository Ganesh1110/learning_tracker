import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}

class ShortcutsDemo extends StatefulWidget {
  const ShortcutsDemo({super.key});

  @override
  State<ShortcutsDemo> createState() => _ShortcutsDemoState();
}

class _ShortcutsDemoState extends State<ShortcutsDemo> {
  int _counter = 0;
  String _lastAction = 'None';
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyI, control: true): const IncrementIntent(),
        SingleActivator(LogicalKeyboardKey.keyD, control: true): const DecrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (_) {
              setState(() {
                _counter++;
                _lastAction = 'Control + I (Incremented)';
              });
              return null;
            },
          ),
          DecrementIntent: CallbackAction<DecrementIntent>(
            onInvoke: (_) {
              setState(() {
                _counter--;
                _lastAction = 'Control + D (Decremented)';
              });
              return null;
            },
          ),
        },
        child: Focus(
          focusNode: _focusNode,
          autofocus: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shortcuts binds keyboard key combinations to actions in the widget tree. '
                'Click the focus area below and press the shortcut keys.',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 16),

              // Focusable Playground Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _focusNode.hasFocus
                      ? theme.colorScheme.primaryContainer.withOpacity(0.3)
                      : theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _focusNode.hasFocus
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outlineVariant,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    // Click to Focus button
                    OutlinedButton.icon(
                      onPressed: () {
                        if (!_focusNode.hasFocus) {
                          _focusNode.requestFocus();
                        } else {
                          _focusNode.unfocus();
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        _focusNode.hasFocus ? Icons.keyboard_hide : Icons.keyboard_alt,
                      ),
                      label: Text(_focusNode.hasFocus ? 'Focus Active' : 'Click to Activate Focus'),
                    ),
                    const SizedBox(height: 16),

                    // Counter display
                    Text(
                      '$_counter',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Last action log
                    Text(
                      'Last Shortcut Triggered: $_lastAction',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Legend
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shortcut Bindings:', style: theme.textTheme.labelMedium),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _KeyBadge(label: 'Ctrl'),
                          const Text(' + '),
                          _KeyBadge(label: 'I'),
                          const SizedBox(width: 8),
                          Text('→ Increment Counter', style: theme.textTheme.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          _KeyBadge(label: 'Ctrl'),
                          const Text(' + '),
                          _KeyBadge(label: 'D'),
                          const SizedBox(width: 8),
                          Text('→ Decrement Counter', style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KeyBadge extends StatelessWidget {
  final String label;
  const _KeyBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontFamily: 'Courier',
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
