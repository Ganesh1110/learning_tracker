import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class RawImageDemo extends StatefulWidget {
  const RawImageDemo({super.key});

  @override
  State<RawImageDemo> createState() => _RawImageDemoState();
}

class _RawImageDemoState extends State<RawImageDemo> {
  ui.Image? _image;
  double _scale = 2.0;
  Color _blendColor = Colors.teal;
  BlendMode _blendMode = BlendMode.modulate;
  bool _useBlendColor = false;
  ImageRepeat _repeat = ImageRepeat.noRepeat;

  @override
  void initState() {
    super.initState();
    _generateImage();
  }

  Future<void> _generateImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 80, 80));
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw a colorful checkerboard pattern
    paint.color = Colors.blue.shade600;
    canvas.drawRect(const Rect.fromLTWH(0, 0, 40, 40), paint);
    canvas.drawRect(const Rect.fromLTWH(40, 40, 40, 40), paint);

    paint.color = Colors.orange.shade600;
    canvas.drawRect(const Rect.fromLTWH(40, 0, 40, 40), paint);
    canvas.drawRect(const Rect.fromLTWH(0, 40, 40, 40), paint);

    // Draw a small white circle in the center
    paint.color = Colors.white;
    canvas.drawCircle(const Offset(40, 40), 16, paint);

    final picture = recorder.endRecording();
    final img = await picture.toImage(80, 80);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RawImage is a low-level widget that displays a dart:ui.Image '
          'directly without asset loaders or network caches.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Center(
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            clipBehavior: Clip.antiAlias,
            child: _image == null
                ? const Center(child: CircularProgressIndicator())
                : Center(
                    child: RawImage(
                      image: _image,
                      scale: _scale,
                      color: _useBlendColor ? _blendColor : null,
                      colorBlendMode: _blendMode,
                      repeat: _repeat,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 16),

        // Image controls
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text('scale: ${_scale.toStringAsFixed(1)}', style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _scale,
                min: 0.5,
                max: 4.0,
                onChanged: (v) => setState(() => _scale = v),
              ),
            ),
          ],
        ),

        // Blend color toggle & selector
        Row(
          children: [
            Checkbox(
              value: _useBlendColor,
              onChanged: (v) => setState(() => _useBlendColor = v ?? false),
            ),
            Text('Use Blend Color', style: theme.textTheme.bodySmall),
            const Spacer(),
            if (_useBlendColor)
              Row(
                children: [Colors.teal, Colors.red, Colors.purple].map((c) {
                  return GestureDetector(
                    onTap: () => setState(() => _blendColor = c),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: c,
                        shape: BoxShape.circle,
                        border: _blendColor == c
                            ? Border.all(color: theme.colorScheme.primary, width: 2)
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),

        // Blend mode dropdown
        if (_useBlendColor)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Blend Mode:', style: theme.textTheme.bodySmall),
              DropdownButton<BlendMode>(
                value: _blendMode,
                items: const [
                  DropdownMenuItem(value: BlendMode.modulate, child: Text('Modulate')),
                  DropdownMenuItem(value: BlendMode.colorBurn, child: Text('Color Burn')),
                  DropdownMenuItem(value: BlendMode.difference, child: Text('Difference')),
                ],
                onChanged: (v) {
                  if (v != null) setState(() => _blendMode = v);
                },
              ),
            ],
          ),

        // Repeat dropdown
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Repeat:', style: theme.textTheme.bodySmall),
            DropdownButton<ImageRepeat>(
              value: _repeat,
              items: const [
                DropdownMenuItem(value: ImageRepeat.noRepeat, child: Text('No Repeat')),
                DropdownMenuItem(value: ImageRepeat.repeat, child: Text('Repeat Both')),
                DropdownMenuItem(value: ImageRepeat.repeatX, child: Text('Repeat X')),
                DropdownMenuItem(value: ImageRepeat.repeatY, child: Text('Repeat Y')),
              ],
              onChanged: (v) {
                if (v != null) setState(() => _repeat = v);
              },
            ),
          ],
        ),
      ],
    );
  }
}
