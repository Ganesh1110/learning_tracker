import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({super.key});

  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  String _currentState = 'loading'; // 'loading', 'error', 'success'
  String _transitionType = 'fade'; // 'fade', 'scale', 'slide', 'rotation'
  double _durationMs = 500;

  Widget _buildChild(ThemeData theme) {
    switch (_currentState) {
      case 'error':
        return Container(
          key: const ValueKey('error'),
          width: 260,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.errorContainer.withOpacity(0.2),
            border: Border.all(color: theme.colorScheme.error),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
              const SizedBox(height: 12),
              Text(
                'Operation Failed',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.error,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Could not load data. Please check your internet connection.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      case 'success':
        return Container(
          key: const ValueKey('success'),
          width: 260,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withOpacity(0.2),
            border: Border.all(color: theme.colorScheme.primary),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, size: 48, color: theme.colorScheme.primary),
              const SizedBox(height: 12),
              Text(
                'Success!',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Widgets database synced. All local modifications successfully backed up.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      case 'loading':
      default:
        return Container(
          key: const ValueKey('loading'),
          width: 260,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(16),
            color: theme.colorScheme.surface,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              Text(
                'Connecting to Server...',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    switch (_transitionType) {
      case 'scale':
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      case 'slide':
        // Outgoing slides left, incoming slides in from right
        final isIncoming = child.key == ValueKey(_currentState);
        final tween = Tween<Offset>(
          begin: isIncoming ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(
          position: tween,
          child: child,
        );
      case 'rotation':
        return RotationTransition(
          turns: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      case 'fade':
      default:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Playground Canvas
        Container(
          height: 220,
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
          ),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: _durationMs.round()),
            transitionBuilder: _transitionBuilder,
            child: _buildChild(theme),
          ),
        ),

        // Controls Panel
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Switch Widget State',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Buttons to select widget state
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _currentState = 'loading';
                      });
                    },
                    icon: const Icon(Icons.sync, size: 16),
                    label: const Text('Loading'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentState == 'loading' ? theme.colorScheme.secondaryContainer : null,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _currentState = 'error';
                      });
                    },
                    icon: const Icon(Icons.error_outline, size: 16),
                    label: const Text('Error'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentState == 'error' ? theme.colorScheme.errorContainer : null,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _currentState = 'success';
                      });
                    },
                    icon: const Icon(Icons.check_circle_outline, size: 16),
                    label: const Text('Success'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentState == 'success' ? theme.colorScheme.primaryContainer : null,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),

              Text(
                'Configuration Controls',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              // Dropdowns & slider configuration
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Transition Dropdown
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Transition: '),
                      const SizedBox(width: 4),
                      DropdownButton<String>(
                        value: _transitionType,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _transitionType = val;
                            });
                          }
                        },
                        items: const [
                          DropdownMenuItem(value: 'fade', child: Text('Fade Transition')),
                          DropdownMenuItem(value: 'scale', child: Text('Scale Transition')),
                          DropdownMenuItem(value: 'slide', child: Text('Slide Transition')),
                          DropdownMenuItem(value: 'rotation', child: Text('Rotation & Scale')),
                        ],
                      ),
                    ],
                  ),

                  // Duration Slider
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Duration: '),
                      SizedBox(
                        width: 140,
                        child: Slider(
                          value: _durationMs,
                          min: 200,
                          max: 1200,
                          divisions: 5,
                          label: '${_durationMs.round()} ms',
                          onChanged: (val) {
                            setState(() {
                              _durationMs = val;
                            });
                          },
                        ),
                      ),
                      Text(
                        '${_durationMs.round()}ms',
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
