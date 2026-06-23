import 'package:flutter/material.dart';

class OrientationBuilderExplanation extends StatelessWidget {
  const OrientationBuilderExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OrientationBuilder Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is OrientationBuilder?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'OrientationBuilder rebuilds its subtree whenever the device '
              'orientation changes between Orientation.portrait and '
              'Orientation.landscape. It gives you the current orientation '
              'inside a builder callback so you can return a different layout '
              'for each orientation.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'In React Native you use useWindowDimensions() to get the current '
              'width/height, then derive orientation by comparing them '
              '(width > height = landscape). OrientationBuilder does this '
              'detection and rebuilding automatically.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• builder – (context, orientation) → Widget callback'),
            Text('• orientation – Orientation.portrait or .landscape'),
            SizedBox(height: 12),
            Text('Tip', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Use MediaQuery.of(context).orientation for a simpler one-liner '
              'when you only need to read orientation without rebuilding.',
            ),
          ],
        ),
      ),
    );
  }
}
