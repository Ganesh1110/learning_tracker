import 'package:flutter/material.dart';

class FocusTraversalGroupDemo extends StatefulWidget {
  const FocusTraversalGroupDemo({super.key});

  @override
  State<FocusTraversalGroupDemo> createState() => _FocusTraversalGroupDemoState();
}

class _FocusTraversalGroupDemoState extends State<FocusTraversalGroupDemo> {
  bool _useOrderedPolicy = false;
  final FocusScopeNode _scopeNode = FocusScopeNode();

  @override
  void dispose() {
    _scopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Order definition for Custom Ordered Policy
    const Map<int, double> focusOrders = {
      0: 3.0, // Top-Left gets 3rd
      1: 1.0, // Top-Right gets 1st
      2: 4.0, // Bottom-Left gets 4th
      3: 2.0, // Bottom-Right gets 2nd
    };

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
                  'FocusTraversalGroup Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Traversal Policy: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<bool>(
                      value: _useOrderedPolicy,
                      onChanged: (bool? val) {
                        if (val != null) {
                          setState(() => _useOrderedPolicy = val);
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: false,
                          child: Text('Reading Order (LTR, Top-to-Bottom)'),
                        ),
                        DropdownMenuItem(
                          value: true,
                          child: Text('Ordered Policy (Custom Indices)'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    _scopeNode.nextFocus();
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Move to Next Focus'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Tap to focus, then click Next Focus):',
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
          child: FocusScope(
            node: _scopeNode,
            child: FocusTraversalGroup(
              policy: _useOrderedPolicy
                  ? OrderedTraversalPolicy()
                  : ReadingOrderTraversalPolicy(),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Top Left
                      _buildFocusCell(0, 'Top-Left', focusOrders[0]!, theme),
                      const SizedBox(width: 8),
                      // Top Right
                      _buildFocusCell(1, 'Top-Right', focusOrders[1]!, theme),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Bottom Left
                      _buildFocusCell(2, 'Bottom-Left', focusOrders[2]!, theme),
                      const SizedBox(width: 8),
                      // Bottom Right
                      _buildFocusCell(3, 'Bottom-Right', focusOrders[3]!, theme),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFocusCell(int index, String label, double orderValue, ThemeData theme) {
    final cell = Focus(
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 100,
            decoration: BoxDecoration(
              color: isFocused ? theme.colorScheme.secondaryContainer : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isFocused ? theme.colorScheme.secondary : theme.colorScheme.outlineVariant,
                width: isFocused ? 2.5 : 1.0,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: isFocused ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _useOrderedPolicy ? 'Focus Order: $orderValue' : 'Focus Order: Default',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );

    if (_useOrderedPolicy) {
      return Expanded(
        child: FocusTraversalOrder(
          order: NumericFocusOrder(orderValue),
          child: cell,
        ),
      );
    }

    return Expanded(child: cell);
  }
}
