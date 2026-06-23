import 'package:flutter/material.dart';

class PositionedTransitionDemo extends StatefulWidget {
  const PositionedTransitionDemo({super.key});

  @override
  State<PositionedTransitionDemo> createState() => _PositionedTransitionDemoState();
}

class _PositionedTransitionDemoState extends State<PositionedTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<RelativeRect> _animation;
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
    // RelativeRect values relative to a parent container bounds
    _animation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(15, 15, 160, 70),
      end: const RelativeRect.fromLTRB(160, 70, 15, 15),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: _selectedCurve,
      ),
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
          'PositionedTransition animates a child\'s position inside a Stack. '
          'It takes an Animation<RelativeRect> to transition offsets over time.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Preview Stack Container
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              PositionedTransition(
                rect: _animation,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
                    'Moving Box',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
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
