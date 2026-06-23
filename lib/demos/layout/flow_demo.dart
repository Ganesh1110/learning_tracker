import 'dart:math' as math;
import 'package:flutter/material.dart';

class FlowDemo extends StatefulWidget {
  const FlowDemo({super.key});

  @override
  State<FlowDemo> createState() => _FlowDemoState();
}

class _FlowDemoState extends State<FlowDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _menuOpen = !_menuOpen;
      if (_menuOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<IconData> menuIcons = [
      Icons.share,
      Icons.notifications,
      Icons.settings,
      Icons.favorite,
    ];

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
                  'Flow Menu Controller',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'The Flow widget delegates painting coordinates of children to the paint phase, enabling high-performance animations with zero layout passes.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _toggleMenu,
                  icon: Icon(_menuOpen ? Icons.close : Icons.menu),
                  label: Text(_menuOpen ? 'Collapse Menu' : 'Expand Menu'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Radial Flow Layout):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              // Radial Flow Layout container
              Positioned.fill(
                child: Flow(
                  delegate: _RadialMenuDelegate(
                    animation: _controller,
                  ),
                  children: [
                    ...menuIcons.map((icon) {
                      return FloatingActionButton.small(
                        heroTag: 'flow_btn_$icon',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tapped ${icon.toString().split('.').last}')),
                          );
                        },
                        child: Icon(icon),
                      );
                    }),
                    // Trigger Button (Last child is painted on top)
                    FloatingActionButton(
                      heroTag: 'flow_trigger_btn',
                      onPressed: _toggleMenu,
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _controller,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RadialMenuDelegate extends FlowDelegate {
  final Animation<double> animation;
  _RadialMenuDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    // Last child is the center trigger button
    final n = context.childCount - 1;
    final size = context.size;
    
    final centerX = size.width / 2 - 28; // adjusting for FAB center
    final centerY = size.height / 2 - 28;

    final progress = animation.value;
    const radius = 90.0;

    // Paint menu items
    for (int i = 0; i < n; i++) {
      final angle = i * (2 * math.pi / n);
      final x = centerX + radius * progress * math.cos(angle);
      final y = centerY + radius * progress * math.sin(angle);
      
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0.0)
          ..scale(progress), // Shrink/grow along with position transition
      );
    }

    // Paint center trigger button on top
    context.paintChild(
      n,
      transform: Matrix4.translationValues(centerX, centerY, 0.0),
    );
  }

  @override
  bool shouldRepaint(_RadialMenuDelegate oldDelegate) =>
      animation != oldDelegate.animation;
}
