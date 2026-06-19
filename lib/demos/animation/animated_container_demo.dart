import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  // Animated properties
  double _width = 120.0;
  double _height = 120.0;
  Color _color = Colors.indigo;
  double _borderRadius = 16.0;
  double _paddingVal = 16.0;
  bool _hasShadow = true;

  // Animation settings
  Curve _curve = Curves.fastOutSlowIn;
  double _durationMs = 500.0;

  final Map<String, Curve> _curves = {
    'Fast Out Slow In': Curves.fastOutSlowIn,
    'Ease In Out': Curves.easeInOut,
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Linear': Curves.linear,
  };

  void _randomize() {
    final random = Random();
    setState(() {
      _width = random.nextInt(100).toDouble() + 80.0; // 80 - 180
      _height = random.nextInt(100).toDouble() + 80.0; // 80 - 180
      _borderRadius = random.nextInt(60).toDouble(); // 0 - 60
      _paddingVal = random.nextInt(24).toDouble() + 4.0; // 4 - 28

      // Pick a random Material color
      final List<Color> validColors = [
        Colors.indigo,
        Colors.pink,
        Colors.teal,
        Colors.amber,
        Colors.deepOrange,
        Colors.purple,
        Colors.cyan,
        Colors.green,
      ];
      _color = validColors[random.nextInt(validColors.length)];
      _hasShadow = random.nextBool();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Settings Row 1 (Curve and Duration)
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Curve',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<Curve>(
                    value: _curve,
                    isExpanded: true,
                    onChanged: (Curve? val) {
                      if (val != null) {
                        setState(() => _curve = val);
                      }
                    },
                    items: _curves.entries.map((entry) {
                      return DropdownMenuItem<Curve>(
                        value: entry.value,
                        child: Text(entry.key, style: const TextStyle(fontSize: 13)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration: ${_durationMs.toInt()} ms',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: _durationMs,
                    min: 100.0,
                    max: 2000.0,
                    divisions: 19,
                    onChanged: (val) => setState(() => _durationMs = val),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Settings Row 2 (Individual Property Tweak Sliders)
        ExpansionTile(
          title: Text(
            'Tweak Properties Manually',
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 4),
          dense: true,
          children: [
            _buildSliderRow(
              'Size: ${_width.toInt()}x${_height.toInt()}',
              _width,
              80.0,
              180.0,
              (val) => setState(() {
                _width = val;
                _height = val;
              }),
            ),
            _buildSliderRow(
              'Border Radius: ${_borderRadius.toInt()}px',
              _borderRadius,
              0.0,
              60.0,
              (val) => setState(() => _borderRadius = val),
            ),
            _buildSliderRow(
              'Inner Padding: ${_paddingVal.toInt()}px',
              _paddingVal,
              4.0,
              30.0,
              (val) => setState(() => _paddingVal = val),
            ),
            Row(
              children: [
                const Text('Box Shadow:', style: TextStyle(fontSize: 13)),
                Checkbox(
                  value: _hasShadow,
                  onChanged: (val) => setState(() => _hasShadow = val ?? false),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Action Buttons
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _randomize,
                icon: const Icon(Icons.shuffle_rounded),
                label: const Text('Randomize Properties'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Canvas displaying the AnimatedContainer
        Container(
          height: 220,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Center(
            child: AnimatedContainer(
              width: _width,
              height: _height,
              duration: Duration(milliseconds: _durationMs.toInt()),
              curve: _curve,
              padding: EdgeInsets.all(_paddingVal),
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
                boxShadow: _hasShadow
                    ? [
                        BoxShadow(
                          color: _color.withValues(alpha: 0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ]
                    : [],
              ),
              child: const Center(
                child: FittedBox(
                  child: Text(
                    'Container',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSliderRow(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: const TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
