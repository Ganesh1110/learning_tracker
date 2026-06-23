import 'package:flutter/material.dart';

class CustomSingleChildLayoutDemo extends StatefulWidget {
  const CustomSingleChildLayoutDemo({super.key});

  @override
  State<CustomSingleChildLayoutDemo> createState() => _CustomSingleChildLayoutDemoState();
}

class _CustomSingleChildLayoutDemoState extends State<CustomSingleChildLayoutDemo> {
  double _xOffsetFraction = 0.0; // -1.0 (left) to 1.0 (right)
  double _yOffsetFraction = 0.0; // -1.0 (top) to 1.0 (bottom)
  double _childWidth = 100.0;
  double _childHeight = 80.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Layout Delegate Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // X Offset Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('H Offset: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _xOffsetFraction,
                    min: -1.0,
                    max: 1.0,
                    onChanged: (val) => setState(() => _xOffsetFraction = val),
                  ),
                ),
                Text((_xOffsetFraction >= 0 ? '+' : '') + _xOffsetFraction.toStringAsFixed(2)),
              ],
            ),

            // Y Offset Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('V Offset: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _yOffsetFraction,
                    min: -1.0,
                    max: 1.0,
                    onChanged: (val) => setState(() => _yOffsetFraction = val),
                  ),
                ),
                Text((_yOffsetFraction >= 0 ? '+' : '') + _yOffsetFraction.toStringAsFixed(2)),
              ],
            ),

            // Child Width Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Child Width: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _childWidth,
                    min: 50.0,
                    max: 160.0,
                    onChanged: (val) => setState(() => _childWidth = val),
                  ),
                ),
                Text('${_childWidth.toStringAsFixed(0)}px'),
              ],
            ),

            // Child Height Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Child Height: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _childHeight,
                    min: 40.0,
                    max: 120.0,
                    onChanged: (val) => setState(() => _childHeight = val),
                  ),
                ),
                Text('${_childHeight.toStringAsFixed(0)}px'),
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
        const SizedBox(height: 8),
        Text(
          'The SingleChildLayoutDelegate programmatically overrides the child\'s constraints and coordinates placement based on parent dimensions.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),

        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.topLeft,
          child: CustomSingleChildLayout(
            delegate: AnchorLayoutDelegate(
              xOffset: _xOffsetFraction,
              yOffset: _yOffsetFraction,
              childSize: Size(_childWidth, _childHeight),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Delegated Child',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${_childWidth.toStringAsFixed(0)}x${_childHeight.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AnchorLayoutDelegate extends SingleChildLayoutDelegate {
  final double xOffset;
  final double yOffset;
  final Size childSize;

  AnchorLayoutDelegate({
    required this.xOffset,
    required this.yOffset,
    required this.childSize,
  });

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // Provide explicit layout constraints for child, bounded by parent max constraints
    return BoxConstraints.tight(
      Size(
        childSize.width.clamp(0.0, constraints.maxWidth),
        childSize.height.clamp(0.0, constraints.maxHeight),
      ),
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // Calculate the centered position
    final double centerX = (size.width - childSize.width) / 2;
    final double centerY = (size.height - childSize.height) / 2;

    // Apply offset factor
    final double x = centerX + (xOffset * centerX);
    final double y = centerY + (yOffset * centerY);

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(covariant AnchorLayoutDelegate oldDelegate) {
    return oldDelegate.xOffset != xOffset ||
        oldDelegate.yOffset != yOffset ||
        oldDelegate.childSize != childSize;
  }
}
