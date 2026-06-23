import 'package:flutter/material.dart';

class SingleChildScrollViewExplanation extends StatelessWidget {
  const SingleChildScrollViewExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SingleChildScrollView Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SingleChildScrollView Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The SingleChildScrollView widget is a scrollable container that holds a '
              'single child. It is commonly used when wrapping forms, settings blocks, '
              'or layout pages that need to scroll when keyboard is shown. '
              'Unlike ListView (which lazily renders children on-demand as they enter the screen), '
              'SingleChildScrollView renders its entire subtree immediately, making it '
              'suitable for relatively small, static layouts rather than large dynamic lists.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, this maps directly to a standard `<ScrollView>` component. '
              'Like React Native\'s scroll view, you can configure the scrollDirection (horizontal vs vertical), '
              'define scroll physics (iOS spring bouncing vs Android hard clamping), and programmatically '
              'scroll using a ScrollController (`scrollTo` or `scrollBy` equivalent).',
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Common Pitfalls for RN Devs',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text('• Do not use for long lists: If you have thousands of dynamic feed items, use ListView (flat list equivalent) instead of SingleChildScrollView containing a Column, as SingleChildScrollView does not recycle rendering views, leading to memory lag.'),
                    SizedBox(height: 6),
                    Text('• Keyboard spacing: Wrap forms inside a SingleChildScrollView to automatically allow layout scrolling when input focuses and the keyboard overlays the screen.'),
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
