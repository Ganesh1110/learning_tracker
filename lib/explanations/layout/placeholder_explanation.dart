import 'package:flutter/material.dart';

class PlaceholderExplanation extends StatelessWidget {
  const PlaceholderExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Placeholder Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Placeholder Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The Placeholder widget is a handy utility component in Flutter. '
              'It draws a box with diagonals intersecting in the center (an "X"). '
              'It is extremely useful during UI scaffolding to reserve space for features '
              'that are not yet implemented. If parent constraints are available, it matches them; '
              'if the parent constraints are unbounded (e.g., inside scroll views or flex rows/columns '
              'without explicit sizing), it falls back to the defined fallbackWidth and fallbackHeight.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, there is no built-in component dedicated to mockup rendering. '
              'Developers typically write a temporary component that returns a grey box with styling '
              'or text (e.g., `<View style={{ width: 100, height: 100, backgroundColor: "grey" }} />`), '
              'or utilize skeleton loader libraries (like `react-native-skeleton-placeholder`).',
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
                    Text('• strokeWidth: The width of the placeholder lines.'),
                    Text('• color: The color of the lines.'),
                    Text('• fallbackWidth: Width constraint applied if parent has unbounded width.'),
                    Text('• fallbackHeight: Height constraint applied if parent has unbounded height.'),
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
