import 'package:flutter/material.dart';

class ClipOvalDemo extends StatefulWidget {
  const ClipOvalDemo({super.key});

  @override
  State<ClipOvalDemo> createState() => _ClipOvalDemoState();
}

class _ClipOvalDemoState extends State<ClipOvalDemo> {
  Clip _clipBehavior = Clip.antiAlias;
  bool _useCustomClipper = false;
  double _aspectRatio = 1.0; // 1.0 = Circle, other values = Oval
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'ClipOval Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Aspect Ratio Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Width/Height Ratio: '),
                SizedBox(
                  width: 120,
                  child: Slider(
                    value: _aspectRatio,
                    min: 0.5,
                    max: 2.0,
                    divisions: 15,
                    label: _aspectRatio.toStringAsFixed(2),
                    onChanged: (val) => setState(() => _aspectRatio = val),
                  ),
                ),
                Text(
                  _aspectRatio == 1.0 ? 'Circle' : 'Oval',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

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
                const Text('Custom Clipper (Half Width Offset)'),
              ],
            ),

            // Show Bounds Checkbox
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
              // Original Bounds overlay (Behind)
              if (_showBounds)
                Container(
                  width: 150 * _aspectRatio,
                  height: 150,
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
                        'Original Box Bounds',
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
              ClipOval(
                clipBehavior: _clipBehavior,
                clipper: _useCustomClipper ? const _HalfWidthClipper() : null,
                child: Container(
                  width: 150 * _aspectRatio,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.colorScheme.primary, theme.colorScheme.tertiary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.face,
                          size: 54,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _aspectRatio == 1.0 ? 'Perfect Circle' : 'Clipped Oval',
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

// A custom clipper that crops the oval to only the right half of its size bounds.
class _HalfWidthClipper extends CustomClipper<Rect> {
  const _HalfWidthClipper();

  @override
  Rect getClip(Size size) {
    // Return a bounding rect offset to the right by half the width.
    return Rect.fromLTWH(
      size.width / 4,
      0,
      size.width / 2,
      size.height,
    );
  }

  @override
  bool shouldReclip(covariant _HalfWidthClipper oldClipper) => false;
}
