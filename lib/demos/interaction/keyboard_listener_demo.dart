import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardListenerDemo extends StatefulWidget {
  const KeyboardListenerDemo({super.key});

  @override
  State<KeyboardListenerDemo> createState() => _KeyboardListenerDemoState();
}

class _KeyboardListenerDemoState extends State<KeyboardListenerDemo> {
  final FocusNode _focusNode = FocusNode();
  final List<String> _logs = [];

  bool _isShiftActive = false;
  bool _isCtrlActive = false;
  bool _isAltActive = false;
  bool _isMetaActive = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(KeyEvent event) {
    final keyLabel = event.logicalKey.keyLabel;
    final eventName = event is KeyDownEvent
        ? 'KeyDown'
        : event is KeyUpEvent
            ? 'KeyUp'
            : 'KeyRepeat';

    // Query active modifiers
    setState(() {
      _isShiftActive = HardwareKeyboard.instance.isShiftPressed;
      _isCtrlActive = HardwareKeyboard.instance.isControlPressed;
      _isAltActive = HardwareKeyboard.instance.isAltPressed;
      _isMetaActive = HardwareKeyboard.instance.isMetaPressed;

      final time = DateTime.now().toLocal().toString().split(' ').last.substring(0, 8);
      _logs.insert(0, '[$time] $eventName: $keyLabel (Code: ${event.logicalKey.keyId})');
      if (_logs.length > 8) _logs.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasFocus = _focusNode.hasFocus;

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
                  'KeyboardListener Sandbox',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'KeyboardListener listens to hardware keyboard actions directly, which is crucial for desktop/web shortcuts and gamepad inputs.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        // Target Interaction Canvas
        GestureDetector(
          onTap: () {
            if (!_focusNode.hasFocus) {
              _focusNode.requestFocus();
            }
          },
          child: KeyboardListener(
            focusNode: _focusNode,
            onKeyEvent: _handleKeyEvent,
            autofocus: true,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: hasFocus
                    ? theme.colorScheme.primaryContainer.withValues(alpha: 0.15)
                    : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: hasFocus ? theme.colorScheme.primary : theme.colorScheme.outline,
                  width: hasFocus ? 2 : 1,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard,
                    size: 32,
                    color: hasFocus ? theme.colorScheme.primary : Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hasFocus ? 'Focus Active! Type on your keyboard...' : 'Tap here to activate keyboard listener',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: hasFocus ? theme.colorScheme.primary : Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Modifier Flags Display
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildModifierBadge('Shift', _isShiftActive, theme),
            _buildModifierBadge('Ctrl', _isCtrlActive, theme),
            _buildModifierBadge('Alt', _isAltActive, theme),
            _buildModifierBadge('Cmd / Win', _isMetaActive, theme),
          ],
        ),
        const SizedBox(height: 20),

        // Keystroke Logs Display
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hardware Key Event Logs:',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_logs.isNotEmpty)
              TextButton(
                onPressed: () => setState(() => _logs.clear()),
                child: const Text('Clear'),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 150,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: _logs.isEmpty
              ? const Center(
                  child: Text(
                    'No keystroke activity detected. Set focus and type.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              : ListView.builder(
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        _logs[index],
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildModifierBadge(String name, bool isActive, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: isActive ? theme.colorScheme.onPrimary : theme.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}
