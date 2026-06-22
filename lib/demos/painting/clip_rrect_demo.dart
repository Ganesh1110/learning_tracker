import 'package:flutter/material.dart';

class ClipRRectDemo extends StatefulWidget {
  const ClipRRectDemo({super.key});

  @override
  State<ClipRRectDemo> createState() => _ClipRRectDemoState();
}

class _ClipRRectDemoState extends State<ClipRRectDemo> {
  double _borderRadius = 24.0;
  bool _asymmetricRadius = false;
  double _topLeftRadius = 32.0;
  double _bottomRightRadius = 32.0;
  Clip _clipBehavior = Clip.antiAlias;
  bool _useCustomClipper = false;
  bool _showBounds = true;

  final Map<String, Clip> _clipBehaviors = {
    'Anti-Alias (Default)': Clip.antiAlias,
    'Hard Edge': Clip.hardEdge,
    'Anti-Alias Save Layer': Clip.antiAliasWithSaveLayer,
    'None': Clip.none,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Compute the border radius geometry based on states
    BorderRadiusGeometry radiusGeometry;
    if (_asymmetricRadius) {
      radiusGeometry = BorderRadius.only(
        topLeft: Radius.circular(_topLeftRadius),
        topRight: Radius.zero,
        bottomLeft: Radius.zero,
        bottomRight: Radius.circular(_bottomRightRadius),
      );
    } else {
      radiusGeometry = BorderRadius.circular(_borderRadius);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'ClipRRect Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Asymmetric Toggle
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _asymmetricRadius,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _asymmetricRadius = val);
                    }
                  },
                ),
                const Text('Asymmetric Corners'),
              ],
            ),

            // Radii Sliders
            if (!_asymmetricRadius)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Corner Radius: '),
                  SizedBox(
                    width: 120,
                    child: Slider(
                      value: _borderRadius,
                      min: 0.0,
                      max: 80.0,
                      divisions: 16,
                      label: _borderRadius.toStringAsFixed(0),
                      onChanged: (val) => setState(() => _borderRadius = val),
                    ),
                  ),
                  Text('${_borderRadius.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              )
            else ...[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Top-Left Radius: '),
                  SizedBox(
                    width: 100,
                    child: Slider(
                      value: _topLeftRadius,
                      min: 0.0,
                      max: 80.0,
                      divisions: 16,
                      label: _topLeftRadius.toStringAsFixed(0),
                      onChanged: (val) => setState(() => _topLeftRadius = val),
                    ),
                  ),
                  Text('${_topLeftRadius.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Bottom-Right Radius: '),
                  SizedBox(
                    width: 100,
                    child: Slider(
                      value: _bottomRightRadius,
                      min: 0.0,
                      max: 80.0,
                      divisions: 16,
                      label: _bottomRightRadius.toStringAsFixed(0),
                      onChanged: (val) => setState(() => _bottomRightRadius = val),
                    ),
                  ),
                  Text('${_bottomRightRadius.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],

            // Clip Behavior
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Clip Behavior: '),
                DropdownButton<Clip>(
                  value: _clipBehavior,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _clipBehavior = val);
                    }
                  },
                  items: _clipBehaviors.entries.map((e) {
                    return DropdownMenuItem(
                      value: e.value,
                      child: Text(e.key),
                    );
                  }).toList(),
                ),
              ],
            ),

            // Toggle Custom Clipper
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _useCustomClipper,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _useCustomClipper = val);
                    }
                  },
                ),
                const Text('Custom Clipper (Inset 16px)'),
              ],
            ),

            // Show Bounds
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _showBounds,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _showBounds = val);
                    }
                  },
                ),
                const Text('Show Original Bounds'),
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
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Bounding box representing original bounds
              if (_showBounds)
                Container(
                  width: 200,
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.error.withValues(alpha: 0.5),
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      color: theme.colorScheme.errorContainer,
                      child: Text(
                        'Original Bounds (200x160)',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

              // The Clipped Widget
              ClipRRect(
                clipBehavior: _clipBehavior,
                borderRadius: _useCustomClipper ? BorderRadius.zero : radiusGeometry,
                clipper: _useCustomClipper ? const _InsetRRectClipper() : null,
                child: Container(
                  width: 200,
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.rounded_corner_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _asymmetricRadius ? 'Asymmetric ClipRRect' : 'Clipped Rounded Rect',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
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

// A custom RRect clipper that crops into an inset rounded rectangle
class _InsetRRectClipper extends CustomClipper<RRect> {
  const _InsetRRectClipper();

  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndRadius(
      Rect.fromLTWH(16, 16, size.width - 32, size.height - 32),
      const Radius.circular(16),
    );
  }

  @override
  bool shouldReclip(covariant _InsetRRectClipper oldClipper) => false;
}
