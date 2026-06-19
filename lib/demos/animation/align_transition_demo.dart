import 'package:flutter/material.dart';

class AlignTransitionDemo extends StatefulWidget {
  const AlignTransitionDemo({super.key});

  @override
  State<AlignTransitionDemo> createState() => _AlignTransitionDemoState();
}

class _NonNullableAlignmentGeometryTween extends Animatable<AlignmentGeometry> {
  final AlignmentGeometryTween tween;
  _NonNullableAlignmentGeometryTween(this.tween);

  @override
  AlignmentGeometry transform(double t) => tween.transform(t)!;
}

class _AlignTransitionDemoState extends State<AlignTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Create an alignment tween animation using the non-nullable helper
    _alignmentAnimation = _NonNullableAlignmentGeometryTween(
      AlignmentGeometryTween(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomEnd,
      ),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Controller Action Buttons
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _controller.forward(),
              icon: const Icon(Icons.arrow_forward_rounded, size: 16),
              label: const Text('Forward'),
            ),
            ElevatedButton.icon(
              onPressed: () => _controller.reverse(),
              icon: const Icon(Icons.arrow_back_rounded, size: 16),
              label: const Text('Reverse'),
            ),
            ElevatedButton.icon(
              onPressed: () => _controller.repeat(reverse: true),
              icon: const Icon(Icons.sync_rounded, size: 16),
              label: const Text('Yo-Yo Loop'),
            ),
            ElevatedButton.icon(
              onPressed: () => _controller.stop(),
              icon: const Icon(Icons.pause_rounded, size: 16),
              label: const Text('Pause'),
            ),
            OutlinedButton.icon(
              onPressed: () => _controller.reset(),
              icon: const Icon(Icons.replay_rounded, size: 16),
              label: const Text('Reset'),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Live controller status indicator
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Column(
              children: [
                Text(
                  'Controller Progress: ${(_controller.value * 100).toInt()}%',
                  style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(value: _controller.value),
              ],
            );
          },
        ),
        const SizedBox(height: 16),

        // Display Canvas
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              // Axis reference lines
              Center(
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
              Center(
                child: Container(
                  width: 1,
                  height: double.infinity,
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),

              // AlignTransition widget
              // Note: No AnimatedBuilder is needed around AlignTransition!
              // AlignTransition listens to the Animation itself and optimizes rebuilds.
              AlignTransition(
                alignment: _alignmentAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primaryContainer,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.colorScheme.primary),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(Icons.rocket_launch_rounded, color: Colors.white),
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
