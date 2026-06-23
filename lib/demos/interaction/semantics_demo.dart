import 'package:flutter/material.dart';

class SemanticsDemo extends StatefulWidget {
  const SemanticsDemo({super.key});

  @override
  State<SemanticsDemo> createState() => _SemanticsDemoState();
}

class _SemanticsDemoState extends State<SemanticsDemo> {
  String _label = 'Add item';
  String _hint = 'Adds a new item to your shopping cart';
  String _value = '3 items';
  bool _isButton = true;
  bool _enabled = true;
  String _consoleOutput = 'Tap the interactive card above to simulate screen reader announcement.';

  void _readWidget() {
    setState(() {
      _consoleOutput = '🔊 Screen Reader says:\n'
          '"$_label. '
          '${_value.isNotEmpty ? 'Value: $_value.' : ''} '
          '${_hint.isNotEmpty ? 'Double tap to $_hint.' : ''} '
          '${_isButton ? 'Button.' : ''} '
          '${_enabled ? 'Enabled.' : 'Disabled.'}"';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Semantics-wrapped interactive widget
    final semanticsWidget = Semantics(
      label: _label,
      hint: _hint,
      value: _value,
      button: _isButton,
      enabled: _enabled,
      child: GestureDetector(
        onTap: _readWidget,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _enabled ? theme.colorScheme.primary : theme.disabledColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: _enabled
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_shopping_cart, color: _enabled ? Colors.white : Colors.grey),
              const SizedBox(width: 8),
              Text(
                'Add Item',
                style: TextStyle(
                  color: _enabled ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Semantics annotates the widget tree with accessibility descriptions '
          'used by system screen readers (like TalkBack or VoiceOver).',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Interactive Button & Reader Console
        Center(
          child: Column(
            children: [
              semanticsWidget,
              const SizedBox(height: 16),
              // Simulated Speech Reader Console
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.dark
                      ? Colors.grey.shade900
                      : Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _consoleOutput,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontFamily: 'Courier',
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Customizers
        Text('Semantic Attributes:', style: theme.textTheme.labelMedium),
        const SizedBox(height: 8),
        TextField(
          onChanged: (v) => setState(() => _label = v),
          decoration: const InputDecoration(
            labelText: 'label (Description)',
            isDense: true,
            contentPadding: EdgeInsets.all(8),
          ),
          controller: TextEditingController(text: _label)..selection = TextSelection.collapsed(offset: _label.length),
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (v) => setState(() => _value = v),
          decoration: const InputDecoration(
            labelText: 'value (Active state value)',
            isDense: true,
            contentPadding: EdgeInsets.all(8),
          ),
          controller: TextEditingController(text: _value)..selection = TextSelection.collapsed(offset: _value.length),
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (v) => setState(() => _hint = v),
          decoration: const InputDecoration(
            labelText: 'hint (Action result descriptor)',
            isDense: true,
            contentPadding: EdgeInsets.all(8),
          ),
          controller: TextEditingController(text: _hint)..selection = TextSelection.collapsed(offset: _hint.length),
        ),
        const SizedBox(height: 8),

        // Toggles
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: _isButton,
                  onChanged: (v) => setState(() => _isButton = v ?? false),
                ),
                Text('button role', style: theme.textTheme.bodySmall),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _enabled,
                  onChanged: (v) => setState(() => _enabled = v ?? false),
                ),
                Text('enabled state', style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
