import 'package:flutter/material.dart';

class AnimatedSizeDemo extends StatefulWidget {
  const AnimatedSizeDemo({super.key});

  @override
  State<AnimatedSizeDemo> createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends State<AnimatedSizeDemo> {
  bool _isExpanded = false;
  double _durationMs = 400;
  Curve _selectedCurve = Curves.easeInOut;
  Alignment _alignment = Alignment.topCenter;

  final Map<String, Curve> _curves = {
    'Linear': Curves.linear,
    'Ease In Out': Curves.easeInOut,
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Decelerate': Curves.decelerate,
  };

  final Map<String, Alignment> _alignments = {
    'Top Center': Alignment.topCenter,
    'Center': Alignment.center,
    'Bottom Center': Alignment.bottomCenter,
    'Top Left': Alignment.topLeft,
    'Bottom Right': Alignment.bottomRight,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Playground Canvas
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
          ),
          alignment: Alignment.center,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: 320,
              color: theme.colorScheme.surface,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animated Size container wrapping the dynamic content
                  AnimatedSize(
                    duration: Duration(milliseconds: _durationMs.round()),
                    curve: _selectedCurve,
                    alignment: _alignment,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Header (Static)
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: theme.colorScheme.primary,
                                child: const Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jane Doe',
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Flutter & RN Developer',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 24),

                          // Dynamic content that changes size
                          if (_isExpanded) ...[
                            Text(
                              'About Me',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Highly passionate UI engineer transition expert. Specializes in cross-platform design architectures and bridging component lifecycles between Flutter and React Native environments.',
                              style: TextStyle(fontSize: 13, height: 1.4),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Skills',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                Chip(
                                  label: const Text('Flutter', style: TextStyle(fontSize: 11)),
                                  visualDensity: VisualDensity.compact,
                                  backgroundColor: theme.colorScheme.primaryContainer,
                                ),
                                Chip(
                                  label: const Text('React Native', style: TextStyle(fontSize: 11)),
                                  visualDensity: VisualDensity.compact,
                                  backgroundColor: theme.colorScheme.secondaryContainer,
                                ),
                                Chip(
                                  label: const Text('Animations', style: TextStyle(fontSize: 11)),
                                  visualDensity: VisualDensity.compact,
                                ),
                              ],
                            ),
                          ] else ...[
                            const Text(
                              'Tap the toggle below to view details, skills list, and complete biography.',
                              style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  // Control Action Area
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Ink(
                      color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _isExpanded ? 'Show Less' : 'Show More',
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
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
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Curve Picker Dropdown
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Curve: '),
                      const SizedBox(width: 4),
                      DropdownButton<Curve>(
                        value: _selectedCurve,
                        onChanged: (curve) {
                          if (curve != null) {
                            setState(() {
                              _selectedCurve = curve;
                            });
                          }
                        },
                        items: _curves.entries.map((e) {
                          return DropdownMenuItem(
                            value: e.value,
                            child: Text(e.key),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  // Alignment Picker Dropdown
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Alignment: '),
                      const SizedBox(width: 4),
                      DropdownButton<Alignment>(
                        value: _alignment,
                        onChanged: (align) {
                          if (align != null) {
                            setState(() {
                              _alignment = align;
                            });
                          }
                        },
                        items: _alignments.entries.map((e) {
                          return DropdownMenuItem(
                            value: e.value,
                            child: Text(e.key),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Duration Slider
              Row(
                children: [
                  const Text('Duration: '),
                  Expanded(
                    child: Slider(
                      value: _durationMs,
                      min: 150,
                      max: 1200,
                      divisions: 7,
                      label: '${_durationMs.round()} ms',
                      onChanged: (val) {
                        setState(() {
                          _durationMs = val;
                        });
                      },
                    ),
                  ),
                  Text(
                    '${_durationMs.round()} ms',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
