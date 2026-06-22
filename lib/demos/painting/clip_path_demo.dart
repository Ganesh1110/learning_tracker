import 'dart:math' as math;
import 'package:flutter/material.dart';

class ClipPathDemo extends StatefulWidget {
  const ClipPathDemo({super.key});

  @override
  State<ClipPathDemo> createState() => _ClipPathDemoState();
}

class _ClipPathDemoState extends State<ClipPathDemo> {
  String _selectedShape = 'Wave';
  double _modifierValue = 30.0; // Dynamic amplitude or angle modifier
  bool _showBounds = true;
  Clip _clipBehavior = Clip.antiAlias;

  final List<String> _shapes = ['Wave', 'Triangle', 'Star', 'Slanted'];
  final Map<String, Clip> _clipBehaviors = {
    'Anti-Alias (Default)': Clip.antiAlias,
    'Hard Edge': Clip.hardEdge,
    'Anti-Alias Save Layer': Clip.antiAliasWithSaveLayer,
    'None': Clip.none,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Clipper based on selection
    CustomClipper<Path> clipper;
    String sliderLabel = '';
    double minSliderValue = 0.0;
    double maxSliderValue = 100.0;

    switch (_selectedShape) {
      case 'Wave':
        clipper = _WaveClipper(_modifierValue);
        sliderLabel = 'Wave Amplitude';
        minSliderValue = 10.0;
        maxSliderValue = 60.0;
        break;
      case 'Triangle':
        clipper = _TriangleClipper(_modifierValue);
        sliderLabel = 'Apex Offset X';
        minSliderValue = 0.0;
        maxSliderValue = 200.0;
        break;
      case 'Star':
        clipper = _StarClipper(_modifierValue.toInt());
        sliderLabel = 'Star Points';
        minSliderValue = 3.0;
        maxSliderValue = 12.0;
        break;
      case 'Slanted':
      default:
        clipper = _SlantedClipper(_modifierValue);
        sliderLabel = 'Slant Height';
        minSliderValue = 0.0;
        maxSliderValue = 80.0;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'ClipPath Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Shape selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Shape: '),
                DropdownButton<String>(
                  value: _selectedShape,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedShape = val;
                        // Reset slider defaults for specific shapes
                        if (val == 'Star') {
                          _modifierValue = 5.0;
                        } else if (val == 'Wave') {
                          _modifierValue = 30.0;
                        } else if (val == 'Triangle') {
                          _modifierValue = 100.0;
                        } else {
                          _modifierValue = 40.0;
                        }
                      });
                    }
                  },
                  items: _shapes.map((s) {
                    return DropdownMenuItem(value: s, child: Text(s));
                  }).toList(),
                ),
              ],
            ),

            // Shape Modifier Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('$sliderLabel: '),
                SizedBox(
                  width: 120,
                  child: Slider(
                    value: _modifierValue.clamp(minSliderValue, maxSliderValue),
                    min: minSliderValue,
                    max: maxSliderValue,
                    divisions: (maxSliderValue - minSliderValue).toInt() == 0
                        ? 1
                        : (maxSliderValue - minSliderValue).toInt(),
                    label: _selectedShape == 'Star'
                        ? _modifierValue.toInt().toString()
                        : _modifierValue.toStringAsFixed(1),
                    onChanged: (val) => setState(() => _modifierValue = val),
                  ),
                ),
                Text(
                  _selectedShape == 'Star'
                      ? _modifierValue.toInt().toString()
                      : _modifierValue.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // Clip Behavior
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Clip Behavior: '),
                DropdownButton<Clip>(
                  value: _clipBehavior,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _clipBehavior = val);
                    }
                  },
                  items: _clipBehaviors.entries.map((e) {
                    return DropdownMenuItem(
                      value: e.value,
                      child: Text(e.key),
                    );
                  }).toList(),
                ),
              ],
            ),

            // Show Bounds
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _showBounds,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _showBounds = val);
                    }
                  },
                ),
                const Text('Show original bounds'),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Bounding box representing original bounds
              if (_showBounds)
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.error.withValues(alpha: 0.5),
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      color: theme.colorScheme.errorContainer,
                      child: Text(
                        'Original Bounds (200x200)',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

              // The Clipped Widget
              ClipPath(
                clipBehavior: _clipBehavior,
                clipper: clipper,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.colorScheme.secondary, theme.colorScheme.primary],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Grid Overlay for visualization
                      Opacity(
                        opacity: 0.15,
                        child: GridPaper(
                          color: theme.colorScheme.onPrimary,
                          interval: 40,
                          divisions: 2,
                          subdivisions: 1,
                          child: const SizedBox.expand(),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _selectedShape == 'Star'
                                  ? Icons.star_rounded
                                  : _selectedShape == 'Wave'
                                      ? Icons.waves_rounded
                                      : _selectedShape == 'Triangle'
                                          ? Icons.change_history_rounded
                                          : Icons.architecture_rounded,
                              size: 48,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'ClipPath: $_selectedShape',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
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

// Clipper for a Sine Wave bottom
class _WaveClipper extends CustomClipper<Path> {
  final double amplitude;

  const _WaveClipper(this.amplitude);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - amplitude);

    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2, size.height - amplitude);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secondControlPoint = Offset(size.width * 3 / 4, size.height - (amplitude * 2));
    final secondEndPoint = Offset(size.width, size.height - amplitude);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _WaveClipper oldClipper) => oldClipper.amplitude != amplitude;
}

// Clipper for a custom Triangle
class _TriangleClipper extends CustomClipper<Path> {
  final double apexX;

  const _TriangleClipper(this.apexX);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(apexX, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _TriangleClipper oldClipper) => oldClipper.apexX != apexX;
}

// Clipper for a Custom Slanted Box (Diagonal cut)
class _SlantedClipper extends CustomClipper<Path> {
  final double slantHeight;

  const _SlantedClipper(this.slantHeight);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - slantHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _SlantedClipper oldClipper) => oldClipper.slantHeight != slantHeight;
}

// Clipper for a Star Shape
class _StarClipper extends CustomClipper<Path> {
  final int points;

  const _StarClipper(this.points);

  @override
  Path getClip(Size size) {
    final path = Path();
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double maxRadius = math.min(size.width, size.height) / 2;
    final double minRadius = maxRadius * 0.4;
    final double angleStep = math.pi / points;

    for (int i = 0; i < 2 * points; i++) {
      final double r = i.isEven ? maxRadius : minRadius;
      final double angle = i * angleStep - math.pi / 2;
      final double x = centerX + r * math.cos(angle);
      final double y = centerY + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _StarClipper oldClipper) => oldClipper.points != points;
}
