import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextEditingShortcutsDemo extends StatefulWidget {
  const DefaultTextEditingShortcutsDemo({super.key});

  @override
  State<DefaultTextEditingShortcutsDemo> createState() => _DefaultTextEditingShortcutsDemoState();
}

class _DefaultTextEditingShortcutsDemoState extends State<DefaultTextEditingShortcutsDemo> {
  final TextEditingController _controller = TextEditingController(
    text: 'Tap here and try typing. Use keyboard shortcuts like Ctrl+A, Ctrl+C, Ctrl+V, or Ctrl+Z!',
  );
  final List<String> _shortcutLogs = [];
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _logEvent(String log) {
    setState(() {
      _shortcutLogs.insert(0, '${DateTime.now().toString().substring(11, 19)} - $log');
      if (_shortcutLogs.length > 10) {
        _shortcutLogs.removeLast();
      }
    });
  }

  // Simulated keyboard actions
  void _simulateEditingAction(String actionName) {
    if (!_focusNode.hasFocus) {
      _logEvent('Error: TextField must have focus to simulate edit action.');
      return;
    }

    final text = _controller.text;
    final selection = _controller.selection;

    if (actionName == 'Select All') {
      _controller.selection = TextSelection(baseOffset: 0, extentOffset: text.length);
      _logEvent('Simulated: Select All (Ctrl+A)');
    } else if (actionName == 'Clear Line') {
      _controller.clear();
      _logEvent('Simulated: Clear Editor (Ctrl+K)');
    } else if (actionName == 'Move to End') {
      _controller.selection = TextSelection.collapsed(offset: text.length);
      _logEvent('Simulated: Move cursor to end');
    } else if (actionName == 'Append Mock') {
      final updated = text.replaceRange(selection.start.clamp(0, text.length), selection.end.clamp(0, text.length), ' [Text] ');
      _controller.text = updated;
      _logEvent('Simulated: Typing text insert');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title & Description
        Text(
          'Keyboard Editing Shortcuts Info',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'DefaultTextEditingShortcuts binds OS-level key combinations to text editing actions on active inputs (Undo, Copy, Paste, Line jumps).',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),

        // Text input field
        DefaultTextEditingShortcuts(
          child: Focus(
            focusNode: _focusNode,
            onKeyEvent: (FocusNode node, KeyEvent event) {
              if (event is KeyDownEvent) {
                final key = event.logicalKey.keyLabel;
                // Detect ctrl/cmd modifiers
                final ctrl = HardwareKeyboard.instance.isControlPressed || HardwareKeyboard.instance.isMetaPressed;
                if (ctrl) {
                  _logEvent('Key combination: Ctrl/Cmd + $key detected.');
                } else {
                  _logEvent('Key press: $key');
                }
              }
              return KeyEventResult.ignored;
            },
            child: TextField(
              controller: _controller,
              maxLines: 2,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Active Text Editor',
                labelStyle: TextStyle(
                  color: _focusNode.hasFocus ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
                ),
                helperText: 'Accepts hardware keyboard input shortcuts.',
              ),
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Simulator controls
        Text(
          'Simulate Keyboard Shortcuts',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton(
              onPressed: () => _simulateEditingAction('Select All'),
              child: const Text('Select All', style: TextStyle(fontSize: 11)),
            ),
            ElevatedButton(
              onPressed: () => _simulateEditingAction('Append Mock'),
              child: const Text('Insert Text', style: TextStyle(fontSize: 11)),
            ),
            ElevatedButton(
              onPressed: () => _simulateEditingAction('Clear Line'),
              child: const Text('Clear All', style: TextStyle(fontSize: 11)),
            ),
            ElevatedButton(
              onPressed: () => _simulateEditingAction('Move to End'),
              child: const Text('Go to End', style: TextStyle(fontSize: 11)),
            ),
          ],
        ),
        const Divider(height: 24),

        // Event log console
        Text(
          'Shortcuts & Key Event Log',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          padding: const EdgeInsets.all(8.0),
          child: _shortcutLogs.isEmpty
              ? Center(
                  child: Text(
                    'No keyboard events logged yet.',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                )
              : ListView.builder(
                  itemCount: _shortcutLogs.length,
                  itemBuilder: (context, index) {
                    return Text(
                      _shortcutLogs[index],
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 10,
                        color: Colors.black87,
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
