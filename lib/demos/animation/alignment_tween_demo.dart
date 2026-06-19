import 'package:flutter/material.dart';

class AlignmentTweenDemo extends StatefulWidget {
  const AlignmentTweenDemo({super.key});

  @override
  State<AlignmentTweenDemo> createState() => _AlignmentTweenDemoState();
}

class _AlignmentTweenDemoState extends State<AlignmentTweenDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // Cartesian coordinates for start and end alignment
  double _startX = -0.8;
  double _startY = -0.8;
  double _endX = 0.8;
  double _endY = 0.8;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Compute active alignment tween based on current coordinate values
    final beginAlignment = Alignment(_startX, _startY);
    final endAlignment = Alignment(_endX, _endY);

    final Animation<Alignment> alignmentAnimation = AlignmentTween(
      begin: beginAlignment,
      end: endAlignment,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Sliders for Start Coordinates
        ExpansionTile(
          title: Text(
            'Start Alignment: Alignment(${_startX.toStringAsFixed(1)}, ${_startY.toStringAsFixed(1)})',
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
          dense: true,
          initiallyExpanded: true,
          children: [
            _buildSliderRow('Start X Offset', _startX, (val) => setState(() => _startX = val)),
            _buildSliderRow('Start Y Offset', _startY, (val) => setState(() => _startY = val)),
          ],
        ),

        // Sliders for End Coordinates
        ExpansionTile(
          title: Text(
            'End Alignment: Alignment(${_endX.toStringAsFixed(1)}, ${_endY.toStringAsFixed(1)})',
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
          dense: true,
          children: [
            _buildSliderRow('End X Offset', _endX, (val) => setState(() => _endX = val)),
            _buildSliderRow('End Y Offset', _endY, (val) => setState(() => _endY = val)),
          ],
        ),

        const SizedBox(height: 8),
        // Play/Pause button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton.filledTonal(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat(reverse: true);
                }
                setState(() {});
              },
              icon: Icon(_controller.isAnimating ? Icons.pause_rounded : Icons.play_arrow_rounded),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Canvas container for AlignmentTween animation
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              // Axis lines for visual coordinate context
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

              // Animated element
              AnimatedBuilder(
                animation: alignmentAnimation,
                builder: (context, child) {
                  return Align(
                    alignment: alignmentAnimation.value,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.tertiary,
                              theme.colorScheme.primary,
                            ],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.tertiary.withValues(alpha: 0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.gps_fixed_rounded, color: Colors.white, size: 20),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSliderRow(String label, double value, ValueChanged<double> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Slider(
              value: value,
              min: -1.0,
              max: 1.0,
              divisions: 20,
              onChanged: onChanged,
            ),
          ),
          SizedBox(
            width: 32,
            child: Text(value.toStringAsFixed(1), style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
          ),
        ],
      ),
    );
  }
}
