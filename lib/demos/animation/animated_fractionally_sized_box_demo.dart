import 'package:flutter/material.dart';

class AnimatedFractionallySizedBoxDemo extends StatefulWidget {
  const AnimatedFractionallySizedBoxDemo({super.key});

  @override
  State<AnimatedFractionallySizedBoxDemo> createState() => _AnimatedFractionallySizedBoxDemoState();
}

class _AnimatedFractionallySizedBoxDemoState extends State<AnimatedFractionallySizedBoxDemo> {
  double _widthFactor = 0.6;
  double _heightFactor = 0.5;
  Alignment _alignment = Alignment.center;
  Curve _curve = Curves.easeInOut;
  double _durationMs = 600.0;

  final Map<String, Curve> _curves = {
    'Ease In Out': Curves.easeInOut,
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Decelerate': Curves.decelerate,
    'Linear': Curves.linear,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // widthFactor slider
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Width Factor: ${_widthFactor.toStringAsFixed(2)}',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
            Slider(value: _widthFactor, min: 0.1, max: 1.0, divisions: 18,
              onChanged: (v) => setState(() => _widthFactor = v)),
          ],
        ),

        // heightFactor slider
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Height Factor: ${_heightFactor.toStringAsFixed(2)}',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
            Slider(value: _heightFactor, min: 0.1, max: 1.0, divisions: 18,
              onChanged: (v) => setState(() => _heightFactor = v)),
          ],
        ),

        // Duration slider
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Duration: ${_durationMs.toInt()} ms',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
            Slider(value: _durationMs, min: 200, max: 2000, divisions: 18,
              onChanged: (v) => setState(() => _durationMs = v)),
          ],
        ),
        const SizedBox(height: 8),

        // Alignment grid + curve selector
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Alignment', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildGridRow([Alignment.topLeft, Alignment.topCenter, Alignment.topRight],
                          [Icons.north_west, Icons.north, Icons.north_east]),
                      _buildGridRow([Alignment.centerLeft, Alignment.center, Alignment.centerRight],
                          [Icons.west, Icons.filter_tilt_shift, Icons.east]),
                      _buildGridRow([Alignment.bottomLeft, Alignment.bottomCenter, Alignment.bottomRight],
                          [Icons.south_west, Icons.south, Icons.south_east]),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Curve', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                SizedBox(
                  width: 160,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      border: OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Curve>(
                        value: _curve,
                        isDense: true,
                        items: _curves.entries.map((e) => DropdownMenuItem(
                          value: e.value,
                          child: Text(e.key, style: const TextStyle(fontSize: 13)),
                        )).toList(),
                        onChanged: (v) { if (v != null) setState(() => _curve = v); },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Canvas
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: AnimatedFractionallySizedBox(
            duration: Duration(milliseconds: _durationMs.toInt()),
            curve: _curve,
            widthFactor: _widthFactor,
            heightFactor: _heightFactor,
            alignment: _alignment,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.tertiary,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.open_with_rounded, color: Colors.white, size: 28),
                    const SizedBox(height: 4),
                    Text(
                      '${(_widthFactor * 100).toInt()}% × ${(_heightFactor * 100).toInt()}%',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridRow(List<Alignment> alignments, List<IconData> icons) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        final isSelected = _alignment == alignments[i];
        final theme = Theme.of(context);
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: () => setState(() => _alignment = alignments[i]),
            borderRadius: BorderRadius.circular(4),
            child: Container(
              width: 38,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: Icon(icons[i], size: 14,
                color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface),
            ),
          ),
        );
      }),
    );
  }
}
