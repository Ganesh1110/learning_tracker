import 'package:flutter/material.dart';

class AnimatedSlideDemo extends StatefulWidget {
  const AnimatedSlideDemo({super.key});

  @override
  State<AnimatedSlideDemo> createState() => _AnimatedSlideDemoState();
}

class _AnimatedSlideDemoState extends State<AnimatedSlideDemo> {
  double _offsetX = 0.0;
  double _offsetY = 0.0;
  double _durationMs = 500;
  Curve _selectedCurve = Curves.easeInOut;

  final Map<String, Curve> _curves = {
    'Linear': Curves.linear,
    'Ease In Out': Curves.easeInOut,
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Decelerate': Curves.decelerate,
  };

  void _setPreset(double x, double y) {
    setState(() {
      _offsetX = x;
      _offsetY = y;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Playground Canvas
        Container(
          height: 250,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Grid background lines helper
              Positioned.fill(
                child: CustomPaint(
                  painter: _GridPainter(theme.dividerColor.withOpacity(0.4)),
                ),
              ),

              // Outline of the "original/home" position
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 11,
                      color: theme.colorScheme.primary.withOpacity(0.5),
                    ),
                  ),
                ),
              ),

              // The AnimatedSlide Widget
              AnimatedSlide(
                offset: Offset(_offsetX, _offsetY),
                duration: Duration(milliseconds: _durationMs.round()),
                curve: _selectedCurve,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.shadow.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.unfold_more, color: Colors.white),
                        SizedBox(height: 4),
                        Text(
                          'Slide Me',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Controls Panel
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Preset Shortcuts
              Text(
                'Quick Presets',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _setPreset(0.0, 0.0),
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () => _setPreset(-1.0, 0.0),
                    child: const Text('Left (-1.0)'),
                  ),
                  ElevatedButton(
                    onPressed: () => _setPreset(1.0, 0.0),
                    child: const Text('Right (1.0)'),
                  ),
                  ElevatedButton(
                    onPressed: () => _setPreset(0.0, -1.0),
                    child: const Text('Up (-1.0)'),
                  ),
                  ElevatedButton(
                    onPressed: () => _setPreset(0.0, 1.0),
                    child: const Text('Down (1.0)'),
                  ),
                ],
              ),
              const Divider(height: 24),

              Text(
                'Configuration Controls',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // X Offset Slider
              Row(
                children: [
                  const SizedBox(width: 80, child: Text('Offset X:')),
                  Expanded(
                    child: Slider(
                      value: _offsetX,
                      min: -2.0,
                      max: 2.0,
                      divisions: 16,
                      label: _offsetX.toStringAsFixed(2),
                      onChanged: (val) {
                        setState(() {
                          _offsetX = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      '${(_offsetX * 100).round()}%',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),

              // Y Offset Slider
              Row(
                children: [
                  const SizedBox(width: 80, child: Text('Offset Y:')),
                  Expanded(
                    child: Slider(
                      value: _offsetY,
                      min: -2.0,
                      max: 2.0,
                      divisions: 16,
                      label: _offsetY.toStringAsFixed(2),
                      onChanged: (val) {
                        setState(() {
                          _offsetY = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      '${(_offsetY * 100).round()}%',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),

              // Curve Picker & Duration Slider Row
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Curve
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Curve: '),
                      const SizedBox(width: 4),
                      DropdownButton<Curve>(
                        value: _selectedCurve,
                        onChanged: (curve) {
                          if (curve != null) {
                            setState(() {
                              _selectedCurve = curve;
                            });
                          }
                        },
                        items: _curves.entries.map((e) {
                          return DropdownMenuItem(
                            value: e.value,
                            child: Text(e.key),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  // Duration
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Duration: '),
                      SizedBox(
                        width: 140,
                        child: Slider(
                          value: _durationMs,
                          min: 200,
                          max: 1200,
                          divisions: 5,
                          label: '${_durationMs.round()} ms',
                          onChanged: (val) {
                            setState(() {
                              _durationMs = val;
                            });
                          },
                        ),
                      ),
                      Text(
                        '${_durationMs.round()}ms',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Custom Painter to draw grid background lines
class _GridPainter extends CustomPainter {
  final Color gridColor;

  _GridPainter(this.gridColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const step = 45.0; // Alignment step

    // Draw vertical lines
    for (double x = step; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = step; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) => false;
}
