import 'package:flutter/material.dart';

class RawImageExplanation extends StatelessWidget {
  const RawImageExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RawImage Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RawImage Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'The RawImage widget is a low-level utility in Flutter. It is used when '
              'you want to display a direct dart:ui.Image object (which represents a raw '
              'pixel bitmap in GPU memory). '
              'Unlike Image.asset or Image.network, RawImage does not look up files, '
              'handle HTTP caches, or perform layout scaling automatically; it simply '
              'paints the raw bitmap. It is mostly used by developers building custom '
              'image loaders, canvas drawing applications, or engine wrappers.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, there is no direct counterpart to RawImage. To render raw pixel '
              'buffers or image streams, developers must write native platform modules '
              '(Java/Objective-C wrappers) that write directly to an Android Bitmap or iOS '
              'CGImage, or convert data to base64 URIs and pass it to standard `<Image source={{ uri }} />`. '
              'Using base64 URIs in React Native is memory-intensive because the bridge must parse '
              'and duplicate the string buffers.',
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
                    Text('• image: The dart:ui.Image object representing the raw bitmap.'),
                    Text('• scale: Specifies the pixel density scaling factor for layout.'),
                    Text('• color: Color filter color applied over the image.'),
                    Text('• colorBlendMode: Blend mode applied to the color filter.'),
                    Text('• repeat: Dictates image tiling behavior (ImageRepeat).'),
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
