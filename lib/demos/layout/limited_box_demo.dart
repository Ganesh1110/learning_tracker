import 'package:flutter/material.dart';

class LimitedBoxDemo extends StatefulWidget {
  const LimitedBoxDemo({super.key});

  @override
  State<LimitedBoxDemo> createState() => _LimitedBoxDemoState();
}

class _LimitedBoxDemoState extends State<LimitedBoxDemo> {
  bool _useLimitedBox = true;
  double _limitHeight = 80.0;

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
                  'LimitedBox Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'LimitedBox applies a maximum height/width limitation ONLY when the parent constraints are infinite (like inside a ListView or ScrollView).',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Enable LimitedBox', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('When enabled, items are limited to the height specified below'),
                  value: _useLimitedBox,
                  onChanged: (val) => setState(() => _useLimitedBox = val),
                  contentPadding: EdgeInsets.zero,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 90,
                      child: Text('Limit Height: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Text('${_limitHeight.toStringAsFixed(0)}px'),
                    Expanded(
                      child: Slider(
                        value: _limitHeight,
                        min: 40.0,
                        max: 150.0,
                        onChanged: _useLimitedBox
                            ? (val) => setState(() => _limitHeight = val)
                            : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (ListView Container):',
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
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: 4,
            itemBuilder: (context, index) {
              final boxContent = Container(
                // The child container wants to be 180px tall.
                height: 180,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: theme.colorScheme.primary),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Box Item #$index',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimaryContainer,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Natural Height: 180px',
                      style: TextStyle(
                        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              );

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: _useLimitedBox
                    ? LimitedBox(
                        maxHeight: _limitHeight,
                        child: boxContent,
                      )
                    : boxContent,
              );
            },
          ),
        ),
      ],
    );
  }
}
