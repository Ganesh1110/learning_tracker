import 'package:flutter/material.dart';

class FractionallySizedBoxDemo extends StatefulWidget {
  const FractionallySizedBoxDemo({super.key});

  @override
  State<FractionallySizedBoxDemo> createState() =>
      _FractionallySizedBoxDemoState();
}

class _FractionallySizedBoxDemoState extends State<FractionallySizedBoxDemo> {
  double _widthFactor = 0.7;
  double _heightFactor = 0.5;
  Alignment _alignment = Alignment.center;

  final Map<String, Alignment> _alignments = {
    'Center': Alignment.center,
    'Top Left': Alignment.topLeft,
    'Top Right': Alignment.topRight,
    'Bottom Left': Alignment.bottomLeft,
    'Bottom Right': Alignment.bottomRight,
  };

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
                  'FractionallySizedBox Properties',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Width Factor: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${(_widthFactor * 100).toStringAsFixed(0)}%'),
                    Expanded(
                      child: Slider(
                        value: _widthFactor,
                        min: 0.1,
                        max: 1.0,
                        onChanged: (val) => setState(() => _widthFactor = val),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Height Factor: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${(_heightFactor * 100).toStringAsFixed(0)}%'),
                    Expanded(
                      child: Slider(
                        value: _heightFactor,
                        min: 0.1,
                        max: 1.0,
                        onChanged: (val) => setState(() => _heightFactor = val),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Alignment: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<Alignment>(
                      value: _alignment,
                      onChanged: (Alignment? val) {
                        if (val != null) {
                          setState(() => _alignment = val);
                        }
                      },
                      items: _alignments.entries.map((entry) {
                        return DropdownMenuItem<Alignment>(
                          value: entry.value,
                          child: Text(entry.key),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Parent Bounds: 200x200):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: FractionallySizedBox(
              widthFactor: _widthFactor,
              heightFactor: _heightFactor,
              alignment: _alignment,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Child Box',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
