import 'package:flutter/material.dart';

class OverflowBoxExplanation extends StatelessWidget {
  const OverflowBoxExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OverflowBox Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is OverflowBox?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'OverflowBox lets its child ignore the parent\'s constraints '
              'and instead paints to its own maxWidth/maxHeight. This allows '
              'the child to visually overflow the parent boundaries — useful '
              'for badges, tooltips, and decorative overlaps.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'No direct equivalent. React Native clips children to their '
              'parent by default (overflow: "hidden" is the default). You '
              'would use overflow: "visible" on a parent View or use '
              'absolute positioning to achieve a similar effect.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• maxWidth – maximum width the child is allowed to use'),
            Text('• maxHeight – maximum height the child is allowed to use'),
            Text('• minWidth / minHeight – minimum constraints passed down'),
            Text('• alignment – how to align child within the OverflowBox'),
            SizedBox(height: 12),
            Text('Related Widgets',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• SizedOverflowBox – gives child a fixed size + overflow'),
            Text('• UnconstrainedBox – removes ALL constraints from child'),
          ],
        ),
      ),
    );
  }
}
