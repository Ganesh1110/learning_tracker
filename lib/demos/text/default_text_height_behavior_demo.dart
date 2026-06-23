import 'package:flutter/material.dart';

class DefaultTextHeightBehaviorDemo extends StatefulWidget {
  const DefaultTextHeightBehaviorDemo({super.key});

  @override
  State<DefaultTextHeightBehaviorDemo> createState() =>
      _DefaultTextHeightBehaviorDemoState();
}

class _DefaultTextHeightBehaviorDemoState
    extends State<DefaultTextHeightBehaviorDemo> {
  bool _applyHeightToFirstAscent = true;
  bool _applyHeightToLastDescent = true;
  TextLeadingDistribution _leadingDistribution =
      TextLeadingDistribution.proportional;

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
                  'Text Height Behavior Controls',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Apply Height to First Ascent'),
                  subtitle: const Text(
                    'Controls leading of the first line\'s ascent',
                  ),
                  value: _applyHeightToFirstAscent,
                  onChanged: (val) =>
                      setState(() => _applyHeightToFirstAscent = val),
                  contentPadding: EdgeInsets.zero,
                ),
                SwitchListTile(
                  title: const Text('Apply Height to Last Descent'),
                  subtitle: const Text(
                    'Controls leading of the last line\'s descent',
                  ),
                  value: _applyHeightToLastDescent,
                  onChanged: (val) =>
                      setState(() => _applyHeightToLastDescent = val),
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Leading Distribution',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'How height is distributed (even vs proportional)',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    DropdownButton<TextLeadingDistribution>(
                      value: _leadingDistribution,
                      onChanged: (TextLeadingDistribution? val) {
                        if (val != null) {
                          setState(() => _leadingDistribution = val);
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: TextLeadingDistribution.proportional,
                          child: Text('Proportional'),
                        ),
                        DropdownMenuItem(
                          value: TextLeadingDistribution.even,
                          child: Text('Even'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              // Guidelines to make alignment differences visible
              Positioned.fill(
                child: CustomPaint(
                  painter: _GridPainter(theme.colorScheme.outlineVariant),
                ),
              ),
              DefaultTextHeightBehavior(
                textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: _applyHeightToFirstAscent,
                  applyHeightToLastDescent: _applyHeightToLastDescent,
                  leadingDistribution: _leadingDistribution,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DefaultTextHeightBehavior controls how text height is applied to lines of text. When height is modified, this determines leading distributions.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        height: 3.0,
                        backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'This second paragraph inherits the same parent text height behavior configuration.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 3.0,
                        backgroundColor: theme.colorScheme.secondary.withValues(alpha: 0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '* Colored boxes indicate the total line height bounding box. Observe the gap at the top of the first line and the bottom of the last line.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color color;
  _GridPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const lineCount = 10;
    final step = size.height / lineCount;
    for (int i = 0; i <= lineCount; i++) {
      final y = i * step;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter oldDelegate) => color != oldDelegate.color;
}
