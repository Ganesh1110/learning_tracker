import 'package:flutter/material.dart';

class ShortcutsExplanation extends StatelessWidget {
  const ShortcutsExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shortcuts Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shortcuts Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The Shortcuts widget in Flutter maps raw keyboard combinations '
              '(ShortcutActivator) to specific abstract Intents. These Intents '
              'are subsequently caught by an Actions widget, which executes '
              'the corresponding Action handler logic. '
              'This architecture separates shortcut definitions from action implementations, '
              'enabling reusable shortcuts and dynamic keyboard focus traversal.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'React Native has no built-in architecture for keyboard shortcuts. '
              'For desktop (macOS/Windows) or web deployments, React Native developers '
              'must manually attach event listeners to global event emitters (like window.addEventListener '
              'on Web) or write native bridge listeners that intercept physical key presses '
              'and dispatch callbacks to Javascript.',
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter Shortcut Pattern',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text('1. Shortcuts: Map KeySet (e.g. Ctrl + I) to an Intent class (IncrementIntent).'),
                    SizedBox(height: 4),
                    Text('2. Actions: Map Intent class to an Action execution block.'),
                    SizedBox(height: 4),
                    Text('3. Focus: The wrapped widget must have active keyboard focus (FocusNode) to receive key events.'),
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
