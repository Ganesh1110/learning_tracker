import 'package:flutter/material.dart';

class OpacityExplanation extends StatelessWidget {
  const OpacityExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Opacity Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is Opacity?',
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Opacity paints its child with a fractional transparency '
              'level from 0.0 (invisible) to 1.0 (fully opaque). Unlike '
              'Color.withOpacity(), Opacity applies to the entire subtree '
              'including shadows, borders, and nested widgets.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'In React Native, every View accepts an opacity style prop. '
              'Flutter\'s Opacity widget is the direct equivalent — it '
              'wraps any widget and controls its transparency, just as '
              'React Native\'s opacity style does for a View or component.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
                '• opacity (double, 0.0–1.0) – the opacity level to apply'),
            Text('• alwaysIncludeSemantics – keep semantics when invisible'),
            SizedBox(height: 12),
            Text('Animated Variant',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                '• AnimatedOpacity – smoothly transitions opacity over time'),
            Text(
                '• FadeTransition – uses an Animation<double> for fine control'),
            SizedBox(height: 12),
            Text('Performance Note',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Opacity = 0 still lays out and composites the subtree. '
              'Use Visibility or Offstage when you want to fully skip '
              'painting for performance.',
            ),
          ],
        ),
      ),
    );
  }
}
