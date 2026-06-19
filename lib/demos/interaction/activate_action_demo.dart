import 'package:flutter/material.dart';

class ActivateActionDemo extends StatefulWidget {
  const ActivateActionDemo({super.key});

  @override
  State<ActivateActionDemo> createState() => _ActivateActionDemoState();
}

class _ActivateActionDemoState extends State<ActivateActionDemo> {
  int _activationCount = 0;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // A custom focusable widget that implements actions mapping
        Focus(
          focusNode: _focusNode,
          autofocus: true,
          onFocusChange: (hasFocus) => setState(() {}),
          child: Actions(
            actions: <Type, Action<Intent>>{
              // Custom mapping to intercept the built-in ActivateIntent
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (intent) {
                  setState(() {
                    _activationCount++;
                  });
                  return null;
                },
              ),
            },
            child: GestureDetector(
              onTap: () {
                _focusNode.requestFocus();
                // Tap also triggers activation count for mouse/touch users
                setState(() {
                  _activationCount++;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 250,
                height: 100,
                decoration: BoxDecoration(
                  color: _focusNode.hasFocus
                      ? theme.colorScheme.primaryContainer
                      : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _focusNode.hasFocus ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
                    width: _focusNode.hasFocus ? 2.0 : 1.0,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.touch_app_rounded,
                        color: _focusNode.hasFocus ? theme.colorScheme.primary : Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _focusNode.hasFocus
                            ? 'FOCUSED: Press Space or Enter'
                            : 'Click to Focus Container',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _focusNode.hasFocus ? theme.colorScheme.primary : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Activation Count: $_activationCount',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
