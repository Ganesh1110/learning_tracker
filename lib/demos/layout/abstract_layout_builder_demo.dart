import 'package:flutter/material.dart';

class AbstractLayoutBuilderDemo extends StatefulWidget {
  const AbstractLayoutBuilderDemo({super.key});

  @override
  State<AbstractLayoutBuilderDemo> createState() => _AbstractLayoutBuilderDemoState();
}

class _AbstractLayoutBuilderDemoState extends State<AbstractLayoutBuilderDemo> {
  double _containerWidth = 350.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Width Slider Control
        Text(
          'Simulated Parent Width: ${_containerWidth.toStringAsFixed(0)}px',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Slider(
          value: _containerWidth,
          min: 150.0,
          max: 400.0,
          onChanged: (val) => setState(() => _containerWidth = val),
        ),
        const SizedBox(height: 16),

        // Container representing the constrained parent
        Container(
          width: _containerWidth,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.outlineVariant, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 280;
              final accentColor = isWide ? theme.colorScheme.primary : theme.colorScheme.secondary;

              return Container(
                color: accentColor.withValues(alpha: 0.1),
                padding: const EdgeInsets.all(12),
                child: isWide
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.desktop_mac_rounded, size: 36, color: accentColor),
                          const SizedBox(width: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Wide Layout',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text('Using Row widget'),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone_iphone_rounded, size: 32, color: accentColor),
                          const SizedBox(height: 8),
                          Text(
                            'Narrow Layout',
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Using Column widget', style: TextStyle(fontSize: 11)),
                        ],
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
