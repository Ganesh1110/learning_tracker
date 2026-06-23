import 'package:flutter/material.dart';

class PositionedExplanation extends StatelessWidget {
  const PositionedExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Positioned Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Positioned Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The Positioned widget is used to absolutely position children inside a Stack. '
              'You define offsets (top, bottom, left, right) or sizes (width, height) to control '
              'the bounding box of the child relative to the Stack container.',
            ),
            const SizedBox(height: 12),
            const Text(
              'Note that a Positioned widget must be a direct child of a Stack. '
              'If you wrap a Positioned widget in another widget (like a Padding or Container) before '
              'attaching it to the Stack, Flutter will throw a rendering exception.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, any element inside a parent View can be positioned absolutely '
              'by setting the style property `position: "absolute"`, and specifying positioning offsets '
              '(top, bottom, left, right). Unlike Flutter, React Native doesn\'t require a special `Stack` '
              'parent widget; any `View` can serve as the stacking container for absolutely-positioned children.',
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
                    Text('• top: Distance from the top of the Stack.'),
                    Text('• bottom: Distance from the bottom of the Stack.'),
                    Text('• left: Distance from the left of the Stack.'),
                    Text('• right: Distance from the right of the Stack.'),
                    Text('• width: Forces a specific width on the child.'),
                    Text('• height: Forces a specific height on the child.'),
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
