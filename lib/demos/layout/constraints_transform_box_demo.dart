import 'package:flutter/material.dart';

class ConstraintsTransformBoxDemo extends StatefulWidget {
  const ConstraintsTransformBoxDemo({super.key});

  @override
  State<ConstraintsTransformBoxDemo> createState() => _ConstraintsTransformBoxDemoState();
}

class _ConstraintsTransformBoxDemoState extends State<ConstraintsTransformBoxDemo> {
  String _selectedTransform = 'Unconstrained (Natural)';
  double _childWidth = 120.0;
  double _childHeight = 80.0;
  bool _showParentBounds = true;

  final Map<String, BoxConstraints Function(BoxConstraints)> _transforms = {
    'Unconstrained (Natural)': ConstraintsTransformBox.unconstrained,
    'Width Unconstrained': ConstraintsTransformBox.widthUnconstrained,
    'Height Unconstrained': ConstraintsTransformBox.heightUnconstrained,
    'Standard (None)': (constraints) => constraints, // No transformation
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentTransform = _transforms[_selectedTransform] ?? ConstraintsTransformBox.unconstrained;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Constraints Transform Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Transform Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Transform Function: '),
                DropdownButton<String>(
                  value: _selectedTransform,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _selectedTransform = val);
                    }
                  },
                  items: _transforms.keys.map((s) {
                    return DropdownMenuItem(value: s, child: Text(s));
                  }).toList(),
                ),
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
                  width: 90,
                  child: Slider(
                    value: _childHeight,
                    min: 50.0,
                    max: 200.0,
                    onChanged: (val) => setState(() => _childHeight = val),
                  ),
                ),
                Text('${_childHeight.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Parent Bounds Checkbox
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _showParentBounds,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _showParentBounds = val);
                    }
                  },
                ),
                const Text('Show Parent Bounds'),
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
          'The parent forces tight constraints of exactly 150x120. ConstraintsTransformBox transforms these constraints before passing them to the child.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Bounding box representing parent constraints
              if (_showParentBounds)
                Container(
                  width: 150,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.error.withValues(alpha: 0.5),
                      width: 2.0,
                    ),
                    color: theme.colorScheme.errorContainer.withValues(alpha: 0.05),
                  ),
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Parent Bounds (150x120)',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.error,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              // ConstraintsTransformBox
              Container(
                // Force parent constraints to 150x120 tightly
                constraints: const BoxConstraints.tightFor(width: 150, height: 120),
                child: ConstraintsTransformBox(
                  constraintsTransform: currentTransform,
                  alignment: Alignment.center,
                  child: Container(
                    width: _childWidth,
                    height: _childHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, childConstraints) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Child size:\n${childConstraints.maxWidth.toStringAsFixed(0)} x ${childConstraints.maxHeight.toStringAsFixed(0)}',
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
            ],
          ),
        ),
      ],
    );
  }
}
