import 'package:flutter/material.dart';

class ClipRSuperellipseDemo extends StatefulWidget {
  const ClipRSuperellipseDemo({super.key});

  @override
  State<ClipRSuperellipseDemo> createState() => _ClipRSuperellipseDemoState();
}

class _ClipRSuperellipseDemoState extends State<ClipRSuperellipseDemo> {
  double _radius = 32.0;
  bool _showComparison = true;
  Clip _clipBehavior = Clip.antiAlias;

  final Map<String, Clip> _clipBehaviors = {
    'Anti-Alias (Default)': Clip.antiAlias,
    'Hard Edge': Clip.hardEdge,
    'Anti-Alias Save Layer': Clip.antiAliasWithSaveLayer,
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
          'ClipRSuperellipse Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Radius Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Radius: '),
                SizedBox(
                  width: 140,
                  child: Slider(
                    value: _radius,
                    min: 0.0,
                    max: 80.0,
                    divisions: 20,
                    label: _radius.toStringAsFixed(0),
                    onChanged: (val) => setState(() => _radius = val),
                  ),
                ),
                Text('${_radius.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Compare Toggle
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _showComparison,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _showComparison = val);
                    }
                  },
                ),
                const Text('Compare with ClipRRect (Standard Rounded Rect)'),
              ],
            ),

            // Clip Behavior
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Clip Behavior: '),
                DropdownButton<Clip>(
                  value: _clipBehavior,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _clipBehavior = val);
                    }
                  },
                  items: _clipBehaviors.entries.map((e) {
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
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'ClipRSuperellipse provides continuous corner curves (squircle) which look smoother than standard circular arcs.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),
        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Superellipse Block
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRSuperellipse(
                        borderRadius: BorderRadius.circular(_radius),
                        clipBehavior: _clipBehavior,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star_half_rounded, size: 40, color: Colors.white),
                                SizedBox(height: 4),
                                Text(
                                  'Superellipse\n(Squircle)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Continuous Curves',
                        style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

                  if (_showComparison) ...[
                    const SizedBox(width: 32),
                    // Standard ClipRRect Block
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(_radius),
                          clipBehavior: _clipBehavior,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [theme.colorScheme.tertiary, theme.colorScheme.primaryContainer],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.rounded_corner, size: 40, color: Colors.white),
                                  SizedBox(height: 4),
                                  Text(
                                    'Standard\nClipRRect',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Standard Circular Arcs',
                          style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
