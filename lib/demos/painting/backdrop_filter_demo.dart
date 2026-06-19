import 'dart:ui';
import 'package:flutter/material.dart';

class BackdropFilterDemo extends StatefulWidget {
  const BackdropFilterDemo({super.key});

  @override
  State<BackdropFilterDemo> createState() => _BackdropFilterDemoState();
}

class _BackdropFilterDemoState extends State<BackdropFilterDemo> {
  double _blurSigma = 6.0;
  double _opacity = 0.15;
  Color _tintColor = Colors.white;

  final Map<String, Color> _tints = {
    'Frosted Light': Colors.white,
    'Frosted Dark': Colors.black,
    'Frosted Indigo': Colors.indigo,
    'Frosted Amber': Colors.amber,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Panel
        Text(
          'Glassmorphism Configurator',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Tint Color Picker
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Tint Color: '),
                const SizedBox(width: 4),
                DropdownButton<Color>(
                  value: _tintColor,
                  onChanged: (color) {
                    if (color != null) {
                      setState(() => _tintColor = color);
                    }
                  },
                  items: _tints.entries.map((e) {
                    return DropdownMenuItem(
                      value: e.value,
                      child: Text(e.key),
                    );
                  }).toList(),
                ),
              ],
            ),

            // Opacity slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Overlay Opacity: '),
                SizedBox(
                  width: 130,
                  child: Slider(
                    value: _opacity,
                    min: 0.0,
                    max: 0.6,
                    divisions: 6,
                    label: _opacity.toStringAsFixed(2),
                    onChanged: (val) => setState(() => _opacity = val),
                  ),
                ),
                Text(
                  _opacity.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),

        // Blur Sigma Slider
        Row(
          children: [
            const SizedBox(width: 90, child: Text('Blur Intensity:')),
            Expanded(
              child: Slider(
                value: _blurSigma,
                min: 0.0,
                max: 15.0,
                divisions: 15,
                label: 'Sigma ${_blurSigma.round()}',
                onChanged: (val) => setState(() => _blurSigma = val),
              ),
            ),
            Text(
              '${_blurSigma.round()} σ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(height: 24),

        // Playground Canvas with floating elements and BackdropFilter card
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. Background Content: Rich colored shapes and gridlines
              Positioned.fill(
                child: Container(
                  color: Colors.grey.shade900,
                  child: GridPaper(
                    color: Colors.white.withValues(alpha: 0.05),
                    divisions: 2,
                    subdivisions: 1,
                    child: Container(),
                  ),
                ),
              ),

              // Decorative Circle 1 (Top Left)
              Positioned(
                top: 20,
                left: 30,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Decorative Circle 2 (Bottom Right)
              Positioned(
                bottom: 10,
                right: 40,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Decorative Diagonal Rectangle
              Positioned(
                top: 80,
                right: 20,
                child: Transform.rotate(
                  angle: 0.4,
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent.shade400,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              // Decorative Bottom Left shape
              Positioned(
                bottom: 20,
                left: 10,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Center text inside background (to show it blurs clearly)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 120),
                  child: Text(
                    'BLURRED BACKDROP TEXT',
                    style: TextStyle(
                      color: Colors.white24,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              // 2. Glassmorphic card overlay using BackdropFilter
              Positioned(
                width: 250,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      // BackdropFilter widget applying blur
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: _blurSigma,
                            sigmaY: _blurSigma,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _tintColor.withValues(alpha: _opacity),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.25),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),

                      // Card Content
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Glassmorphism',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Icon(
                                    Icons.blur_circular_rounded,
                                    color: Colors.white.withValues(alpha: 0.8),
                                    size: 20,
                                  ),
                                ],
                              ),
                              const Text(
                                'Notice how the floating shapes and lines behind this card are blurred dynamically.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  height: 1.3,
                                ),
                              ),
                              Text(
                                'Blur Sigma: ${_blurSigma.round()} σ',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
