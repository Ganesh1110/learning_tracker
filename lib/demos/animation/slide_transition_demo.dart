import 'package:flutter/material.dart';

class SlideTransitionDemo extends StatefulWidget {
  const SlideTransitionDemo({super.key});

  @override
  State<SlideTransitionDemo> createState() => _SlideTransitionDemoState();
}

class _SlideTransitionDemoState extends State<SlideTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  double _durationSeconds = 1.5;
  String _direction = 'left';

  final Map<String, Offset> _directions = {
    'left': const Offset(-1.5, 0.0),
    'right': const Offset(1.5, 0.0),
    'top': const Offset(0.0, -1.5),
    'bottom': const Offset(0.0, 1.5),
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (_durationSeconds * 1000).toInt()),
      vsync: this,
    )..repeat(reverse: true);
    _updateAnimation();
  }

  void _updateAnimation() {
    _offsetAnimation = Tween<Offset>(
      begin: _directions[_direction]!,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
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
          'SlideTransition animates a child\'s position relative to its normal '
          'layout position using fractional offsets.',
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
            clipBehavior: Clip.antiAlias, // clip to see slide entrance
            child: Center(
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.cyan],
                    ),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Slide Me',
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

        // Direction Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Slide Direction:', style: theme.textTheme.bodySmall),
            DropdownButton<String>(
              value: _direction,
              items: const [
                DropdownMenuItem(value: 'left', child: Text('Slide from Left')),
                DropdownMenuItem(value: 'right', child: Text('Slide from Right')),
                DropdownMenuItem(value: 'top', child: Text('Slide from Top')),
                DropdownMenuItem(value: 'bottom', child: Text('Slide from Bottom')),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _direction = val;
                    _updateAnimation();
                  });
                }
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
              label: Text(_controller.isAnimating ? 'Pause' : 'Slide'),
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
