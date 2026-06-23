import 'package:flutter/material.dart';

class PhysicalModelExplanation extends StatelessWidget {
  const PhysicalModelExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PhysicalModel Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is PhysicalModel?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'PhysicalModel is a low-level widget that clips its child to '
              'a shape (rectangle or circle) and paints a material elevation '
              'shadow behind it. It is the building block for Card, Material, '
              'and ElevatedButton.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'The elevation + shadowColor props on React Native\'s View '
              '(Android) or a custom shadow on iOS are the closest equivalent. '
              'Flutter\'s PhysicalModel gives you cross-platform consistent '
              'shadows with precise control over color and blur.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• elevation – shadow depth (0 = no shadow)'),
            Text('• color – the surface color of the widget'),
            Text('• shadowColor – color of the drop shadow'),
            Text('• shape – BoxShape.rectangle (default) or .circle'),
            Text('• borderRadius – corner rounding (rect only)'),
            Text('• clipBehavior – how to clip child to shape'),
            SizedBox(height: 12),
            Text('AnimatedPhysicalModel',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Use AnimatedPhysicalModel to smoothly interpolate elevation, '
              'color, and shadow color over a duration — great for press '
              'feedback animations.',
            ),
          ],
        ),
      ),
    );
  }
}
