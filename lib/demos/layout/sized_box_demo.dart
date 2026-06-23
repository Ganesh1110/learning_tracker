import 'package:flutter/material.dart';

class SizedBoxDemo extends StatefulWidget {
  const SizedBoxDemo({super.key});

  @override
  State<SizedBoxDemo> createState() => _SizedBoxDemoState();
}

class _SizedBoxDemoState extends State<SizedBoxDemo> {
  double _width = 120.0;
  double _height = 80.0;
  String _mode = 'default'; // 'default', 'expand', 'shrink', 'square'

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Build the child box
    Widget childWidget = Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.teal],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Child Box',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );

    // Apply the selected SizedBox constructor
    Widget sizedBoxWidget;
    switch (_mode) {
      case 'expand':
        sizedBoxWidget = SizedBox.expand(child: childWidget);
        break;
      case 'shrink':
        sizedBoxWidget = SizedBox.shrink(child: childWidget);
        break;
      case 'square':
        sizedBoxWidget = SizedBox.square(dimension: _width, child: childWidget);
        break;
      default:
        sizedBoxWidget = SizedBox(
          width: _width,
          height: _height,
          child: childWidget,
        );
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SizedBox enforces specific width and height dimensions on its child. '
          'It can also expand to fill its parent or shrink to minimum constraints.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Center(
          child: Container(
            height: 140,
            width: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Center(
              child: sizedBoxWidget,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Mode Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SizedBox Mode:', style: theme.textTheme.bodySmall),
            DropdownButton<String>(
              value: _mode,
              items: const [
                DropdownMenuItem(value: 'default', child: Text('Custom Size')),
                DropdownMenuItem(value: 'expand', child: Text('SizedBox.expand()')),
                DropdownMenuItem(value: 'shrink', child: Text('SizedBox.shrink()')),
                DropdownMenuItem(value: 'square', child: Text('SizedBox.square()')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _mode = val);
              },
            ),
          ],
        ),

        // Dimension Sliders
        if (_mode == 'default') ...[
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text('width: ${_width.toInt()}px', style: theme.textTheme.bodySmall),
              ),
              Expanded(
                child: Slider(
                  value: _width,
                  min: 40,
                  max: 180,
                  onChanged: (v) => setState(() => _width = v),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text('height: ${_height.toInt()}px', style: theme.textTheme.bodySmall),
              ),
              Expanded(
                child: Slider(
                  value: _height,
                  min: 30,
                  max: 120,
                  onChanged: (v) => setState(() => _height = v),
                ),
              ),
            ],
          ),
        ],

        if (_mode == 'square') ...[
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text('dimension: ${_width.toInt()}px', style: theme.textTheme.bodySmall),
              ),
              Expanded(
                child: Slider(
                  value: _width,
                  min: 40,
                  max: 120,
                  onChanged: (v) => setState(() => _width = v),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
