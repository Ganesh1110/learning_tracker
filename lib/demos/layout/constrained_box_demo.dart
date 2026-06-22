import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatefulWidget {
  const ConstrainedBoxDemo({super.key});

  @override
  State<ConstrainedBoxDemo> createState() => _ConstrainedBoxDemoState();
}

class _ConstrainedBoxDemoState extends State<ConstrainedBoxDemo> {
  double _minWidth = 80.0;
  double _maxWidth = 180.0;
  double _minHeight = 80.0;
  double _maxHeight = 180.0;

  double _childWidth = 220.0; // Overflows default constraints
  double _childHeight = 50.0; // Underflows default constraints

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Apply constraints
    final constraints = BoxConstraints(
      minWidth: _minWidth,
      maxWidth: _maxWidth,
      minHeight: _minHeight,
      maxHeight: _maxHeight,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'ConstrainedBox Limits (BoxConstraints)',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Min Width Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('minWidth: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _minWidth,
                    min: 0.0,
                    max: 120.0,
                    onChanged: (val) {
                      setState(() {
                        _minWidth = val;
                        if (_maxWidth < _minWidth) _maxWidth = _minWidth;
                      });
                    },
                  ),
                ),
                Text('${_minWidth.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Max Width Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('maxWidth: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _maxWidth,
                    min: 120.0,
                    max: 240.0,
                    onChanged: (val) {
                      setState(() {
                        _maxWidth = val;
                        if (_minWidth > _maxWidth) _minWidth = _maxWidth;
                      });
                    },
                  ),
                ),
                Text('${_maxWidth.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Min Height Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('minHeight: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _minHeight,
                    min: 0.0,
                    max: 120.0,
                    onChanged: (val) {
                      setState(() {
                        _minHeight = val;
                        if (_maxHeight < _minHeight) _maxHeight = _minHeight;
                      });
                    },
                  ),
                ),
                Text('${_minHeight.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Max Height Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('maxHeight: '),
                SizedBox(
                  width: 90,
                  child: Slider(
                    value: _maxHeight,
                    min: 120.0,
                    max: 240.0,
                    onChanged: (val) {
                      setState(() {
                        _maxHeight = val;
                        if (_minHeight > _maxHeight) _minHeight = _maxHeight;
                      });
                    },
                  ),
                ),
                Text('${_maxHeight.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Child Requested Dimensions',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Child Width Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Child Width: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _childWidth,
                    min: 20.0,
                    max: 250.0,
                    onChanged: (val) => setState(() => _childWidth = val),
                  ),
                ),
                Text('${_childWidth.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Child Height Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Child Height: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _childHeight,
                    min: 20.0,
                    max: 250.0,
                    onChanged: (val) => setState(() => _childHeight = val),
                  ),
                ),
                Text('${_childHeight.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
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
          height: 300,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ConstrainedBox container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2.0,
                  ),
                  color: theme.colorScheme.primary.withValues(alpha: 0.05),
                ),
                child: ConstrainedBox(
                  constraints: constraints,
                  child: Container(
                    width: _childWidth,
                    height: _childHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [theme.colorScheme.secondary, theme.colorScheme.tertiary],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, childConstraints) {
                          // Illustrate the actual resulting size
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Actual child size:\n${childConstraints.maxWidth.toStringAsFixed(0)} x ${childConstraints.maxHeight.toStringAsFixed(0)}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // Boundary Indicator Label
              Positioned(
                top: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Parent Constraints: min($_minWidth x $_minHeight) max($_maxWidth x $_maxHeight)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
