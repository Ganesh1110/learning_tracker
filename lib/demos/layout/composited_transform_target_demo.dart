import 'package:flutter/material.dart';

class CompositedTransformTargetDemo extends StatefulWidget {
  const CompositedTransformTargetDemo({super.key});

  @override
  State<CompositedTransformTargetDemo> createState() => _CompositedTransformTargetDemoState();
}

class _CompositedTransformTargetDemoState extends State<CompositedTransformTargetDemo> {
  final LayerLink _layerLink = LayerLink();
  bool _showFollower = true;
  double _anchorX = 120.0;
  double _anchorY = 60.0;
  double _followerOffsetX = 0.0;
  double _followerOffsetY = 50.0;
  final bool _showWhenUnlinked = true;

  Alignment _targetAnchor = Alignment.bottomLeft;
  Alignment _followerAnchor = Alignment.topLeft;

  final Map<String, Alignment> _alignments = {
    'Top Left': Alignment.topLeft,
    'Top Right': Alignment.topRight,
    'Bottom Left': Alignment.bottomLeft,
    'Bottom Right': Alignment.bottomRight,
    'Center': Alignment.center,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Transform Target & Follower Controls',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Toggle Follower visibility
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _showFollower,
                  onChanged: (val) => setState(() => _showFollower = val),
                ),
                const Text('Show Follower'),
              ],
            ),

            // Anchor Slider X
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Anchor X: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _anchorX,
                    min: 10,
                    max: 200,
                    onChanged: (val) => setState(() => _anchorX = val),
                  ),
                ),
              ],
            ),

            // Anchor Slider Y
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Anchor Y: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _anchorY,
                    min: 10,
                    max: 120,
                    onChanged: (val) => setState(() => _anchorY = val),
                  ),
                ),
              ],
            ),

            // Target Anchor Alignment
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Target Anchor: '),
                DropdownButton<Alignment>(
                  value: _targetAnchor,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _targetAnchor = val);
                    }
                  },
                  items: _alignments.entries.map((e) {
                    return DropdownMenuItem(value: e.value, child: Text(e.key));
                  }).toList(),
                ),
              ],
            ),

            // Follower Anchor Alignment
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Follower Anchor: '),
                DropdownButton<Alignment>(
                  value: _followerAnchor,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _followerAnchor = val);
                    }
                  },
                  items: _alignments.entries.map((e) {
                    return DropdownMenuItem(value: e.value, child: Text(e.key));
                  }).toList(),
                ),
              ],
            ),

            // Follower Offset X
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Offset X: '),
                SizedBox(
                  width: 80,
                  child: Slider(
                    value: _followerOffsetX,
                    min: -50,
                    max: 50,
                    onChanged: (val) => setState(() => _followerOffsetX = val),
                  ),
                ),
              ],
            ),

            // Follower Offset Y
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Offset Y: '),
                SizedBox(
                  width: 80,
                  child: Slider(
                    value: _followerOffsetY,
                    min: -20,
                    max: 80,
                    onChanged: (val) => setState(() => _followerOffsetY = val),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'The follower is linked to the target via a LayerLink. As the target moves, the follower follows.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              // Grid Background
              Opacity(
                opacity: 0.05,
                child: GridPaper(
                  color: theme.colorScheme.onSurface,
                  interval: 30,
                  divisions: 1,
                  subdivisions: 1,
                  child: const SizedBox.expand(),
                ),
              ),

              // Positioned Target Button (Movable)
              Positioned(
                left: _anchorX,
                top: _anchorY,
                child: CompositedTransformTarget(
                  link: _layerLink,
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Target\n(Anchor)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // The Follower widget floating above the Stack
              if (_showFollower)
                Positioned(
                  // We do not position the follower using stack coordinates.
                  // Instead, CompositedTransformFollower takes care of aligning itself
                  // to the target in the render layer.
                  child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: _showWhenUnlinked,
                    targetAnchor: _targetAnchor,
                    followerAnchor: _followerAnchor,
                    offset: Offset(_followerOffsetX, _followerOffsetY),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondaryContainer,
                        border: Border.all(color: theme.colorScheme.secondary),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.info_outline, size: 14, color: theme.colorScheme.onSecondaryContainer),
                          const SizedBox(width: 4),
                          Text(
                            'Follower Tooltip',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ],
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
}
