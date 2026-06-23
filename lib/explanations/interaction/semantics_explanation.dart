import 'package:flutter/material.dart';

class SemanticsExplanation extends StatelessWidget {
  const SemanticsExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Semantics Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Semantics Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The Semantics widget annotates its child with description tags that '
              'system accessibility engines (like Google TalkBack for Android or Apple '
              'VoiceOver for iOS) interpret when navigating with a screen reader. '
              'It provides specific fields for descriptions (label), action outcomes (hint), '
              'active state amounts (value), and roles (button, selected, header, etc.).',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, accessibility properties are configured directly as props '
              'on standard components (like `<View>`, `<Text>`, or `<TouchableOpacity>`):\n'
              '• accessible={true}: Enables accessibility parsing (similar to Semantics).\n'
              '• accessibilityLabel="description": maps to `label`.\n'
              '• accessibilityHint="action results": maps to `hint`.\n'
              '• accessibilityValue={{ text: "value" }}: maps to `value`.\n'
              '• accessibilityRole="button": maps to `button: true` / custom roles.\n'
              '• accessibilityState={{ disabled: !enabled }}: maps to `enabled`.',
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Best Practices',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text('• ExcludeSemantics: Use ExcludeSemantics to strip descriptions from decorative icons or purely visual elements, preventing screen reader clutter.'),
                    Text('• BlockSemantics: Use BlockSemantics for modal dialog views to lock/drop accessibility parsing of underlying views behind the modal drawer.'),
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
