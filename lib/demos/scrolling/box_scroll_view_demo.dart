import 'package:flutter/material.dart';

class BoxScrollViewDemo extends StatefulWidget {
  const BoxScrollViewDemo({super.key});

  @override
  State<BoxScrollViewDemo> createState() => _BoxScrollViewDemoState();
}

class _BoxScrollViewDemoState extends State<BoxScrollViewDemo> {
  Axis _scrollDirection = Axis.vertical;
  bool _reverse = false;
  final bool _shrinkWrap = true;
  double _padding = 16.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock item cards list
    final children = List.generate(8, (index) {
      final isVertical = _scrollDirection == Axis.vertical;
      return Card(
        margin: const EdgeInsets.all(8),
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
        child: Container(
          width: isVertical ? double.infinity : 120,
          height: isVertical ? 70 : double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: isVertical ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Icon(Icons.dashboard_outlined, size: 20, color: theme.colorScheme.primary),
              const SizedBox(height: 4),
              Text(
                'Box Item #${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'BoxScrollView Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Direction Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Axis: '),
                const SizedBox(width: 4),
                DropdownButton<Axis>(
                  value: _scrollDirection,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _scrollDirection = val);
                    }
                  },
                  items: const [
                    DropdownMenuItem(value: Axis.vertical, child: Text('Vertical')),
                    DropdownMenuItem(value: Axis.horizontal, child: Text('Horizontal')),
                  ],
                ),
              ],
            ),

            // Reverse Toggle
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _reverse,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _reverse = val);
                    }
                  },
                ),
                const Text('Reverse'),
              ],
            ),

            // Padding Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Padding: '),
                const SizedBox(width: 4),
                DropdownButton<double>(
                  value: _padding,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _padding = val);
                    }
                  },
                  items: const [
                    DropdownMenuItem(value: 8.0, child: Text('8px')),
                    DropdownMenuItem(value: 16.0, child: Text('16px')),
                    DropdownMenuItem(value: 24.0, child: Text('24px')),
                  ],
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Scroll View Canvas
        Text(
          'Custom BoxScrollView Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: _CustomBoxScrollView(
            scrollDirection: _scrollDirection,
            reverse: _reverse,
            shrinkWrap: _shrinkWrap,
            padding: EdgeInsets.all(_padding),
            children: children,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Notice how padding surrounds the scrollable viewport. Standard ListView and GridView extend this exact BoxScrollView structure.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------
// Custom concrete subclass of the abstract BoxScrollView
// ---------------------------------------------------------
class _CustomBoxScrollView extends BoxScrollView {
  final List<Widget> children;

  const _CustomBoxScrollView({
    super.scrollDirection,
    super.reverse,
    super.shrinkWrap,
    super.padding,
    required this.children,
  });

  @override
  Widget buildChildLayout(BuildContext context) {
    // BoxScrollView demands concrete buildChildLayout implementation returning a Sliver
    return SliverList(
      delegate: SliverChildListDelegate(children),
    );
  }
}
