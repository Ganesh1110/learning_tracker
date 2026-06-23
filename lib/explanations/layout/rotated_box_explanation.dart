import 'package:flutter/material.dart';

class RotatedBoxExplanation extends StatelessWidget {
  const RotatedBoxExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RotatedBox Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RotatedBox Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'RotatedBox rotates its child by a fixed number of quarter turns '
              '(90-degree increments). Unlike paint transformations (such as Transform.rotate), '
              'RotatedBox applies the rotation during the layout phase. This means the parent '
              'widget measures the child in its rotated state, adjusting the layout and preventing '
              'unintended overlaps or clipping in scroll views, lists, and columns.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, rotation is applied using transform style properties: '
              '`transform: [{ rotate: "90deg" }]`. This behaves like Flutter\'s `Transform.rotate` '
              'because it only rotates the drawing (paint phase) without updating the layout size '
              'boundaries. The sibling elements still layout as if the item is not rotated, which '
              'can cause rendering overlaps. To fix this in React Native, developers must manually '
              'swap width and height dimensions or write custom layout wrappers.',
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
                    Text('• quarterTurns: The number of 90-degree turns (e.g. 1 = 90°, 2 = 180°, 3 = 270°).'),
                    Text('• child: The widget being rotated.'),
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
