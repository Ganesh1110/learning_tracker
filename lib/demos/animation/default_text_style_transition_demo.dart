import 'package:flutter/material.dart';

class DefaultTextStyleTransitionDemo extends StatefulWidget {
  const DefaultTextStyleTransitionDemo({super.key});

  @override
  State<DefaultTextStyleTransitionDemo> createState() =>
      _DefaultTextStyleTransitionDemoState();
}

class _DefaultTextStyleTransitionDemoState
    extends State<DefaultTextStyleTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<TextStyle> _styleAnimation;
  int _durationMs = 1500;
  Curve _selectedCurve = Curves.easeInOut;

  final Map<String, Curve> _curves = {
    'Linear': Curves.linear,
    'Ease In Out': Curves.easeInOut,
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Decelerate': Curves.decelerate,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _durationMs),
    );

    _updateAnimation();
  }

  void _updateAnimation() {
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: _selectedCurve,
    );

    _styleAnimation = TextStyleTween(
      begin: const TextStyle(
        fontSize: 16.0,
        color: Colors.blue,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.0,
      ),
      end: const TextStyle(
        fontSize: 32.0,
        color: Colors.deepPurple,
        fontWeight: FontWeight.w900,
        letterSpacing: 4.0,
      ),
    ).animate(curvedAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  'Transition Configurations',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Duration Slider
                Row(
                  children: [
                    const Text('Duration: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_durationMs}ms'),
                    Expanded(
                      child: Slider(
                        value: _durationMs.toDouble(),
                        min: 500,
                        max: 3000,
                        divisions: 5,
                        onChanged: (val) {
                          setState(() {
                            _durationMs = val.toInt();
                            _controller.duration =
                                Duration(milliseconds: _durationMs);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Curves Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Animation Curve: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<Curve>(
                      value: _selectedCurve,
                      onChanged: (Curve? val) {
                        if (val != null) {
                          setState(() {
                            _selectedCurve = val;
                            _updateAnimation();
                          });
                        }
                      },
                      items: _curves.entries.map((entry) {
                        return DropdownMenuItem<Curve>(
                          value: entry.value,
                          child: Text(entry.key),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Controls Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _controller.forward(),
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Forward'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _controller.reverse(),
                      icon: const Icon(Icons.settings_backup_restore),
                      label: const Text('Reverse'),
                    ),
                    IconButton.filledTonal(
                      onPressed: () => _controller.reset(),
                      icon: const Icon(Icons.replay),
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
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: DefaultTextStyleTransition(
            style: _styleAnimation,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('MORPHING TEXT'),
                SizedBox(height: 8),
                Text('SUBTITLE ANIMATION'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
