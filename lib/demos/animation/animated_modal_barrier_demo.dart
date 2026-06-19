import 'package:flutter/material.dart';

class AnimatedModalBarrierDemo extends StatefulWidget {
  const AnimatedModalBarrierDemo({super.key});

  @override
  State<AnimatedModalBarrierDemo> createState() =>
      _AnimatedModalBarrierDemoState();
}

class _AnimatedModalBarrierDemoState extends State<AnimatedModalBarrierDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  bool _isBarrierActive = false;
  bool _dismissible = true;
  int _bgClicks = 0;

  Color _baseColor = Colors.black;
  double _opacity = 0.5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _updateAnimation();
  }

  void _updateAnimation() {
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: _baseColor.withValues(alpha: _opacity),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleBarrier(bool active) {
    setState(() {
      _isBarrierActive = active;
      if (active) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Playground Canvas
        SizedBox(
          height: 250,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor),
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background Content
                Positioned.fill(
                  child: Container(
                    color: theme.colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Background Content Area',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Clicks Registered: $_bgClicks',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _bgClicks++;
                            });
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Increment Counter'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Text(
                            'Try clicking the counter when the barrier is active. It will be completely blocked!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Animated Modal Barrier
                if (_isBarrierActive)
                  Positioned.fill(
                    child: AnimatedModalBarrier(
                      color: _colorAnimation,
                      dismissible: _dismissible,
                      onDismiss: () {
                        _toggleBarrier(false);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Barrier tapped & dismissed!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                    ),
                  ),

                // Floating Modal Card
                if (_isBarrierActive)
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller.value,
                        child: Transform.scale(
                          scale: 0.8 + (_controller.value * 0.2),
                          child: child,
                        ),
                      );
                    },
                    child: Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(16),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Active Modal Overlay',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Background interaction is blocked.',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => _toggleBarrier(false),
                              child: const Text('Close Modal'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Controls
        Text(
          'Configuration Controls',
          style:
              theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _toggleBarrier(!_isBarrierActive),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isBarrierActive
                    ? theme.colorScheme.errorContainer
                    : theme.colorScheme.primaryContainer,
                foregroundColor: _isBarrierActive
                    ? theme.colorScheme.onErrorContainer
                    : theme.colorScheme.onPrimaryContainer,
              ),
              child: Text(
                _isBarrierActive ? 'Deactivate Barrier' : 'Activate Barrier',
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _dismissible,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _dismissible = val;
                      });
                    }
                  },
                ),
                const Text('Dismissible'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            DropdownButton<Color>(
              value: _baseColor,
              onChanged: (color) {
                if (color != null) {
                  setState(() {
                    _baseColor = color;
                    _updateAnimation();
                  });
                }
              },
              items: const [
                DropdownMenuItem(
                  value: Colors.black,
                  child: Text('Black Backdrop'),
                ),
                DropdownMenuItem(
                  value: Colors.indigo,
                  child: Text('Indigo Backdrop'),
                ),
                DropdownMenuItem(
                  value: Colors.red,
                  child: Text('Red Backdrop'),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Opacity:'),
                SizedBox(
                  width: 140,
                  child: Slider(
                    value: _opacity,
                    min: 0.1,
                    max: 0.9,
                    divisions: 8,
                    label: _opacity.toStringAsFixed(2),
                    onChanged: (val) {
                      setState(() {
                        _opacity = val;
                        _updateAnimation();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
