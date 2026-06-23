import 'package:flutter/material.dart';

class OrientationBuilderDemo extends StatelessWidget {
  const OrientationBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OrientationBuilder rebuilds its child whenever the device '
          'orientation changes between portrait and landscape.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        OrientationBuilder(
          builder: (context, orientation) {
            final isLandscape = orientation == Orientation.landscape;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isLandscape
                      ? [Colors.deepOrange, Colors.orange]
                      : [Colors.deepPurple, Colors.indigo],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        isLandscape
                            ? Icons.stay_primary_landscape
                            : Icons.stay_primary_portrait,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        isLandscape ? 'Landscape' : 'Portrait',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Layout adapts to orientation
                  isLandscape
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _boxes(Colors.white),
                        )
                      : Column(
                          children: _boxes(Colors.white),
                        ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline,
                  size: 16, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Rotate your device or resize the window to see the layout switch.',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _boxes(Color color) => [
        _ColorBox(color: color, label: 'A'),
        const SizedBox(width: 8, height: 8),
        _ColorBox(color: color, label: 'B'),
        const SizedBox(width: 8, height: 8),
        _ColorBox(color: color, label: 'C'),
      ];
}

class _ColorBox extends StatelessWidget {
  const _ColorBox({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withAlpha(60),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withAlpha(180)),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }
}
