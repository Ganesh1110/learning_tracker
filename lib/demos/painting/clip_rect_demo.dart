import 'package:flutter/material.dart';

class ClipRectDemo extends StatefulWidget {
  const ClipRectDemo({super.key});

  @override
  State<ClipRectDemo> createState() => _ClipRectDemoState();
}

class _ClipRectDemoState extends State<ClipRectDemo> {
  bool _enableClip = true;
  double _childOffsetX = 30.0;
  double _childOffsetY = 30.0;
  final double _childSize = 140.0;
  bool _useCustomClipper = false;
  Clip _clipBehavior = Clip.hardEdge;

  final Map<String, Clip> _clipBehaviors = {
    'Hard Edge (Default)': Clip.hardEdge,
    'Anti-Alias': Clip.antiAlias,
    'Anti-Alias Save Layer': Clip.antiAliasWithSaveLayer,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Dynamic builder to toggle ClipRect presence
    Widget content;
    final childWidget = Transform.translate(
      offset: Offset(_childOffsetX, _childOffsetY),
      child: Container(
        width: _childSize,
        height: _childSize,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.tertiary, theme.colorScheme.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(4, 4),
            )
          ],
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.crop_free, color: Colors.white, size: 36),
              SizedBox(height: 4),
              Text(
                'Oversized Child',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );

    if (_enableClip) {
      content = ClipRect(
        clipBehavior: _clipBehavior,
        clipper: _useCustomClipper ? const _InsetClipper() : null,
        child: childWidget,
      );
    } else {
      content = childWidget;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'ClipRect Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Toggle ClipRect
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _enableClip,
                  onChanged: (val) => setState(() => _enableClip = val),
                ),
                const Text('Enable ClipRect'),
              ],
            ),

            // Offset X Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Offset X: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _childOffsetX,
                    min: -60,
                    max: 80,
                    label: _childOffsetX.toStringAsFixed(0),
                    onChanged: (val) => setState(() => _childOffsetX = val),
                  ),
                ),
              ],
            ),

            // Offset Y Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Offset Y: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _childOffsetY,
                    min: -60,
                    max: 80,
                    label: _childOffsetY.toStringAsFixed(0),
                    onChanged: (val) => setState(() => _childOffsetY = val),
                  ),
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

            // Use Custom Rect Clipper
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _useCustomClipper,
                  onChanged: _enableClip
                      ? (val) {
                          if (val != null) {
                            setState(() => _useCustomClipper = val);
                          }
                        }
                      : null,
                ),
                const Text('Custom Clipper (Inset 15px)'),
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
          _enableClip
              ? 'The child is clipped exactly to the parent bounds (or custom inset rect).'
              : 'The child overflows outside the parent container bounds (red boundary).',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),
        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.error,
                width: 2,
              ),
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
            ),
            child: Stack(
              clipBehavior: Clip.none, // Allow overflow to be shown if ClipRect is disabled
              children: [
                content,
                // Label overlay on parent container bounds
                Positioned(
                  left: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    color: theme.colorScheme.error,
                    child: const Text(
                      'Parent Bounds (160x160)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
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

// A custom Rect clipper that crops into a smaller rectangle (insetting by 15 pixels)
class _InsetClipper extends CustomClipper<Rect> {
  const _InsetClipper();

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(
      15,
      15,
      size.width - 30,
      size.height - 30,
    );
  }

  @override
  bool shouldReclip(covariant _InsetClipper oldClipper) => false;
}
