import 'package:flutter/material.dart';

class ColumnDemo extends StatefulWidget {
  const ColumnDemo({super.key});

  @override
  State<ColumnDemo> createState() => _ColumnDemoState();
}

class _ColumnDemoState extends State<ColumnDemo> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  int _itemCount = 3;

  final Map<String, MainAxisAlignment> _mainAxisAlignments = {
    'Start': MainAxisAlignment.start,
    'Center': MainAxisAlignment.center,
    'End': MainAxisAlignment.end,
    'Space Between': MainAxisAlignment.spaceBetween,
    'Space Around': MainAxisAlignment.spaceAround,
    'Space Evenly': MainAxisAlignment.spaceEvenly,
  };

  final Map<String, CrossAxisAlignment> _crossAxisAlignments = {
    'Center': CrossAxisAlignment.center,
    'Start': CrossAxisAlignment.start,
    'End': CrossAxisAlignment.end,
    'Stretch': CrossAxisAlignment.stretch,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Column Layout Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Main Axis Alignment
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Main Align: '),
                DropdownButton<MainAxisAlignment>(
                  value: _mainAxisAlignment,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _mainAxisAlignment = val);
                    }
                  },
                  items: _mainAxisAlignments.entries.map((e) {
                    return DropdownMenuItem(value: e.value, child: Text(e.key));
                  }).toList(),
                ),
              ],
            ),

            // Cross Axis Alignment
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Cross Align: '),
                DropdownButton<CrossAxisAlignment>(
                  value: _crossAxisAlignment,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _crossAxisAlignment = val);
                    }
                  },
                  items: _crossAxisAlignments.entries.map((e) {
                    return DropdownMenuItem(value: e.value, child: Text(e.key));
                  }).toList(),
                ),
              ],
            ),

            // Main Axis Size
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Main Size: '),
                ChoiceChip(
                  label: const Text('Max'),
                  selected: _mainAxisSize == MainAxisSize.max,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _mainAxisSize = MainAxisSize.max);
                    }
                  },
                ),
                const SizedBox(width: 4),
                ChoiceChip(
                  label: const Text('Min'),
                  selected: _mainAxisSize == MainAxisSize.min,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _mainAxisSize = MainAxisSize.min);
                    }
                  },
                ),
              ],
            ),

            // Vertical Direction
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Direction: '),
                DropdownButton<VerticalDirection>(
                  value: _verticalDirection,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _verticalDirection = val);
                    }
                  },
                  items: const [
                    DropdownMenuItem(value: VerticalDirection.down, child: Text('Down (Top-to-Bottom)')),
                    DropdownMenuItem(value: VerticalDirection.up, child: Text('Up (Bottom-to-Top)')),
                  ],
                ),
              ],
            ),

            // Item Count Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Items: '),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _itemCount > 1 ? () => setState(() => _itemCount--) : null,
                ),
                Text('$_itemCount', style: const TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _itemCount < 5 ? () => setState(() => _itemCount++) : null,
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          height: 320,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.4)),
              color: theme.colorScheme.primary.withValues(alpha: 0.05),
            ),
            child: Column(
              mainAxisAlignment: _mainAxisAlignment,
              crossAxisAlignment: _crossAxisAlignment,
              mainAxisSize: _mainAxisSize,
              verticalDirection: _verticalDirection,
              children: List.generate(_itemCount, (index) {
                // Vary block sizes to clearly show CrossAxisAlignment differences
                final double itemWidth = 60.0 + (index * 20.0);
                final double itemHeight = 40.0;

                return Container(
                  width: itemWidth,
                  height: itemHeight,
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Box ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
