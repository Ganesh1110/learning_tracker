import 'package:flutter/material.dart';

class AspectRatioDemo extends StatefulWidget {
  const AspectRatioDemo({super.key});

  @override
  State<AspectRatioDemo> createState() => _AspectRatioDemoState();
}

class _AspectRatioDemoState extends State<AspectRatioDemo> {
  double _aspectRatio = 16 / 9;
  String _aspectRatioLabel = '16:9';
  double _parentWidth = 300;
  double _parentHeight = 200;
  bool _constrainHeight = false;

  final List<Map<String, dynamic>> _presets = [
    {'label': '1:1', 'value': 1.0},
    {'label': '4:3', 'value': 4 / 3},
    {'label': '3:2', 'value': 3 / 2},
    {'label': '16:9', 'value': 16 / 9},
    {'label': '21:9', 'value': 21 / 9},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Presets Selector
        Text(
          'Select Aspect Ratio Preset',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: _presets.map((preset) {
            final isSelected = _aspectRatioLabel == preset['label'];
            return ChoiceChip(
              label: Text(preset['label']),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _aspectRatio = preset['value'];
                    _aspectRatioLabel = preset['label'];
                  });
                }
              },
            );
          }).toList(),
        ),
        const Divider(height: 24),

        // Parent Constraints Editor
        Text(
          'Configure Parent Box Constraints',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 100, child: Text('Parent Width:')),
            Expanded(
              child: Slider(
                value: _parentWidth,
                min: 150,
                max: 320,
                divisions: 17,
                label: '${_parentWidth.round()} px',
                onChanged: (val) => setState(() => _parentWidth = val),
              ),
            ),
            Text('${_parentWidth.round()}px', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 100, child: Text('Parent Height:')),
            Expanded(
              child: Slider(
                value: _parentHeight,
                min: 100,
                max: 240,
                divisions: 14,
                label: '${_parentHeight.round()} px',
                onChanged: (val) => setState(() => _parentHeight = val),
              ),
            ),
            Text('${_parentHeight.round()}px', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _constrainHeight,
              onChanged: (val) {
                if (val != null) {
                  setState(() => _constrainHeight = val);
                }
              },
            ),
            const Expanded(
              child: Text(
                'Enforce strict parent height (simulates a fixed vertical box)',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bounding dashed box wrapper
              Container(
                width: _parentWidth,
                height: _constrainHeight ? _parentHeight : null,
                constraints: _constrainHeight 
                    ? null 
                    : BoxConstraints(maxHeight: _parentHeight),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.4),
                    style: BorderStyle.solid,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: theme.colorScheme.primary.withValues(alpha: 0.05),
                ),
                alignment: Alignment.topLeft,
                child: AspectRatio(
                  aspectRatio: _aspectRatio,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.shadow.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final actualWidth = constraints.maxWidth;
                        final actualHeight = constraints.maxHeight;
                        return Stack(
                          children: [
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'Ratio: $_aspectRatioLabel',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _aspectRatio >= 1.5
                                        ? Icons.aspect_ratio_rounded
                                        : Icons.crop_square_rounded,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '${actualWidth.round()} × ${actualHeight.round()}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Dotted Border represents Parent bounds (${_parentWidth.round()}w × ${_parentHeight.round()}h)',
                style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
