import 'package:flutter/material.dart';

class ListWheelScrollViewDemo extends StatefulWidget {
  const ListWheelScrollViewDemo({super.key});

  @override
  State<ListWheelScrollViewDemo> createState() => _ListWheelScrollViewDemoState();
}

class _ListWheelScrollViewDemoState extends State<ListWheelScrollViewDemo> {
  double _diameterRatio = 1.8;
  double _offAxisFraction = 0.0;
  bool _useMagnifier = true;
  double _magnification = 1.2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 0,
          color: theme.colorScheme.surfaceContainerLow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3D Wheel Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Diameter Ratio Slider (wheel bending)
                Row(
                  children: [
                    const SizedBox(
                      width: 105,
                      child: Text('Diameter Ratio: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Text('${_diameterRatio.toStringAsFixed(1)}x'),
                    Expanded(
                      child: Slider(
                        value: _diameterRatio,
                        min: 0.5,
                        max: 3.0,
                        onChanged: (val) => setState(() => _diameterRatio = val),
                      ),
                    ),
                  ],
                ),

                // Off-Axis Fraction (cylinder offset shift)
                Row(
                  children: [
                    const SizedBox(
                      width: 105,
                      child: Text('Off-Axis: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Text(_offAxisFraction.toStringAsFixed(1)),
                    Expanded(
                      child: Slider(
                        value: _offAxisFraction,
                        min: -1.5,
                        max: 1.5,
                        onChanged: (val) => setState(() => _offAxisFraction = val),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),

                // Magnifier settings
                SwitchListTile(
                  title: const Text('Enable Center Magnifier', style: TextStyle(fontSize: 13)),
                  subtitle: const Text('Magnify list items crossing the scroll center'),
                  value: _useMagnifier,
                  onChanged: (val) => setState(() => _useMagnifier = val),
                  contentPadding: EdgeInsets.zero,
                ),

                Row(
                  children: [
                    const SizedBox(
                      width: 105,
                      child: Text('Magnification: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Text('${_magnification.toStringAsFixed(1)}x'),
                    Expanded(
                      child: Slider(
                        value: _magnification,
                        min: 1.0,
                        max: 2.0,
                        onChanged: _useMagnifier
                            ? (val) => setState(() => _magnification = val)
                            : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Scroll the wheel):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Container(
            height: 220,
            width: 280,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: ListWheelScrollView(
              itemExtent: 44,
              diameterRatio: _diameterRatio,
              offAxisFraction: _offAxisFraction,
              useMagnifier: _useMagnifier,
              magnification: _magnification,
              physics: const FixedExtentScrollPhysics(),
              children: List.generate(15, (index) {
                return Container(
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme.colorScheme.primary),
                  ),
                  child: Text(
                    'Wheel Item #${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                      fontSize: 13,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
