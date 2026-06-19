import 'package:flutter/material.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  const AnimatedCrossFadeDemo({super.key});

  @override
  State<AnimatedCrossFadeDemo> createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _showExpanded = false;
  Curve _firstCurve = Curves.easeIn;
  Curve _sizeCurve = Curves.easeInOut;
  double _durationMs = 600.0;

  final Map<String, Curve> _curves = {
    'Ease In': Curves.easeIn,
    'Ease Out': Curves.easeOut,
    'Ease In Out': Curves.easeInOut,
    'Bounce Out': Curves.bounceOut,
    'Linear': Curves.linear,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      theme.colorScheme.tertiary,
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Fade Curve', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                SizedBox(
                  width: 160,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      border: OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Curve>(
                        value: _firstCurve,
                        isDense: true,
                        items: _curves.entries.map((e) => DropdownMenuItem(
                          value: e.value,
                          child: Text(e.key, style: const TextStyle(fontSize: 13)),
                        )).toList(),
                        onChanged: (v) { if (v != null) setState(() => _firstCurve = v); },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Size Curve', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                SizedBox(
                  width: 160,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      border: OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Curve>(
                        value: _sizeCurve,
                        isDense: true,
                        items: _curves.entries.map((e) => DropdownMenuItem(
                          value: e.value,
                          child: Text(e.key, style: const TextStyle(fontSize: 13)),
                        )).toList(),
                        onChanged: (v) { if (v != null) setState(() => _sizeCurve = v); },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Duration: ${_durationMs.toInt()} ms',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _durationMs,
              min: 200.0,
              max: 2000.0,
              divisions: 18,
              onChanged: (v) => setState(() => _durationMs = v),
            ),
          ],
        ),
        const SizedBox(height: 8),
        AnimatedCrossFade(
          duration: Duration(milliseconds: _durationMs.toInt()),
          firstCurve: _firstCurve,
          secondCurve: _firstCurve,
          sizeCurve: _sizeCurve,
          crossFadeState: _showExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: _buildCompactCard(theme, colors),
          secondChild: _buildExpandedCard(theme, colors),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () => setState(() => _showExpanded = !_showExpanded),
            icon: Icon(_showExpanded ? Icons.unfold_less_rounded : Icons.unfold_more_rounded),
            label: Text(_showExpanded ? 'Collapse' : 'Expand'),
          ),
        ),
      ],
    );
  }

  Widget _buildCompactCard(ThemeData theme, List<Color> colors) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [colors[0].withValues(alpha: 0.15), colors[1].withValues(alpha: 0.1)],
        ),
        border: Border.all(color: colors[0].withValues(alpha: 0.3)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: colors[0],
            child: const Icon(Icons.person_rounded, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Flutter Developer', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Tap "Expand" to see more', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedCard(ThemeData theme, List<Color> colors) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors[0].withValues(alpha: 0.2), colors[2].withValues(alpha: 0.15)],
        ),
        border: Border.all(color: colors[0].withValues(alpha: 0.4)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: colors[0],
                child: const Icon(Icons.person_rounded, color: Colors.white, size: 38),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Flutter Developer', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Senior Engineer · 5 yrs', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7))),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Passionate about building beautiful, performant Flutter applications. Specialises in animations, state management, and platform integrations.',
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['Flutter', 'Dart', 'Firebase', 'Riverpod', 'Animations'].map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: colors[0].withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors[0].withValues(alpha: 0.4)),
                ),
                child: Text(tag, style: theme.textTheme.labelMedium?.copyWith(color: colors[0], fontWeight: FontWeight.bold)),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message_rounded, size: 16),
                  label: const Text('Message'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add_rounded, size: 16),
                  label: const Text('Follow'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
