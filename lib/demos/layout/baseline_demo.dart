import 'package:flutter/material.dart';

class BaselineDemo extends StatefulWidget {
  const BaselineDemo({super.key});

  @override
  State<BaselineDemo> createState() => _BaselineDemoState();
}

class _BaselineDemoState extends State<BaselineDemo> {
  double _baseline = 50.0;
  bool _useBaseline = true;
  TextBaseline _baselineType = TextBaseline.alphabetic;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Baseline Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Toggle Baseline
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _useBaseline,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _useBaseline = val);
                    }
                  },
                ),
                const Text('Enable Baseline'),
              ],
            ),

            // Baseline Type Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Type: '),
                const SizedBox(width: 4),
                DropdownButton<TextBaseline>(
                  value: _baselineType,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _baselineType = val);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: TextBaseline.alphabetic,
                      child: Text('Alphabetic'),
                    ),
                    DropdownMenuItem(
                      value: TextBaseline.ideographic,
                      child: Text('Ideographic'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Slider for baseline height
        if (_useBaseline)
          Row(
            children: [
              const SizedBox(width: 100, child: Text('Baseline Offset:')),
              Expanded(
                child: Slider(
                  value: _baseline,
                  min: 20.0,
                  max: 120.0,
                  divisions: 10,
                  label: '${_baseline.round()} px',
                  onChanged: (val) => setState(() => _baseline = val),
                ),
              ),
              Text('${_baseline.round()}px', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        const Divider(height: 24),

        // Visual Playground
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              // Visual Baseline Guideline
              if (_useBaseline)
                Positioned(
                  top: 40 + _baseline, // aligns with baseline container top + offset
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 1,
                    color: Colors.red.withValues(alpha: 0.6),
                  ),
                ),

              // Guide labels
              if (_useBaseline)
                Positioned(
                  top: 40 + _baseline - 18,
                  right: 16,
                  child: const Text(
                    'Alignment Guideline',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              // Text elements container
              Positioned(
                top: 40,
                left: 16,
                right: 16,
                child: Row(
                  crossAxisAlignment: _useBaseline 
                      ? CrossAxisAlignment.baseline 
                      : CrossAxisAlignment.start,
                  textBaseline: _baselineType,
                  children: [
                    // Element 1
                    _buildTextWrapper(
                      child: const Text(
                        'LargeText',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Element 2
                    _buildTextWrapper(
                      child: Text(
                        'small_desc',
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.colorScheme.primary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Element 3
                    _buildTextWrapper(
                      child: const Text(
                        '漢字 (Kanji)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _useBaseline 
              ? 'Baselines are aligned horizontally along the red guideline.' 
              : 'Baselines are not aligned (texts are aligned by their top boundaries).',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTextWrapper({required Widget child}) {
    if (!_useBaseline) {
      return Container(
        color: Colors.grey.withValues(alpha: 0.15),
        child: child,
      );
    }

    return Container(
      color: Colors.grey.withValues(alpha: 0.15),
      child: Baseline(
        baseline: _baseline,
        baselineType: _baselineType,
        child: child,
      ),
    );
  }
}
