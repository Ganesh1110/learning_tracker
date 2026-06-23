import 'package:flutter/material.dart';

class ScaleTransitionExplanation extends StatelessWidget {
  const ScaleTransitionExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScaleTransition Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ScaleTransition Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'ScaleTransition is an explicit animation widget that transitions '
              'the scale scale size of a child. It takes an Animation<double> turns/scale '
              'value. Like other transition widgets, it is highly optimized because it '
              'interacts directly with the vector composition layer, avoiding layout phase '
              're-measurements.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, scaling animations are configured by setting the transform style '
              'properties of an Animated.View component:\n\n'
              '```javascript\n'
              '<Animated.View style={{ transform: [{ scale: animValue }] }} />\n'
              '```\n\n'
              'To specify a scale origin (like Flutter\'s `alignment` parameter), React Native '
              'developers use the `transformOrigin` style property (supported in newer versions '
              'or web React Native), or apply offset translate animations in conjunction with scaling.',
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
                    Text('• scale: The Animation<double> driving the scale factors.'),
                    Text('• alignment: The anchor alignment point of origin (defaults to Alignment.center).'),
                    Text('• child: The child widget being scaled.'),
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
