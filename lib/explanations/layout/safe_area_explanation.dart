import 'package:flutter/material.dart';

class SafeAreaExplanation extends StatelessWidget {
  const SafeAreaExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SafeArea Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SafeArea Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The SafeArea widget is a layout component that inserts padding '
              'around its child to avoid operating system intrusions. This prevents '
              'your UI widgets from getting clipped by status bar areas, physical device '
              'notches, and system navigation bar lines.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, this maps directly to the built-in `<SafeAreaView>` component '
              'or the more robust and popular `react-native-safe-area-context` library '
              '(which provides hooks like `useSafeAreaInsets` to read padding numbers dynamically). '
              'Like React Native, Flutter\'s SafeArea lets you customize which anchors (top, '
              'bottom, left, right) to apply safe padding to.',
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
                    Text('• minimum: Minimum padding to apply even if no notch is present.'),
                    Text('• top: Boolean to enable/disable status bar/notch padding (defaults to true).'),
                    Text('• bottom: Boolean to enable/disable home indicator padding (defaults to true).'),
                    Text('• left: Boolean to enable/disable landscape left padding (defaults to true).'),
                    Text('• right: Boolean to enable/disable landscape right padding (defaults to true).'),
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
