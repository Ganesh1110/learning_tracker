import 'package:flutter/material.dart';

class NavigationToolbarExplanation extends StatelessWidget {
  const NavigationToolbarExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NavigationToolbar Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is NavigationToolbar?',
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'NavigationToolbar is a low-level layout widget that arranges '
              'three slots — leading, middle, and trailing — in a horizontal '
              'bar. Flutter\'s AppBar uses it internally to position the '
              'back button, title, and actions.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'In React Native you style a custom header with View + '
              'flexDirection: "row" and justify-/align-content, or you '
              'configure the Stack Navigator\'s headerLeft / headerTitle / '
              'headerRight options.\n\n'
              'NavigationToolbar gives the same three-slot layout as a '
              'first-class Flutter widget you can embed anywhere, not only '
              'in an AppBar.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• leading – Widget on the left (back button, menu icon)'),
            Text('• middle – Centered widget (title, search bar)'),
            Text('• trailing – Widget on the right (actions)'),
            Text('• middleSpacing – Gap between leading/trailing and middle'),
          ],
        ),
      ),
    );
  }
}
