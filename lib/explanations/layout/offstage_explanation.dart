import 'package:flutter/material.dart';

class OffstageExplanation extends StatelessWidget {
  const OffstageExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offstage Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is Offstage?',
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Offstage keeps its child in the widget tree but makes it '
              'invisible and non-interactive when offstage = true. Unlike '
              'Visibility or conditionally including a widget, Offstage '
              'keeps the subtree alive — timers, animations, and state '
              'continue to run, which is useful for pre-warming content '
              'before revealing it.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'React Native has no direct equivalent. Developers typically '
              'use opacity: 0 / display: "none" or conditional rendering. '
              'opacity: 0 keeps the subtree alive (similar to Offstage) but '
              'still participates in layout and hit-testing, whereas '
              'Offstage removes size contribution and hit testing too.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
                '• offstage (bool, default: true) – hide/show the child'),
            Text(
                '• When offstage=true: painted as 0×0, ignored by hit-test'),
            Text(
                '• When offstage=false: behaves like a normal widget'),
            SizedBox(height: 12),
            Text('Offstage vs Visibility',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                '• Offstage – child state is always preserved in the tree'),
            Text('• Visibility – can also control whether to maintain state'),
          ],
        ),
      ),
    );
  }
}
