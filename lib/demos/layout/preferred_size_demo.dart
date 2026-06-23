import 'package:flutter/material.dart';

class PreferredSizeDemo extends StatefulWidget {
  const PreferredSizeDemo({super.key});

  @override
  State<PreferredSizeDemo> createState() => _PreferredSizeDemoState();
}

class _PreferredSizeDemoState extends State<PreferredSizeDemo> {
  double _preferredHeight = 64.0;
  Color _color = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Creating a PreferredSize wrapped widget
    final customAppBar = PreferredSize(
      preferredSize: Size.fromHeight(_preferredHeight),
      child: Container(
        decoration: BoxDecoration(
          color: _color,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Custom Title Bar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'H: ${_preferredHeight.toInt()}px',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PreferredSize associates a specific preferred height and width with '
          'a child widget, which is then queried by layout parents (like Scaffold app bars).',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Simulated mobile screen frame
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Querying and rendering the preferred size widget
              customAppBar,
              Expanded(
                child: Container(
                  color: theme.colorScheme.surface,
                  alignment: Alignment.center,
                  child: Text(
                    'Simulated Screen Body\n(Preferred Height above is ${_preferredHeight.toInt()}px)',
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Preferred height slider
        Row(
          children: [
            SizedBox(
              width: 140,
              child: Text('preferredHeight: ${_preferredHeight.toInt()}px',
                  style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _preferredHeight,
                min: 30,
                max: 120,
                onChanged: (v) => setState(() => _preferredHeight = v),
              ),
            ),
          ],
        ),

        // Color toggle
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Header Color:', style: theme.textTheme.bodySmall),
            Row(
              children: [Colors.indigo, Colors.deepOrange, Colors.teal, Colors.purple].map((c) {
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
      ],
    );
  }
}
