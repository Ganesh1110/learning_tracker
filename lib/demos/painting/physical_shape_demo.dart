import 'package:flutter/material.dart';

class PhysicalShapeDemo extends StatefulWidget {
  const PhysicalShapeDemo({super.key});

  @override
  State<PhysicalShapeDemo> createState() => _PhysicalShapeDemoState();
}

class _PhysicalShapeDemoState extends State<PhysicalShapeDemo> {
  double _elevation = 8.0;
  Color _color = Colors.teal;
  Color _shadowColor = Colors.black;
  final Clip _clipBehavior = Clip.none;
  int _clipperIndex = 0;

  final List<CustomClipper<Path>> _clippers = [
    _TriangleClipper(),
    _HexagonClipper(),
  ];

  final List<String> _clipperNames = ['Triangle', 'Hexagon'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PhysicalShape uses a custom path clipper to paint a physical model '
          'that casts shadows based on elevation.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Center(
          child: SizedBox(
            height: 160,
            width: 160,
            child: PhysicalShape(
              clipper: _clippers[_clipperIndex],
              elevation: _elevation,
              color: _color,
              shadowColor: _shadowColor,
              clipBehavior: _clipBehavior,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Physical\nShape',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Shape dropdown
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Clipper Shape:', style: theme.textTheme.bodySmall),
            DropdownButton<int>(
              value: _clipperIndex,
              items: List.generate(_clippers.length, (index) {
                return DropdownMenuItem<int>(
                  value: index,
                  child: Text(_clipperNames[index]),
                );
              }),
              onChanged: (val) {
                if (val != null) {
                  setState(() => _clipperIndex = val);
                }
              },
            ),
          ],
        ),

        // Elevation slider
        Row(
          children: [
            Text('Elevation: ${_elevation.toInt()}', style: theme.textTheme.bodySmall),
            Expanded(
              child: Slider(
                value: _elevation,
                min: 0,
                max: 24,
                divisions: 24,
                onChanged: (val) => setState(() => _elevation = val),
              ),
            ),
          ],
        ),

        // Colors
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Background Color:', style: theme.textTheme.bodySmall),
            Row(
              children: [Colors.teal, Colors.deepOrange, Colors.indigo].map((c) {
                return GestureDetector(
                  onTap: () => setState(() => _color = c),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: c,
                      shape: BoxShape.circle,
                      border: _color == c
                          ? Border.all(color: theme.colorScheme.primary, width: 2)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shadow Color:', style: theme.textTheme.bodySmall),
            Row(
              children: [Colors.black, Colors.red, Colors.blue].map((c) {
                return GestureDetector(
                  onTap: () => setState(() => _shadowColor = c),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: c,
                      shape: BoxShape.circle,
                      border: _shadowColor == c
                          ? Border.all(color: theme.colorScheme.primary, width: 2)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(w * 0.25, 0);
    path.lineTo(w * 0.75, 0);
    path.lineTo(w, h * 0.5);
    path.lineTo(w * 0.75, h);
    path.lineTo(w * 0.25, h);
    path.lineTo(0, h * 0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
