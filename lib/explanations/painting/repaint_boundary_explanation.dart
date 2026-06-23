import 'package:flutter/material.dart';

class RepaintBoundaryExplanation extends StatelessWidget {
  const RepaintBoundaryExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RepaintBoundary Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RepaintBoundary Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'RepaintBoundary is an optimization widget in Flutter. When rendering a '
              'complex layout tree, any single repaint request (e.g. from an animated loader) '
              'normally propagates up and repaints all widgets in the same repaint layer. '
              'By wrapping a widget (like a signature canvas, maps, or heavy lists) in a '
              'RepaintBoundary, you tell Flutter to paint that child on its own separate display list. '
              'This keeps the painting cycles isolated: parent animations do not redraw the child, '
              'and child repaints do not redraw the parent.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, layout and rasterization are handled by native platform engines '
              '(Android Views and iOS UIViews). To achieve similar rendering separation '
              'and prevent laggy redraws of heavy layouts, developers use optimization props: \n'
              '• renderToHardwareTextureAndroid={true} (Android): Caches the view as a hardware texture on the GPU.\n'
              '• shouldRasterizeIOS={true} (iOS): Renders the view as a bitmap layer in Core Animation.',
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
                    Text('• Do wrap: Heavy custom painters, complex scrollable lists, webview layers, or constantly changing animations.'),
                    Text('• Avoid wrapping: Extremely simple static widgets, as creating a separate canvas layer carries minor memory overhead.'),
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
