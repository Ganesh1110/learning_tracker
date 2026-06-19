import 'package:flutter/material.dart';

class AlwaysStoppedAnimationDemo extends StatefulWidget {
  const AlwaysStoppedAnimationDemo({super.key});

  @override
  State<AlwaysStoppedAnimationDemo> createState() => _AlwaysStoppedAnimationDemoState();
}

class _AlwaysStoppedAnimationDemoState extends State<AlwaysStoppedAnimationDemo> {
  Color _selectedColor = Colors.indigo;
  double _opacityVal = 0.5;

  final Map<String, Color> _colors = {
    'Indigo': Colors.indigo,
    'Pink': Colors.pink,
    'Teal': Colors.teal,
    'Amber': Colors.amber,
    'Red': Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Color Picker for Indicator
        Row(
          children: [
            const Text('Indicator Color: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const Spacer(),
            SizedBox(
              width: 160,
              child: InputDecorator(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Color>(
                    value: _selectedColor,
                    isDense: true,
                    items: _colors.entries.map((entry) {
                      return DropdownMenuItem(
                        value: entry.value,
                        child: Text(entry.key, style: const TextStyle(fontSize: 13)),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => _selectedColor = val);
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Slider for Fade Transition Opacity
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Static Opacity: ${_opacityVal.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Slider(
              value: _opacityVal,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              onChanged: (val) => setState(() => _opacityVal = val),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Display Canvas
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 1. CircularProgressIndicator using AlwaysStoppedAnimation for valueColor
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    // valueColor expects an Animation<Color?>. We wrap our static color in AlwaysStoppedAnimation:
                    valueColor: AlwaysStoppedAnimation<Color>(_selectedColor),
                  ),
                  const SizedBox(height: 8),
                  Text('Progress Indicator', style: theme.textTheme.labelMedium),
                ],
              ),

              // 2. FadeTransition using AlwaysStoppedAnimation for opacity
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeTransition(
                    // opacity expects an Animation<double>. We wrap our static double in AlwaysStoppedAnimation:
                    opacity: AlwaysStoppedAnimation<double>(_opacityVal),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.blur_on_rounded, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Fade Transition', style: theme.textTheme.labelMedium),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
