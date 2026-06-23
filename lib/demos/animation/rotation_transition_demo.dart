import 'package:flutter/material.dart';

class RotationTransitionDemo extends StatefulWidget {
  const RotationTransitionDemo({super.key});

  @override
  State<RotationTransitionDemo> createState() => _RotationTransitionDemoState();
}

class _RotationTransitionDemoState extends State<RotationTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _speedSeconds = 3.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (_speedSeconds * 1000).toInt()),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateSpeed(double v) {
    setState(() {
      _speedSeconds = v;
      _controller.duration = Duration(milliseconds: (v * 1000).toInt());
      if (_controller.isAnimating) {
        _controller.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RotationTransition animates the rotation of a child widget. '
          'It takes an Animation<double> where 1.0 represents a full 360-degree spin.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Center(
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Center(
              child: RotationTransition(
                turns: _controller,
                child: Icon(
                  Icons.settings_outlined,
                  size: 64,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Speed Slider
        Row(
          children: [
            SizedBox(
              width: 140,
              child: Text(
                'Speed: ${_speedSeconds.toStringAsFixed(1)}s / spin',
                style: theme.textTheme.bodySmall,
              ),
            ),
            Expanded(
              child: Slider(
                value: _speedSeconds,
                min: 0.5,
                max: 5.0,
                onChanged: _updateSpeed,
              ),
            ),
          ],
        ),

        // Play/Pause controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat();
                }
                setState(() {});
              },
              icon: Icon(_controller.isAnimating ? Icons.pause : Icons.play_arrow),
              label: Text(_controller.isAnimating ? 'Pause' : 'Spin'),
            ),
            OutlinedButton(
              onPressed: () {
                _controller.reset();
                setState(() {});
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}
