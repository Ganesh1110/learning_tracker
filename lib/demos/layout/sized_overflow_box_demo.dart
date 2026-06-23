import 'package:flutter/material.dart';

class SizedOverflowBoxDemo extends StatefulWidget {
  const SizedOverflowBoxDemo({super.key});

  @override
  State<SizedOverflowBoxDemo> createState() => _SizedOverflowBoxDemoState();
}

class _SizedOverflowBoxDemoState extends State<SizedOverflowBoxDemo> {
  double _parentWidth = 100.0;
  double _parentHeight = 60.0;
  bool _clip = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Large child that will overflow the SizedOverflowBox parent size
    final childWidget = Container(
      width: 150,
      height: 90,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.pink],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Text(
        '150 × 90 Child',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SizedOverflowBox specifies a layout size for its parent, '
          'but passes its original constraints down, allowing the child to overflow bounds.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area with container showing layout bounds
        Center(
          child: Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: _clip
                    ? ClipRect(
                        child: SizedOverflowBox(
                          size: Size(_parentWidth, _parentHeight),
                          child: childWidget,
                        ),
                      )
                    : SizedOverflowBox(
                        size: Size(_parentWidth, _parentHeight),
                        child: childWidget,
                      ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Center(
            child: Text(
              _clip
                  ? 'ClipRect active: Child is cropped to fit parent bounds.'
                  : 'No clipping: Child overflows red parent borders.',
              style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic, fontSize: 11),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Sizing Sliders
        Row(
          children: [
            SizedBox(
              width: 130,
              child: Text('parent width: ${_parentWidth.toInt()}px', style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _parentWidth,
                min: 50,
                max: 140,
                onChanged: (v) => setState(() => _parentWidth = v),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 130,
              child: Text('parent height: ${_parentHeight.toInt()}px', style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _parentHeight,
                min: 30,
                max: 80,
                onChanged: (v) => setState(() => _parentHeight = v),
              ),
            ),
          ],
        ),

        // Clip toggle
        Row(
          children: [
            const Text('Clip Overflowed Content:'),
            Switch(
              value: _clip,
              onChanged: (v) => setState(() => _clip = v),
            ),
          ],
        ),
      ],
    );
  }
}
