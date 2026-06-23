import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({super.key});

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  double _crossAxisCount = 3.0;
  double _spacing = 8.0;

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
                  'Grid Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Columns: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_crossAxisCount.toInt()} columns'),
                    Expanded(
                      child: Slider(
                        value: _crossAxisCount,
                        min: 2.0,
                        max: 5.0,
                        divisions: 3,
                        onChanged: (val) => setState(() => _crossAxisCount = val),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Tile Spacing: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_spacing.toStringAsFixed(0)}px'),
                    Expanded(
                      child: Slider(
                        value: _spacing,
                        min: 4.0,
                        max: 20.0,
                        onChanged: (val) => setState(() => _spacing = val),
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
          'Visual Output (Scroll inside grid):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.hardEdge,
          child: GridView.builder(
            padding: EdgeInsets.all(_spacing),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount.toInt(),
              crossAxisSpacing: _spacing,
              mainAxisSpacing: _spacing,
              childAspectRatio: 1.0, // square tiles
            ),
            itemCount: 16,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.zero,
                elevation: 1,
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.grid_on,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Item #${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimaryContainer,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
