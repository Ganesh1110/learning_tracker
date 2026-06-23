import 'package:flutter/material.dart';

class DecoratedBoxTransitionDemo extends StatefulWidget {
  const DecoratedBoxTransitionDemo({super.key});

  @override
  State<DecoratedBoxTransitionDemo> createState() => _DecoratedBoxTransitionDemoState();
}

class _DecoratedBoxTransitionDemoState extends State<DecoratedBoxTransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _decorationAnimation;
  String _selectedCurveName = 'EaseInOut';
  double _durationSeconds = 1.5;

  final Map<String, Curve> _curves = {
    'Linear': Curves.linear,
    'EaseInOut': Curves.easeInOut,
    'BounceOut': Curves.bounceOut,
    'ElasticOut': Curves.elasticOut,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (_durationSeconds * 1000).toInt()),
    );
    _updateAnimation();
  }

  void _updateAnimation() {
    final curve = _curves[_selectedCurveName] ?? Curves.easeInOut;

    // Define start and end BoxDecorations
    final decorationTween = DecorationTween(
      begin: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.purpleAccent,
          width: 2.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      end: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(36.0),
        border: Border.all(
          color: Colors.deepOrangeAccent,
          width: 6.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 15.0,
            offset: Offset(0, 8),
          ),
        ],
      ),
    );

    _decorationAnimation = decorationTween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: curve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Transition Animation Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Curve Dropdown
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Curve: '),
                DropdownButton<String>(
                  value: _selectedCurveName,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedCurveName = val;
                        _updateAnimation();
                      });
                    }
                  },
                  items: _curves.keys.map((name) {
                    return DropdownMenuItem(value: name, child: Text(name));
                  }).toList(),
                ),
              ],
            ),

            // Duration Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Duration: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _durationSeconds,
                    min: 0.5,
                    max: 4.0,
                    onChanged: (val) {
                      setState(() {
                        _durationSeconds = val;
                        _controller.duration = Duration(milliseconds: (_durationSeconds * 1000).toInt());
                      });
                    },
                  ),
                ),
                Text('${_durationSeconds.toStringAsFixed(1)}s'),
              ],
            ),

            // Action Buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: _togglePlay,
                  icon: Icon(_controller.isAnimating ? Icons.pause : Icons.play_arrow),
                  label: Text(_controller.isAnimating ? 'Pause' : 'Play'),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    _controller.reset();
                    setState(() {});
                  },
                  child: const Text('Reset'),
                ),
                TextButton(
                  onPressed: () {
                    _controller.repeat(reverse: true);
                    setState(() {});
                  },
                  child: const Text('Loop'),
                ),
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
        const SizedBox(height: 12),
        Container(
          height: 220,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return DecoratedBoxTransition(
                decoration: _decorationAnimation,
                child: const SizedBox(
                  width: 140,
                  height: 140,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Morphing\nBox',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          shadows: [
                            Shadow(
                              color: Colors.black38,
                              offset: Offset(0, 1),
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
