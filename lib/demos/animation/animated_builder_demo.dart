import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedBuilderDemo extends StatefulWidget {
  const AnimatedBuilderDemo({super.key});

  @override
  State<AnimatedBuilderDemo> createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  String _animType = 'Rotate';
  int _builderCallCount = 0;
  int _childBuildCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Pre-build the static child outside the AnimatedBuilder.
    // This child will be cached and reused, avoiding redundant builds.
    // Increment child build count on parent build. Since the static child is
    // cached outside the AnimatedBuilder, its build count matches the parent build count.
    _childBuildCount++;

    const Widget staticChild = _StaticCard();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Rebuild comparison dashboard
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricColumn(
                theme,
                'Builder Executes',
                '$_builderCallCount',
                theme.colorScheme.primary,
                'Rebuilds 60+ times/sec',
              ),
              Container(width: 1, height: 40, color: theme.colorScheme.outlineVariant),
              _buildMetricColumn(
                theme,
                'Static Child Builds',
                '$_childBuildCount',
                theme.colorScheme.secondary,
                'Only when settings change',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Controls
        Row(
          children: [
            Expanded(
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Effect',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _animType,
                    isDense: true,
                    items: ['Rotate', 'Scale', 'Translate', 'Combo'].map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _animType = val;
                          _builderCallCount = 0;
                          _childBuildCount = 0; // Reset metrics on mode change
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton.filledTonal(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                  setState(() {});
                } else {
                  _controller.repeat();
                  setState(() {});
                }
              },
              icon: Icon(_controller.isAnimating ? Icons.pause_rounded : Icons.play_arrow_rounded),
            ),
            IconButton.outlined(
              onPressed: () {
                _controller.reset();
                setState(() {
                  _builderCallCount = 0;
                  _childBuildCount = 0;
                });
              },
              icon: const Icon(Icons.replay_rounded),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Display Canvas
        Container(
          height: 220,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              child: staticChild,
              builder: (BuildContext context, Widget? child) {
                // Increment builder call count (without calling setState to avoid build loop)
                _builderCallCount++;

                // Apply transformation based on selected type
                switch (_animType) {
                  case 'Rotate':
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
                    );
                  case 'Scale':
                    final scale = 0.5 + (_controller.value * 0.7);
                    return Transform.scale(
                      scale: scale,
                      child: child,
                    );
                  case 'Translate':
                    final offset = math.sin(_controller.value * 2.0 * math.pi) * 60.0;
                    return Transform.translate(
                      offset: Offset(offset, 0),
                      child: child,
                    );
                  case 'Combo':
                  default:
                    final scale = 0.6 + (math.sin(_controller.value * math.pi) * 0.4);
                    return Transform.translate(
                      offset: Offset(0, math.sin(_controller.value * 2.0 * math.pi) * 20.0),
                      child: Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricColumn(
    ThemeData theme,
    String label,
    String value,
    Color color,
    String subtitle,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.outline),
        ),
      ],
    );
  }
}

class _StaticCard extends StatelessWidget {
  const _StaticCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary, width: 2),
      ),
      child: Center(
        child: Icon(
          Icons.animation_rounded,
          color: theme.colorScheme.onPrimaryContainer,
          size: 40,
        ),
      ),
    );
  }
}
