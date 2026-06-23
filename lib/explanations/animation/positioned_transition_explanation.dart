import 'package:flutter/material.dart';

class PositionedTransitionExplanation extends StatelessWidget {
  const PositionedTransitionExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PositionedTransition Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PositionedTransition Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The PositionedTransition widget is an explicit animation widget. '
              'It takes an Animation<RelativeRect> and animates its child\'s size and position '
              'relative to the bounding box of a parent Stack over time.',
            ),
            const SizedBox(height: 12),
            const Text(
              'This is highly optimized because instead of rebuilding the entire tree, '
              'only the layout positions are updated, avoiding redundant widget builds.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, to animate absolute coordinates (top, left, width, height), '
              'developers use `Animated.Value` or Reanimated worklets (e.g. `useAnimatedStyle`). '
              'You interpolate an animation value into layout style values, which React Native '
              'then bridges to native platform layout engines. Reanimated runs these directly on '
              'the UI thread for maximum performance, similar to Flutter\'s optimized layout animations.',
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Key Properties',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text('• rect: The Animation<RelativeRect> that drives the transitions.'),
                    Text('• child: The child widget being animated inside the Stack.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
