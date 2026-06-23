import 'package:flutter/material.dart';

class DecoratedSliverDemo extends StatefulWidget {
  const DecoratedSliverDemo({super.key});

  @override
  State<DecoratedSliverDemo> createState() => _DecoratedSliverDemoState();
}

class _DecoratedSliverDemoState extends State<DecoratedSliverDemo> {
  bool _enableDecoration = true;
  double _borderRadius = 16.0;
  double _borderWidth = 2.0;
  String _gradientType = 'Linear';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Gradient gradient = _gradientType == 'Linear'
        ? LinearGradient(
            colors: [
              theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              theme.colorScheme.secondaryContainer.withValues(alpha: 0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : RadialGradient(
            colors: [
              theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              theme.colorScheme.surface,
            ],
            radius: 1.0,
          );

    final sliverList = SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    child: Icon(Icons.star, size: 16, color: theme.colorScheme.primary),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Group Item #${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: 3,
      ),
    );

    // Decorate the sliver list if enabled
    final Widget listContent = _enableDecoration
        ? DecoratedSliver(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(_borderRadius),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.5),
                width: _borderWidth,
              ),
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: sliverList,
            ),
          )
        : SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: sliverList,
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'DecoratedSliver Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Toggle Decoration
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Enable Decoration: '),
                Switch(
                  value: _enableDecoration,
                  onChanged: (val) => setState(() => _enableDecoration = val),
                ),
              ],
            ),

            // Border Radius
            if (_enableDecoration)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Radius: '),
                  SizedBox(
                    width: 90,
                    child: Slider(
                      value: _borderRadius,
                      min: 0.0,
                      max: 30.0,
                      onChanged: (val) => setState(() => _borderRadius = val),
                    ),
                  ),
                  Text('${_borderRadius.toStringAsFixed(0)}px'),
                ],
              ),

            // Border Width
            if (_enableDecoration)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Border Width: '),
                  SizedBox(
                    width: 90,
                    child: Slider(
                      value: _borderWidth,
                      min: 1.0,
                      max: 6.0,
                      onChanged: (val) => setState(() => _borderWidth = val),
                    ),
                  ),
                  Text('${_borderWidth.toStringAsFixed(1)}px'),
                ],
              ),

            // Gradient Type
            if (_enableDecoration)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Gradient: '),
                  ChoiceChip(
                    label: const Text('Linear'),
                    selected: _gradientType == 'Linear',
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _gradientType = 'Linear');
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Radial'),
                    selected: _gradientType == 'Radial',
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _gradientType = 'Radial');
                      }
                    },
                  ),
                ],
              ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Viewport Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'DecoratedSliver wraps the entire SliverList as a group, drawing the background card outline behind all items.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),

        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomScrollView(
              slivers: [
                // Header Adapter
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    color: theme.colorScheme.primaryContainer.withValues(alpha: 0.2),
                    child: Text(
                      'Sliver Group Header',
                      style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // Decorated Sliver List
                listContent,

                // Footer Adapter
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'End of sliver viewport',
                        style: TextStyle(
                          fontSize: 10,
                          color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
