import 'package:flutter/material.dart';

class ShaderMaskExplanation extends StatelessWidget {
  const ShaderMaskExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ShaderMask Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ShaderMask Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'ShaderMask is a painting widget in Flutter. It applies a Shader '
              '(such as LinearGradient, RadialGradient, or SweepGradient) '
              'to its child widget during the compositing phase. You define a '
              'shaderCallback which calculates coordinates relative to the child\'s '
              'render box, and select a BlendMode to compose the shader over the child '
              '(e.g., BlendMode.srcIn to fill the child\'s solid shape).',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, there is no direct equivalent for applying arbitrary gradient shaders '
              'to UI text or icon vectors. Developers usually rely on external packages like:\n'
              '• `@react-native-masked-view/masked-view` + `expo-linear-gradient` to stack and clip gradient layers.\n'
              '• SVG elements (using `react-native-svg`) with linear/radial gradient tags defining shape gradients directly.',
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
                    Text('• shaderCallback: Callback that returns a Shader given the child\'s layout Rect.'),
                    Text('• blendMode: The compositing blend operations (defaults to BlendMode.modulate).'),
                    Text('• child: The target element to apply the shader to.'),
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
