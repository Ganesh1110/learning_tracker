import 'package:flutter/material.dart';

class PositionedDirectionalExplanation extends StatelessWidget {
  const PositionedDirectionalExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PositionedDirectional Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PositionedDirectional Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The PositionedDirectional widget is a variant of Positioned designed for '
              'internationalization and right-to-left (RTL) layout support. '
              'Instead of hardcoded left/right constraints, it uses start and end offsets. '
              'These resolve to left/right in left-to-right (LTR) trees, and right/left in '
              'right-to-left (RTL) trees based on the ambient Directionality widget.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, layout positioning automatically supports writing direction '
              'via standard flexbox properties. When you style an absolute element using `start` '
              'and `end` props (e.g., `{ position: "absolute", start: 20 }`), React Native '
              'maps these properties to the left or right edge depending on the active locale/writing '
              'direction of the device.',
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
                    Text('• start: The offset from the leading edge (left in LTR, right in RTL).'),
                    Text('• end: The offset from the trailing edge (right in LTR, left in RTL).'),
                    Text('• top: Distance from the top of the Stack.'),
                    Text('• bottom: Distance from the bottom of the Stack.'),
                    Text('• width: Explicit width of the child.'),
                    Text('• height: Explicit height of the child.'),
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
