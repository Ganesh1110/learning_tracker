import 'package:flutter/material.dart';

class FocusDemo extends StatefulWidget {
  const FocusDemo({super.key});

  @override
  State<FocusDemo> createState() => _FocusDemoState();
}

class _FocusDemoState extends State<FocusDemo> {
  bool _canRequestFocus = true;
  String _focusStatus = 'No card currently has focus.';
  final List<FocusNode> _focusNodes = List.generate(3, (index) => FocusNode());

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onFocusChanged(int index, bool hasFocus) {
    if (hasFocus) {
      setState(() {
        _focusStatus = 'Card #${index + 1} has focus!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  'Focus Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Allow Focus Request'),
                  subtitle: const Text('Enables keyboard focus capability on child widgets'),
                  value: _canRequestFocus,
                  onChanged: (val) {
                    setState(() {
                      _canRequestFocus = val;
                      for (var node in _focusNodes) {
                        node.canRequestFocus = val;
                      }
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (index) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_canRequestFocus) {
                          _focusNodes[index].requestFocus();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Focus request disabled!')),
                          );
                        }
                      },
                      child: Text('Focus Card #${index + 1}'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Tap cards to shift focus):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            children: [
              Row(
                children: List.generate(3, (index) {
                  final node = _focusNodes[index];
                  return Expanded(
                    child: Focus(
                      focusNode: node,
                      onFocusChange: (hasFocus) => _onFocusChanged(index, hasFocus),
                      child: Builder(
                        builder: (context) {
                          final isFocused = Focus.of(context).hasFocus;
                          return GestureDetector(
                            onTap: () {
                              if (_canRequestFocus) {
                                node.requestFocus();
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 100,
                              decoration: BoxDecoration(
                                color: isFocused
                                    ? theme.colorScheme.primaryContainer
                                    : theme.colorScheme.surface,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isFocused
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.outlineVariant,
                                  width: isFocused ? 2.5 : 1.0,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isFocused ? Icons.center_focus_strong : Icons.center_focus_weak,
                                    color: isFocused ? theme.colorScheme.primary : Colors.grey,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Card #${index + 1}',
                                    style: TextStyle(
                                      fontWeight: isFocused ? FontWeight.bold : FontWeight.normal,
                                      color: isFocused ? theme.colorScheme.onPrimaryContainer : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _focusStatus,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
