import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleDemo extends StatefulWidget {
  const AnimatedDefaultTextStyleDemo({super.key});

  @override
  State<AnimatedDefaultTextStyleDemo> createState() => _AnimatedDefaultTextStyleDemoState();
}

class _AnimatedDefaultTextStyleDemoState extends State<AnimatedDefaultTextStyleDemo> {
  double _fontSize = 18.0;
  double _letterSpacing = 0.0;
  int _colorIndex = 0;
  int _weightIndex = 0;
  bool _italic = false;
  bool _underline = false;
  Curve _curve = Curves.easeInOut;
  double _durationMs = 500.0;

  final List<Color> _colors = [
    const Color(0xFF5C6BC0), // indigo
    const Color(0xFFEC407A), // pink
    const Color(0xFF26A69A), // teal
    const Color(0xFFFF7043), // deepOrange
    const Color(0xFF8D6E63), // brown
  ];


  final List<FontWeight> _weights = [
    FontWeight.w300,
    FontWeight.w400,
    FontWeight.w600,
    FontWeight.w700,
    FontWeight.w900,
  ];
  final List<String> _weightNames = ['Light', 'Regular', 'Semi-Bold', 'Bold', 'Black'];

  final Map<String, Curve> _curves = {
    'Ease In Out': Curves.easeInOut,
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Linear': Curves.linear,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Preview canvas
        Container(
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: _durationMs.toInt()),
            curve: _curve,
            style: TextStyle(
              fontSize: _fontSize,
              color: _colors[_colorIndex],
              fontWeight: _weights[_weightIndex],
              letterSpacing: _letterSpacing,
              fontStyle: _italic ? FontStyle.italic : FontStyle.normal,
              decoration: _underline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: _colors[_colorIndex],
            ),
            child: const Text('Flutter Widgets'),
          ),
        ),
        const SizedBox(height: 16),

        // Font size slider
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Font Size: ${_fontSize.toStringAsFixed(0)} sp',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
            Slider(value: _fontSize, min: 10, max: 40, divisions: 30,
              onChanged: (v) => setState(() => _fontSize = v)),
          ],
        ),

        // Letter spacing slider
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Letter Spacing: ${_letterSpacing.toStringAsFixed(1)}',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
            Slider(value: _letterSpacing, min: -2.0, max: 8.0, divisions: 20,
              onChanged: (v) => setState(() => _letterSpacing = v)),
          ],
        ),

        // Duration slider
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Duration: ${_durationMs.toInt()} ms',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
            Slider(value: _durationMs, min: 100, max: 1500, divisions: 14,
              onChanged: (v) => setState(() => _durationMs = v)),
          ],
        ),
        const SizedBox(height: 8),

        // Color selector
        Text('Text Color', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_colors.length, (i) {
            return GestureDetector(
              onTap: () => setState(() => _colorIndex = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: _colors[i],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _colorIndex == i ? theme.colorScheme.onSurface : Colors.transparent,
                    width: 2.5,
                  ),
                  boxShadow: _colorIndex == i ? [BoxShadow(color: _colors[i].withValues(alpha: 0.5), blurRadius: 8)] : null,
                ),
                child: _colorIndex == i
                    ? const Icon(Icons.check_rounded, color: Colors.white, size: 18)
                    : null,
              ),
            );
          }),
        ),
        const SizedBox(height: 12),

        // Weight selector
        Text('Font Weight', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_weightNames.length, (i) {
            return ChoiceChip(
              label: Text(_weightNames[i]),
              selected: _weightIndex == i,
              onSelected: (_) => setState(() => _weightIndex = i),
            );
          }),
        ),
        const SizedBox(height: 12),

        // Toggles + Curve selector
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            FilterChip(
              label: const Text('Italic'),
              selected: _italic,
              onSelected: (v) => setState(() => _italic = v),
            ),
            FilterChip(
              label: const Text('Underline'),
              selected: _underline,
              onSelected: (v) => setState(() => _underline = v),
            ),
            SizedBox(
              width: 160,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Curve',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Curve>(
                    value: _curve,
                    isDense: true,
                    items: _curves.entries.map((e) => DropdownMenuItem(
                      value: e.value,
                      child: Text(e.key, style: const TextStyle(fontSize: 12)),
                    )).toList(),
                    onChanged: (v) { if (v != null) setState(() => _curve = v); },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
