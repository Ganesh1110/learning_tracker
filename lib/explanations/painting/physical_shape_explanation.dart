import 'package:flutter/material.dart';

class PhysicalShapeExplanation extends StatelessWidget {
  const PhysicalShapeExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PhysicalShape Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PhysicalShape Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The PhysicalShape widget is a specialized version of PhysicalModel. '
              'Instead of applying elevation, colors, and shadows to a rounded rectangle '
              'or circle, PhysicalShape allows you to define a completely custom outline '
              'using a CustomClipper<Path>. This path is then used to render the background '
              'color and cast an elevation-based shadow.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, shadow styles (shadowColor, shadowOffset, shadowRadius, shadowOpacity) '
              'and elevation (Android) are generally limited to rectangular or circular boxes. '
              'For complex custom shapes (like triangles, stars, or custom vectors) with shadows, '
              'React Native developers must typically rely on SVG libraries (e.g., react-native-svg) '
              'with filter effects, or draw shapes on a Canvas/Skia (e.g., @shopify/react-native-skia).',
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
                    Text('• clipper: A CustomClipper<Path> defining the shape border.'),
                    Text('• elevation: Controls shadow depth (z-index projection).'),
                    Text('• color: The fill color of the shape.'),
                    Text('• shadowColor: The ambient shadow color projection.'),
                    Text('• clipBehavior: Controls whether the content within the shape is clipped.'),
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
