import 'package:flutter/material.dart';

class RowExplanation extends StatelessWidget {
  const RowExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Row Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The Row widget is a core layout component in Flutter. It lays out its children '
              'in a horizontal array. Row is built using Flutter\'s Flex architecture and '
              'presents layout alignments (MainAxisAlignment along the horizontal axis, '
              'CrossAxisAlignment along the vertical axis). '
              'It defaults to filling all horizontal space unless MainAxisSize.min is specified.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, Row maps directly to a standard `<View>` with horizontal flex styling:\n'
              '• style={{ flexDirection: "row" }}\n'
              '• justifyContent: maps directly to mainAxisAlignment (start, center, space-between, etc.)\n'
              '• alignItems: maps directly to crossAxisAlignment (start, center, stretch, etc.)',
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
                    Text('1. Unbounded Width Errors: If you wrap a scrollable horizontal list (like ListView or row-based TextField) inside a Row without wrapping it in an `Expanded` or `Flexible` widget, Flutter will throw an "Unbounded width" layout crash. This is because Row allows children to expand infinitely unless constrained.'),
                    SizedBox(height: 6),
                    Text('2. Wrapping: Row does not wrap children that exceed screen width (it outputs a yellow-and-black striped overflow error instead). For wrapping behaviors, use the `Wrap` widget in Flutter, not a Row.'),
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
