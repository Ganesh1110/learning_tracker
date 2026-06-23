import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomPaintDemo extends StatefulWidget {
  const CustomPaintDemo({super.key});

  @override
  State<CustomPaintDemo> createState() => _CustomPaintDemoState();
}

class _CustomPaintDemoState extends State<CustomPaintDemo> {
  String _selectedShape = 'Circle';
  PaintingStyle _paintStyle = PaintingStyle.stroke;
  double _strokeWidth = 4.0;
  Color _selectedColor = Colors.purple;
  bool _paintForeground = false;

  final List<String> _shapes = ['Circle', 'Rectangle', 'Line', 'Star'];

  final List<Color> _colors = [
    Colors.purple,
    Colors.blue,
    Colors.teal,
    Colors.orange,
    Colors.red,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Instantiate custom painter
    final painter = DemoPainter(
      shape: _selectedShape,
      paintStyle: _paintStyle,
      strokeWidth: _strokeWidth,
      color: _selectedColor,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls section
        Text(
          'Canvas Paint Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Shape Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Shape: '),
                DropdownButton<String>(
                  value: _selectedShape,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _selectedShape = val);
                    }
                  },
                  items: _shapes.map((s) {
                    return DropdownMenuItem(value: s, child: Text(s));
                  }).toList(),
                ),
              ],
            ),

            // Style Selector (Stroke / Fill)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Style: '),
                ChoiceChip(
                  label: const Text('Stroke'),
                  selected: _paintStyle == PaintingStyle.stroke,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _paintStyle = PaintingStyle.stroke);
                    }
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Fill'),
                  selected: _paintStyle == PaintingStyle.fill,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _paintStyle = PaintingStyle.fill);
                    }
                  },
                ),
              ],
            ),

            // Stroke Width Slider
            if (_paintStyle == PaintingStyle.stroke)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Stroke Width: '),
                  SizedBox(
                    width: 100,
                    child: Slider(
                      value: _strokeWidth,
                      min: 1.0,
                      max: 15.0,
                      onChanged: (val) => setState(() => _strokeWidth = val),
                    ),
                  ),
                  Text('${_strokeWidth.toStringAsFixed(1)}px'),
                ],
              ),

            // Paint Location Toggle
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Foreground Paint: '),
                Switch(
                  value: _paintForeground,
                  onChanged: (val) => setState(() => _paintForeground = val),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Color Palette Selector
        Row(
          children: [
            const Text('Color: '),
            const SizedBox(width: 8),
            Wrap(
              spacing: 8,
              children: _colors.map((c) {
                final isSelected = _selectedColor == c;
                return GestureDetector(
                  onTap: () => setState(() => _selectedColor = c),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: c,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: theme.colorScheme.onSurface, width: 2)
                          : Border.all(color: Colors.transparent),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const Divider(height: 24),

        // Playground Canvas
        Text(
          'Drawing Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomPaint(
              // Paint on background if not foreground toggle
              painter: !_paintForeground ? painter : null,
              // Paint on foreground if toggle is true
              foregroundPainter: _paintForeground ? painter : null,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'This background text is inside the CustomPaint child widget.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _paintForeground
                            ? '(Foreground Painting: Shapes draw on top of this text)'
                            : '(Background Painting: Shapes draw behind this text)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.primary.withValues(alpha: 0.7),
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
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

class DemoPainter extends CustomPainter {
  final String shape;
  final PaintingStyle paintStyle;
  final double strokeWidth;
  final Color color;

  DemoPainter({
    required this.shape,
    required this.paintStyle,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = paintStyle
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final center = Offset(size.width / 2, size.height / 2);

    if (shape == 'Circle') {
      final radius = (size.width < size.height ? size.width : size.height) / 3.5;
      canvas.drawCircle(center, radius, paint);
    } else if (shape == 'Rectangle') {
      final rect = Rect.fromCenter(
        center: center,
        width: size.width * 0.5,
        height: size.height * 0.45,
      );
      if (paintStyle == PaintingStyle.stroke) {
        canvas.drawRect(rect, paint);
      } else {
        canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(12)), paint);
      }
    } else if (shape == 'Line') {
      final p1 = Offset(size.width * 0.25, size.height * 0.25);
      final p2 = Offset(size.width * 0.75, size.height * 0.75);
      canvas.drawLine(p1, p2, paint);
    } else if (shape == 'Star') {
      final path = Path();
      final radius = (size.width < size.height ? size.width : size.height) / 3.2;
      final innerRadius = radius / 2.5;
      const points = 5;
      const double angle = 360 / points;

      for (int i = 0; i < points * 2; i++) {
        final double r = i.isEven ? radius : innerRadius;
        final double rad = (i * angle / 2 - 90) * math.pi / 180;
        final x = center.dx + r * math.cos(rad);
        final y = center.dy + r * math.sin(rad);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant DemoPainter oldDelegate) {
    return oldDelegate.shape != shape ||
        oldDelegate.paintStyle != paintStyle ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color;
  }
}
