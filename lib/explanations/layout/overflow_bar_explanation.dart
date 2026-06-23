import 'package:flutter/material.dart';

class OverflowBarExplanation extends StatelessWidget {
  const OverflowBarExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OverflowBar Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is OverflowBar?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'OverflowBar places children in a row. When the children '
              'collectively exceed the available width, it switches to a '
              'column layout automatically. This is perfect for dialog action '
              'buttons that may need to wrap on small screens.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'No direct equivalent in React Native. You would manually '
              'use flexWrap: "wrap" on a View or compute available width '
              'with onLayout to decide between row and column orientation.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• spacing – gap between children in the row layout'),
            Text('• overflowSpacing – gap between children in column layout'),
            Text('• alignment – main-axis alignment in row layout'),
            Text('• overflowAlignment – alignment when overflowing to column'),
            Text('• children – list of widgets (typically buttons)'),
          ],
        ),
      ),
    );
  }
}
