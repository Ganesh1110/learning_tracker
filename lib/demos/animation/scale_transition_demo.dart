import 'package:flutter/material.dart';

class ScaleTransitionDemo extends StatefulWidget {
  const ScaleTransitionDemo({super.key});

  @override
  State<ScaleTransitionDemo> createState() => _ScaleTransitionDemoState();
}

class _ScaleTransitionDemoState extends State<ScaleTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _durationSeconds = 1.5;
  Alignment _alignment = Alignment.center;

  final Map<String, Alignment> _alignments = {
    'Center': Alignment.center,
    'Top Left': Alignment.topLeft,
    'Bottom Right': Alignment.bottomRight,
  };

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
          'ScaleTransition animates the scale size of a child. '
          'It takes an Animation<double> where 1.0 is original size and 0.0 is invisible.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Center(
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Center(
              child: ScaleTransition(
                scale: _controller,
                alignment: _alignment,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.pink, Colors.redAccent],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Alignment dropdown
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Scale Origin Alignment:', style: theme.textTheme.bodySmall),
            DropdownButton<Alignment>(
              value: _alignment,
              items: _alignments.entries.map((entry) {
                return DropdownMenuItem<Alignment>(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _alignment = val);
              },
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

        // Action controls
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
              label: Text(_controller.isAnimating ? 'Pause' : 'Scale'),
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
