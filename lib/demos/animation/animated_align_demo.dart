import 'package:flutter/material.dart';

class AnimatedAlignDemo extends StatefulWidget {
  const AnimatedAlignDemo({super.key});

  @override
  State<AnimatedAlignDemo> createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  Alignment _alignment = Alignment.center;
  Curve _curve = Curves.easeInOut;
  double _durationMs = 800.0;

  final Map<String, Alignment> _alignments = {
    'Top Left': Alignment.topLeft,
    'Top Center': Alignment.topCenter,
    'Top Right': Alignment.topRight,
    'Center Left': Alignment.centerLeft,
    'Center': Alignment.center,
    'Center Right': Alignment.centerRight,
    'Bottom Left': Alignment.bottomLeft,
    'Bottom Center': Alignment.bottomCenter,
    'Bottom Right': Alignment.bottomRight,
  };

  final Map<String, Curve> _curves = {
    'Ease In Out': Curves.easeInOut,
    'Linear': Curves.linear,
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Decelerate': Curves.decelerate,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Grid controls for alignment
        Text(
          'Target Alignment: ${_alignments.keys.firstWhere((k) => _alignments[k] == _alignment, orElse: () => 'Custom')}',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        
        // 3x3 Button Grid to simulate the alignments visually
        Center(
          child: Container(
            width: 180,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGridButton(Alignment.topLeft, Icons.north_west),
                    _buildGridButton(Alignment.topCenter, Icons.north),
                    _buildGridButton(Alignment.topRight, Icons.north_east),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGridButton(Alignment.centerLeft, Icons.west),
                    _buildGridButton(Alignment.center, Icons.filter_tilt_shift),
                    _buildGridButton(Alignment.centerRight, Icons.east),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGridButton(Alignment.bottomLeft, Icons.south_west),
                    _buildGridButton(Alignment.bottomCenter, Icons.south),
                    _buildGridButton(Alignment.bottomRight, Icons.south_east),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Curve and Duration Config
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Animation Curve',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<Curve>(
                    value: _curve,
                    isExpanded: true,
                    onChanged: (Curve? val) {
                      if (val != null) {
                        setState(() => _curve = val);
                      }
                    },
                    items: _curves.entries.map((entry) {
                      return DropdownMenuItem<Curve>(
                        value: entry.value,
                        child: Text(entry.key, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration: ${_durationMs.toInt()} ms',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: _durationMs,
                    min: 200.0,
                    max: 3000.0,
                    divisions: 14,
                    onChanged: (val) => setState(() => _durationMs = val),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Canvas container
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              // Subtle gridlines in the background
              Center(
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
              Center(
                child: Container(
                  width: 1,
                  height: double.infinity,
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),

              // AnimatedAlign widget
              AnimatedAlign(
                alignment: _alignment,
                curve: _curve,
                duration: Duration(milliseconds: _durationMs.toInt()),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.tertiary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.flight_takeoff_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridButton(Alignment alignment, IconData icon) {
    final theme = Theme.of(context);
    final isSelected = _alignment == alignment;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () => setState(() => _alignment = alignment),
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? theme.colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Icon(
            icon,
            size: 16,
            color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
