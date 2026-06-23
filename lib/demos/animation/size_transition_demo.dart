import 'package:flutter/material.dart';

class SizeTransitionDemo extends StatefulWidget {
  const SizeTransitionDemo({super.key});

  @override
  State<SizeTransitionDemo> createState() => _SizeTransitionDemoState();
}

class _SizeTransitionDemoState extends State<SizeTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _durationSeconds = 1.5;
  Axis _axis = Axis.vertical;
  double _axisAlignment = 0.0; // -1 = start, 0 = center, 1 = end

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (_durationSeconds * 1000).toInt()),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateSpeed(double val) {
    setState(() {
      _durationSeconds = val;
      _controller.duration = Duration(milliseconds: (val * 1000).toInt());
      if (_controller.isAnimating) {
        _controller.repeat(reverse: true);
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
          'SizeTransition animates its own size (width or height) to reveal '
          'or clip its child. Values range from 0.0 (collapsed) to 1.0 (expanded).',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Center(
          child: Container(
            height: 140,
            width: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Center(
              child: SizeTransition(
                sizeFactor: _controller,
                axis: _axis,
                axisAlignment: _axisAlignment,
                child: Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.red],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Size Reveal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Axis Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Animation Axis:', style: theme.textTheme.bodySmall),
            SegmentedButton<Axis>(
              segments: const [
                ButtonSegment(value: Axis.vertical, label: Text('Vertical')),
                ButtonSegment(value: Axis.horizontal, label: Text('Horizontal')),
              ],
              selected: {_axis},
              onSelectionChanged: (val) {
                setState(() => _axis = val.first);
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Axis Alignment Slider
        Row(
          children: [
            SizedBox(
              width: 140,
              child: Text(
                'Axis Alignment: ${_axisAlignment.toStringAsFixed(1)}',
                style: theme.textTheme.bodySmall,
              ),
            ),
            Expanded(
              child: Slider(
                value: _axisAlignment,
                min: -1.0,
                max: 1.0,
                onChanged: (v) => setState(() => _axisAlignment = v),
              ),
            ),
          ],
        ),

        // Speed Slider
        Row(
          children: [
            SizedBox(
              width: 140,
              child: Text(
                'Speed: ${_durationSeconds.toStringAsFixed(1)}s / cycle',
                style: theme.textTheme.bodySmall,
              ),
            ),
            Expanded(
              child: Slider(
                value: _durationSeconds,
                min: 0.5,
                max: 4.0,
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
                  _controller.repeat(reverse: true);
                }
                setState(() {});
              },
              icon: Icon(_controller.isAnimating ? Icons.pause : Icons.play_arrow),
              label: Text(_controller.isAnimating ? 'Pause' : 'Size Reveal'),
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
