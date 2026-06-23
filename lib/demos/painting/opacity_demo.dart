import 'package:flutter/material.dart';

class OpacityDemo extends StatefulWidget {
  const OpacityDemo({super.key});

  @override
  State<OpacityDemo> createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  double _opacity = 1.0;
  bool _useAnimated = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final child = Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepOrange, Colors.pink],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'Flutter 💙',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Mode toggle ────────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Opacity'),
            Switch(
              value: _useAnimated,
              onChanged: (v) => setState(() => _useAnimated = v),
            ),
            const Text('AnimatedOpacity'),
          ],
        ),

        // ── Widget display ─────────────────────────────────────────────
        _useAnimated
            ? AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 400),
                child: child,
              )
            : Opacity(opacity: _opacity, child: child),

        const SizedBox(height: 16),

        // ── Slider ─────────────────────────────────────────────────────
        Row(
          children: [
            Text(
              'Opacity:',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Slider(
                value: _opacity,
                min: 0,
                max: 1,
                divisions: 20,
                label: _opacity.toStringAsFixed(2),
                onChanged: (v) => setState(() => _opacity = v),
              ),
            ),
            SizedBox(
              width: 42,
              child: Text(
                _opacity.toStringAsFixed(2),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // ── Quick presets ──────────────────────────────────────────────
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [0.0, 0.25, 0.5, 0.75, 1.0].map((v) {
            return ChoiceChip(
              label: Text('${(v * 100).toInt()}%'),
              selected: (_opacity - v).abs() < 0.01,
              onSelected: (_) => setState(() => _opacity = v),
            );
          }).toList(),
        ),
      ],
    );
  }
}
