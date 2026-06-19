import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoveLeftIntent extends Intent {
  const MoveLeftIntent();
}

class MoveRightIntent extends Intent {
  const MoveRightIntent();
}

class ToggleColorIntent extends Intent {
  const ToggleColorIntent();
}

class ActionDemo extends StatefulWidget {
  const ActionDemo({super.key});

  @override
  State<ActionDemo> createState() => _ActionDemoState();
}

class _ActionDemoState extends State<ActionDemo> {
  double _positionX = 0.0;
  bool _isAltColor = false;
  final FocusNode _focusNode = FocusNode();
  String _lastTriggered = 'None';

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _moveLeft() {
    setState(() {
      _positionX = (_positionX - 20.0).clamp(-100.0, 100.0);
      _lastTriggered = 'Move Left Action (Key: A / ◀)';
    });
  }

  void _moveRight() {
    setState(() {
      _positionX = (_positionX + 20.0).clamp(-100.0, 100.0);
      _lastTriggered = 'Move Right Action (Key: D / ▶)';
    });
  }

  void _toggleColor() {
    setState(() {
      _isAltColor = !_isAltColor;
      _lastTriggered = 'Toggle Color Action (Key: C / Space)';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 1. Define shortcuts mapping keys to Intents
    final shortcuts = <ShortcutActivator, Intent>{
      const SingleActivator(LogicalKeyboardKey.keyA): const MoveLeftIntent(),
      const SingleActivator(LogicalKeyboardKey.arrowLeft):
          const MoveLeftIntent(),
      const SingleActivator(LogicalKeyboardKey.keyD): const MoveRightIntent(),
      const SingleActivator(LogicalKeyboardKey.arrowRight):
          const MoveRightIntent(),
      const SingleActivator(LogicalKeyboardKey.keyC): const ToggleColorIntent(),
      const SingleActivator(LogicalKeyboardKey.space):
          const ToggleColorIntent(),
    };

    // 2. Define actions responding to Intents
    final actions = <Type, Action<Intent>>{
      MoveLeftIntent: CallbackAction<MoveLeftIntent>(
        onInvoke: (_) => _moveLeft(),
      ),
      MoveRightIntent: CallbackAction<MoveRightIntent>(
        onInvoke: (_) => _moveRight(),
      ),
      ToggleColorIntent: CallbackAction<ToggleColorIntent>(
        onInvoke: (_) => _toggleColor(),
      ),
    };

    return Shortcuts(
      shortcuts: shortcuts,
      child: Actions(
        actions: actions,
        child: Focus(
          focusNode: _focusNode,
          autofocus: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Tap warning for focus
              GestureDetector(
                onTap: () {
                  _focusNode.requestFocus();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: _focusNode.hasFocus
                        ? theme.colorScheme.primaryContainer.withValues(
                            alpha: 0.5,
                          )
                        : theme.colorScheme.errorContainer.withValues(
                            alpha: 0.3,
                          ),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _focusNode.hasFocus
                          ? theme.colorScheme.primary
                          : theme.colorScheme.error,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _focusNode.hasFocus
                            ? Icons.keyboard_rounded
                            : Icons.keyboard_outlined,
                        size: 16,
                        color: _focusNode.hasFocus
                            ? theme.colorScheme.primary
                            : theme.colorScheme.error,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _focusNode.hasFocus
                            ? 'Keyboard shortcuts ACTIVE'
                            : 'Click here to capture keyboard focus',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: _focusNode.hasFocus
                              ? theme.colorScheme.onPrimaryContainer
                              : theme.colorScheme.onErrorContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // The moving container
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                ),
                child: Center(
                  child: Transform.translate(
                    offset: Offset(_positionX, 0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _isAltColor
                            ? Colors.orange
                            : theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                (_isAltColor
                                        ? Colors.orange
                                        : theme.colorScheme.primary)
                                    .withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.directions_run_rounded,
                        color: _isAltColor
                            ? Colors.white
                            : theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Button Controls
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  OutlinedButton.icon(
                    onPressed: _moveLeft,
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Left (A)'),
                  ),
                  OutlinedButton.icon(
                    onPressed: _toggleColor,
                    icon: const Icon(Icons.color_lens_outlined),
                    label: const Text('Color (C)'),
                  ),
                  OutlinedButton.icon(
                    onPressed: _moveRight,
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text('Right (D)'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Info Label
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    const Icon(Icons.history_rounded, size: 14),
                    Text(
                      'Last Triggered: ',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _lastTriggered,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
