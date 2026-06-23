import 'package:flutter/material.dart';

class RotationTransitionExplanation extends StatelessWidget {
  const RotationTransitionExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RotationTransition Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RotationTransition Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The RotationTransition widget is an explicit animation component. '
              'It takes an Animation<double> (where values transition, e.g., from 0.0 to 1.0) '
              'and rotates its child. A value of 1.0 represents one full 360-degree rotation. '
              'Because it is GPU-accelerated and only updates paint layer transformations, '
              'it is highly efficient and does not trigger layout recalculations in Flutter.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, rotation animations are built by passing an animated value '
              'into a style transform array. Since the style property requires a string unit '
              '(e.g., "360deg"), you must interpolate the numeric animated value:\n\n'
              '```javascript\n'
              'const spin = animValue.interpolate({\n'
              '  inputRange: [0, 1],\n'
              '  outputRange: [\'0deg\', \'360deg\']\n'
              '});\n'
              '// then apply to styling:\n'
              '<Animated.View style={{ transform: [{ rotate: spin }] }} />\n'
              '```\n\n'
              'Using `useNativeDriver: true` is recommended in React Native to run this '
              'directly on the native UI thread, equivalent to Flutter\'s render efficiency.',
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
                    Text('• turns: The Animation<double> specifying the rotation progress.'),
                    Text('• alignment: The anchor point around which rotation is calculated (defaults to Alignment.center).'),
                    Text('• child: The widget to rotate.'),
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
