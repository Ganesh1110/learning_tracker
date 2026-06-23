import 'package:flutter/material.dart';

class PaddingExplanation extends StatelessWidget {
  const PaddingExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Padding Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is Padding?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Padding adds empty space around its child using an '
              'EdgeInsets value. It is one of the most fundamental '
              'layout widgets in Flutter and has no visual rendering '
              'of its own — it simply insets its child.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Directly equivalent to the padding style prop on any '
              'React Native View. In RN you write style={{ padding: 16 }} '
              'or paddingHorizontal / paddingVertical. In Flutter you '
              'use Padding(padding: EdgeInsets.all(16), child: ...).',
            ),
            SizedBox(height: 20),
            Text('EdgeInsets Variants',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• EdgeInsets.all(v) – same on all sides'),
            Text(
                '• EdgeInsets.symmetric(h, v) – separate horizontal/vertical'),
            Text('• EdgeInsets.fromLTRB(l, t, r, b) – each side explicitly'),
            Text('• EdgeInsets.only(left: l, top: t, ...) – named sides'),
            Text(
                '• EdgeInsetsDirectional – RTL-aware (start/end instead of left/right)'),
            SizedBox(height: 12),
            Text('Performance Note',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Padding is very lightweight. Prefer it over wrapping in a '
              'Container just for padding — fewer widgets = faster layout.',
            ),
          ],
        ),
      ),
    );
  }
}
