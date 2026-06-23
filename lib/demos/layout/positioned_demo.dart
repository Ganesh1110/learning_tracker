import 'package:flutter/material.dart';

class PositionedDemo extends StatefulWidget {
  const PositionedDemo({super.key});

  @override
  State<PositionedDemo> createState() => _PositionedDemoState();
}

class _PositionedDemoState extends State<PositionedDemo> {
  bool _enableTop = true;
  double _top = 20.0;

  bool _enableBottom = false;
  double _bottom = 20.0;

  bool _enableLeft = true;
  double _left = 20.0;

  bool _enableRight = false;
  double _right = 20.0;

  double _width = 100.0;
  bool _enableWidth = true;

  double _height = 80.0;
  bool _enableHeight = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Positioned controls where a child of a Stack is positioned. '
          'You can set top, bottom, left, right, width, and height.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Playground Stack Container
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              Positioned(
                top: _enableTop ? _top : null,
                bottom: _enableBottom ? _bottom : null,
                left: _enableLeft ? _left : null,
                right: _enableRight ? _right : null,
                width: _enableWidth ? _width : null,
                height: _enableHeight ? _height : null,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.pink],
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
                    'Positioned',
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
        const SizedBox(height: 16),

        // Controls
        Text('Vertical Constraints', style: theme.textTheme.labelMedium),
        Row(
          children: [
            Checkbox(
              value: _enableTop,
              onChanged: (v) => setState(() {
                _enableTop = v ?? false;
                if (_enableTop) _enableBottom = false; // prioritize top
              }),
            ),
            const Text('Top'),
            Expanded(
              child: Slider(
                value: _top,
                min: 0,
                max: 100,
                onChanged: _enableTop ? (v) => setState(() => _top = v) : null,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _enableBottom,
              onChanged: (v) => setState(() {
                _enableBottom = v ?? false;
                if (_enableBottom) _enableTop = false; // prioritize bottom
              }),
            ),
            const Text('Bottom'),
            Expanded(
              child: Slider(
                value: _bottom,
                min: 0,
                max: 100,
                onChanged: _enableBottom ? (v) => setState(() => _bottom = v) : null,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),
        Text('Horizontal Constraints', style: theme.textTheme.labelMedium),
        Row(
          children: [
            Checkbox(
              value: _enableLeft,
              onChanged: (v) => setState(() {
                _enableLeft = v ?? false;
                if (_enableLeft) _enableRight = false; // prioritize left
              }),
            ),
            const Text('Left'),
            Expanded(
              child: Slider(
                value: _left,
                min: 0,
                max: 200,
                onChanged: _enableLeft ? (v) => setState(() => _left = v) : null,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _enableRight,
              onChanged: (v) => setState(() {
                _enableRight = v ?? false;
                if (_enableRight) _enableLeft = false; // prioritize right
              }),
            ),
            const Text('Right'),
            Expanded(
              child: Slider(
                value: _right,
                min: 0,
                max: 200,
                onChanged: _enableRight ? (v) => setState(() => _right = v) : null,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),
        Text('Sizing Constraints', style: theme.textTheme.labelMedium),
        Row(
          children: [
            Checkbox(
              value: _enableWidth,
              onChanged: (v) => setState(() => _enableWidth = v ?? false),
            ),
            const Text('Width'),
            Expanded(
              child: Slider(
                value: _width,
                min: 40,
                max: 200,
                onChanged: _enableWidth ? (v) => setState(() => _width = v) : null,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _enableHeight,
              onChanged: (v) => setState(() => _enableHeight = v ?? false),
            ),
            const Text('Height'),
            Expanded(
              child: Slider(
                value: _height,
                min: 30,
                max: 120,
                onChanged: _enableHeight ? (v) => setState(() => _height = v) : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
