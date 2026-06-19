import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatableDemo extends StatefulWidget {
  const AnimatableDemo({super.key});

  @override
  State<AnimatableDemo> createState() => _AnimatableDemoState();
}

class _AnimatableDemoState extends State<AnimatableDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Curve _selectedCurve = Curves.bounceOut;

  final Map<String, Curve> _curves = {
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Ease In Out': Curves.easeInOut,
    'Decelerate': Curves.decelerate,
    'Linear': Curves.linear,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Defining chained Animatables:
    // We chain a Double/Color Tween with a CurveTween.
    final Animatable<double> rotationAnimatable = Tween<double>(begin: 0.0, end: 2.0 * math.pi)
        .chain(CurveTween(curve: _selectedCurve));

    final Animatable<double> sizeAnimatable = Tween<double>(begin: 60.0, end: 120.0)
        .chain(CurveTween(curve: _selectedCurve));

    final Animatable<Color?> colorAnimatable = ColorTween(
      begin: theme.colorScheme.primary,
      end: theme.colorScheme.tertiary,
    ).chain(CurveTween(curve: _selectedCurve));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Curve Selector Dropdown
        Row(
          children: [
            const Text('Tween Curve: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const Spacer(),
            SizedBox(
              width: 200,
              child: InputDecorator(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Curve>(
                    value: _selectedCurve,
                    isDense: true,
                    items: _curves.entries.map((entry) {
                      return DropdownMenuItem(
                        value: entry.value,
                        child: Text(entry.key, style: const TextStyle(fontSize: 13)),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => _selectedCurve = val);
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Play/Pause button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton.filledTonal(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat(reverse: true);
                }
                setState(() {});
              },
              icon: Icon(_controller.isAnimating ? Icons.pause_rounded : Icons.play_arrow_rounded),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Display Canvas
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // Evaluating chained animatables against the raw controller timeline
                final double currentSize = sizeAnimatable.evaluate(_controller);
                final double currentAngle = rotationAnimatable.evaluate(_controller);
                final Color? currentColor = colorAnimatable.evaluate(_controller);

                return Transform.rotate(
                  angle: currentAngle,
                  child: Container(
                    width: currentSize,
                    height: currentSize,
                    decoration: BoxDecoration(
                      color: currentColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: (currentColor ?? Colors.transparent).withValues(alpha: 0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Icon(Icons.gesture_rounded, color: Colors.white, size: 28),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
