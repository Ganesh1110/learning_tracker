import 'package:flutter/material.dart';

class RepaintBoundaryDemo extends StatefulWidget {
  const RepaintBoundaryDemo({super.key});

  @override
  State<RepaintBoundaryDemo> createState() => _RepaintBoundaryDemoState();
}

class _RepaintBoundaryDemoState extends State<RepaintBoundaryDemo>
    with SingleTickerProviderStateMixin {
  final List<Offset?> _points = [];
  bool _useRepaintBoundary = true;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Signature board widget
    Widget signatureCanvas = GestureDetector(
      onPanUpdate: (details) {
        final renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final localPosition = renderBox.globalToLocal(details.globalPosition);
          setState(() {
            _points.add(localPosition);
          });
        }
      },
      onPanEnd: (_) => setState(() => _points.add(null)),
      child: CustomPaint(
        painter: _SignaturePainter(_points),
        size: const Size(double.infinity, 160),
      ),
    );

    // Apply RepaintBoundary conditionally
    Widget drawingPanel = Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? theme.colorScheme.surfaceContainerHigh
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: _useRepaintBoundary
          ? RepaintBoundary(child: signatureCanvas)
          : signatureCanvas,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RepaintBoundary isolates painting of its child to a separate canvas. '
          'This prevents complex widgets (like canvases/animations) from redrawing '
          'when unrelated parts of the screen update.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Blinking Dot & Status row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ScaleTransition(
                  scale: Tween(begin: 0.8, end: 1.2).animate(_animationController),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Continuous Blinking Animator',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            Text(
              _useRepaintBoundary ? '🎨 Repaint Isolated' : '⚠️ Repainting Together',
              style: theme.textTheme.labelSmall?.copyWith(
                color: _useRepaintBoundary ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Live Drawing panel
        drawingPanel,
        const SizedBox(height: 8),
        Text(
          _useRepaintBoundary
              ? '⬆ With RepaintBoundary: Drawing and Blinking animate on independent layers.'
              : '⬆ Without RepaintBoundary: Blinking forces the entire drawing canvas to repaint on every frame.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic, fontSize: 11),
        ),
        const SizedBox(height: 16),

        // Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Switch(
                  value: _useRepaintBoundary,
                  onChanged: (v) => setState(() => _useRepaintBoundary = v),
                ),
                const SizedBox(width: 4),
                Text('RepaintBoundary', style: theme.textTheme.bodySmall),
              ],
            ),
            OutlinedButton.icon(
              onPressed: () => setState(() => _points.clear()),
              icon: const Icon(Icons.clear_all_rounded, size: 16),
              label: const Text('Clear'),
            ),
          ],
        ),
      ],
    );
  }
}

class _SignaturePainter extends CustomPainter {
  final List<Offset?> points;
  _SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.indigo
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) => true;
}
