import 'package:flutter/material.dart';

class RelativePositionedTransitionExplanation extends StatelessWidget {
  const RelativePositionedTransitionExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RelativePositionedTransition Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RelativePositionedTransition Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'RelativePositionedTransition is an explicit transition widget that animates '
              'a child\'s layout coordinates (rect) inside a Stack, relative to a fixed '
              'reference size (coordinate box). '
              'Unlike PositionedTransition (which uses absolute RelativeRect coordinates), '
              'RelativePositionedTransition works with a standard Rect coordinate system '
              'and scales the placement internally to fit the actual size of the Stack parent '
              'at render time.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, layout animations are usually handled by the `LayoutAnimation` API '
              'or explicit styles driven by `Animated` values. When animating position relative to '
              'parent bounds, developers typically write a wrapper, measure the parent view dynamically '
              '(via the `onLayout` prop) to determine coordinate bounds, and then interpolate '
              'style values (e.g., left and top styles). RelativePositionedTransition handles '
              'this coordinate system mapping out-of-the-box in Flutter.',
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
                    Text('• rect: The Animation<Rect> specifying the position coordinates.'),
                    Text('• size: The bounding box size that represents the coordinate system.'),
                    Text('• child: The child widget inside the Stack.'),
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
