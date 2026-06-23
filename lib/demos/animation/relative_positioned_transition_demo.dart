import 'package:flutter/material.dart';

class RelativePositionedTransitionDemo extends StatefulWidget {
  const RelativePositionedTransitionDemo({super.key});

  @override
  State<RelativePositionedTransitionDemo> createState() => _RelativePositionedTransitionDemoState();
}

class _RelativePositionedTransitionDemoState extends State<RelativePositionedTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Rect> _animation;
  Curve _selectedCurve = Curves.bounceOut;

  final Map<String, Curve> _curves = {
    'Bounce Out': Curves.bounceOut,
    'Ease In Out': Curves.easeInOut,
    'Elastic Out': Curves.elasticOut,
    'Linear': Curves.linear,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _updateAnimation();
  }

  void _updateAnimation() {
    // Relative coordinates based on a 200 x 150 layout coordinate system
    _animation = _MyRectTween(
      begin: const Rect.fromLTWH(10, 10, 50, 40),
      end: const Rect.fromLTWH(130, 90, 60, 50),
    ).animate(
      CurvedAnimation(parent: _controller, curve: _selectedCurve),
    );
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RelativePositionedTransition animates a child\'s position and size '
          'within a Stack relative to a virtual reference box size.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Preview Stack Container (virtual size coordinates: 200 x 150)
        Center(
          child: Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Stack(
              children: [
                RelativePositionedTransition(
                  rect: _animation,
                  size: const Size(200, 150),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.purpleAccent, Colors.deepPurple],
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Box',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Animate'),
            ),
            OutlinedButton(
              onPressed: () {
                _controller.reset();
              },
              child: const Text('Reset'),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Curve Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Curve:', style: theme.textTheme.bodySmall),
            DropdownButton<Curve>(
              value: _selectedCurve,
              items: _curves.entries.map((entry) {
                return DropdownMenuItem<Curve>(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _selectedCurve = val;
                    _updateAnimation();
                  });
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _MyRectTween extends Tween<Rect> {
  _MyRectTween({required Rect begin, required Rect end}) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) => Rect.lerp(begin, end, t)!;
}
