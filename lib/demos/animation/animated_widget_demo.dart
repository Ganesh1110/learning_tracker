import 'package:flutter/material.dart';

class AnimatedWidgetDemo extends StatefulWidget {
  const AnimatedWidgetDemo({super.key});

  @override
  State<AnimatedWidgetDemo> createState() => _AnimatedWidgetDemoState();
}

class _AnimatedWidgetDemoState extends State<AnimatedWidgetDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _parentRebuilds = 0;

  // Customization state
  Color _selectedColor = Colors.red;
  IconData _selectedIcon = Icons.favorite;
  double _durationSeconds = 1.5;

  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.blue,
    Colors.teal,
    Colors.pink,
  ];

  final Map<String, IconData> _icons = {
    'Heart': Icons.favorite,
    'Star': Icons.star,
    'Notification': Icons.notifications_active,
    'Vibe': Icons.vibration,
    'Flash': Icons.flash_on,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (_durationSeconds * 1000).round()),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateDuration(double seconds) {
    setState(() {
      _durationSeconds = seconds;
      _controller.duration = Duration(milliseconds: (seconds * 1000).round());
      if (_controller.isAnimating) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Increment parent rebuilds every time this parent build method is called
    _parentRebuilds++;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Playground Canvas
        Container(
          height: 300,
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Educational explanation
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Parent Build Count: $_parentRebuilds',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Notice: The parent count remains static even though the icon is animating at 60fps! This proves that AnimatedWidget isolates rebuild frames.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, height: 1.3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Our custom AnimatedWidget instance
              _PulsingIcon(
                animation: _controller,
                color: _selectedColor,
                icon: _selectedIcon,
              ),
            ],
          ),
        ),

        // Controls Panel
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Configuration Controls',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Trigger manual Parent State Rebuild
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Explicit state change to trigger parent build()
                      setState(() {});
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Force Parent Rebuild'),
                  ),

                  // Play/Pause toggle
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_controller.isAnimating) {
                          _controller.stop();
                        } else {
                          _controller.repeat(reverse: true);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _controller.isAnimating ? Colors.red.withOpacity(0.1) : null,
                      foregroundColor: _controller.isAnimating ? Colors.red : null,
                    ),
                    child: Text(_controller.isAnimating ? 'Pause Animation' : 'Play Animation'),
                  ),
                ],
              ),
              const Divider(height: 20),

              // Color Selection
              Row(
                children: [
                  const Text('Color: '),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _colors.map((color) {
                          final isSelected = _selectedColor == color;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedColor = color;
                                });
                              },
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? theme.colorScheme.onSurface : Colors.transparent,
                                    width: 2.5,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Icon selection and speed Wrap
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Icon Select
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Icon: '),
                      const SizedBox(width: 4),
                      DropdownButton<IconData>(
                        value: _selectedIcon,
                        onChanged: (icon) {
                          if (icon != null) {
                            setState(() {
                              _selectedIcon = icon;
                            });
                          }
                        },
                        items: _icons.entries.map((e) {
                          return DropdownMenuItem(
                            value: e.value,
                            child: Text(e.key),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  // Duration/Speed Slider
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Pulse Speed: '),
                      SizedBox(
                        width: 140,
                        child: Slider(
                          value: _durationSeconds,
                          min: 0.5,
                          max: 3.0,
                          divisions: 5,
                          label: '${_durationSeconds}s',
                          onChanged: _updateDuration,
                        ),
                      ),
                      Text(
                        '${_durationSeconds}s',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------
// Custom AnimatedWidget subclass that isolates rebuilds
// ---------------------------------------------------------
class _PulsingIcon extends AnimatedWidget {
  final Color color;
  final IconData icon;

  const _PulsingIcon({
    required Animation<double> animation,
    required this.color,
    required this.icon,
  }) : super(listenable: animation);

  // Helper getter to extract the animation progress double
  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    // Calculates scale between 0.8 and 1.25
    final scale = 0.8 + (_progress.value * 0.45);
    // Calculates opacity between 0.4 and 1.0
    final opacity = 0.4 + (_progress.value * 0.6);

    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: Icon(
          icon,
          color: color,
          size: 120,
        ),
      ),
    );
  }
}
