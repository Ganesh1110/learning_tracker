import 'package:flutter/material.dart';

class PositionedDirectionalDemo extends StatefulWidget {
  const PositionedDirectionalDemo({super.key});

  @override
  State<PositionedDirectionalDemo> createState() => _PositionedDirectionalDemoState();
}

class _PositionedDirectionalDemoState extends State<PositionedDirectionalDemo> {
  TextDirection _textDirection = TextDirection.ltr;
  double _start = 20.0;
  double _top = 20.0;
  final double _width = 120.0;
  final double _height = 80.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PositionedDirectional uses start and end offsets instead of left '
          'and right. Its horizontal placement adjusts automatically when the '
          'text direction switches (e.g. LTR vs RTL).',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Directionality Toggle
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Directionality:', style: theme.textTheme.bodySmall),
            SegmentedButton<TextDirection>(
              segments: const [
                ButtonSegment(
                  value: TextDirection.ltr,
                  label: Text('LTR (Left-to-Right)'),
                ),
                ButtonSegment(
                  value: TextDirection.rtl,
                  label: Text('RTL (Right-to-Left)'),
                ),
              ],
              selected: {_textDirection},
              onSelectionChanged: (val) {
                setState(() => _textDirection = val.first);
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Live preview area
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Directionality(
            textDirection: _textDirection,
            child: Stack(
              children: [
                PositionedDirectional(
                  start: _start,
                  top: _top,
                  width: _width,
                  height: _height,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.redAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Directional',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Center(
            child: Text(
              _textDirection == TextDirection.ltr
                  ? 'Start coordinates begin on the LEFT side.'
                  : 'Start coordinates begin on the RIGHT side.',
              style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Start coordinate slider
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text('start: ${_start.toInt()}', style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _start,
                min: 0,
                max: 200,
                onChanged: (v) => setState(() => _start = v),
              ),
            ),
          ],
        ),

        // Top coordinate slider
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text('top: ${_top.toInt()}', style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _top,
                min: 0,
                max: 100,
                onChanged: (v) => setState(() => _top = v),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
