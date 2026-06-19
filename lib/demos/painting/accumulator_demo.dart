import 'package:flutter/material.dart';

class TreeNode {
  final String label;
  final List<TreeNode> children;

  TreeNode(this.label, [this.children = const []]);
}

class AccumulatorDemo extends StatefulWidget {
  const AccumulatorDemo({super.key});

  @override
  State<AccumulatorDemo> createState() => _AccumulatorDemoState();
}

class _AccumulatorDemoState extends State<AccumulatorDemo> {
  final TreeNode _tree = TreeNode(
    'Root',
    [
      TreeNode(
        'Branch A',
        [
          TreeNode('Leaf A1'),
          TreeNode('Leaf A2'),
        ],
      ),
      TreeNode(
        'Branch B',
        [
          TreeNode('Leaf B1'),
        ],
      ),
    ],
  );

  int _countedNodes = 0;
  List<String> _traversalPath = [];
  bool _isTraversing = false;

  void _runTraversal() async {
    setState(() {
      _isTraversing = true;
      _traversalPath = [];
      _countedNodes = 0;
    });

    // Initialize the Accumulator
    final accumulator = Accumulator();
    final path = <String>[];

    // Simulate stepping through the traversal for visual feedback
    await _traverseNodeStepByStep(_tree, accumulator, path);

    setState(() {
      _isTraversing = false;
      _countedNodes = accumulator.value;
      _traversalPath = path;
    });
  }

  Future<void> _traverseNodeStepByStep(
      TreeNode node, Accumulator acc, List<String> path) async {
    if (!mounted) return;

    // Increment accumulator
    acc.increment(1);
    
    // Add to path
    path.add(node.label);

    // Refresh UI to show the current accumulator state
    setState(() {
      _countedNodes = acc.value;
      _traversalPath = List.from(path);
    });

    // Pause briefly for animation effect
    await Future.delayed(const Duration(milliseconds: 400));

    for (final child in node.children) {
      await _traverseNodeStepByStep(child, acc, path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: _isTraversing ? null : _runTraversal,
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(_isTraversing ? 'Counting...' : 'Start Traversal'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Accumulator: $_countedNodes',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Tree Structure:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Visual Tree Display
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTreeNodeWidget(_tree, 0),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Traversal Path Progress
        const Text(
          'Recursive Stack Path:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          constraints: const BoxConstraints(minHeight: 48),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: _traversalPath.isEmpty
              ? Text(
                  'Click "Start Traversal" to see recursion stack.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.disabledColor,
                  ),
                )
              : Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: _traversalPath.map((nodeLabel) {
                    final isLast = _traversalPath.last == nodeLabel;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Chip(
                          visualDensity: VisualDensity.compact,
                          label: Text(
                            nodeLabel,
                            style: TextStyle(
                              fontSize: 11,
                              color: isLast ? theme.colorScheme.onPrimary : null,
                            ),
                          ),
                          backgroundColor: isLast ? theme.colorScheme.primary : null,
                        ),
                        if (!isLast) const Icon(Icons.chevron_right_rounded, size: 16),
                      ],
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }

  Widget _buildTreeNodeWidget(TreeNode node, int depth) {
    final theme = Theme.of(context);
    final isVisited = _traversalPath.contains(node.label);
    final isCurrent = _traversalPath.isNotEmpty && _traversalPath.last == node.label;

    return Padding(
      padding: EdgeInsets.only(left: depth * 20.0, top: 4, bottom: 4),
      child: Row(
        children: [
          Icon(
            node.children.isEmpty ? Icons.insert_drive_file_outlined : Icons.folder_outlined,
            size: 18,
            color: isCurrent
                ? theme.colorScheme.primary
                : (isVisited ? theme.colorScheme.primary.withValues(alpha: 0.5) : null),
          ),
          const SizedBox(width: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isCurrent
                  ? theme.colorScheme.primary.withValues(alpha: 0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: isCurrent
                  ? Border.all(color: theme.colorScheme.primary)
                  : Border.all(color: Colors.transparent),
            ),
            child: Text(
              node.label,
              style: TextStyle(
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                color: isCurrent ? theme.colorScheme.primary : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
