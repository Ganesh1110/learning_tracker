import 'package:flutter/material.dart';

class AlignmentGeometryDemo extends StatefulWidget {
  const AlignmentGeometryDemo({super.key});

  @override
  State<AlignmentGeometryDemo> createState() => _AlignmentGeometryDemoState();
}

class _AlignmentGeometryDemoState extends State<AlignmentGeometryDemo> {
  TextDirection _textDirection = TextDirection.ltr;

  // Declared as AlignmentGeometry type to show polymorphism
  AlignmentGeometry _alignmentGeometry = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls: Select geometry type and toggle text direction
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            ChoiceChip(
              label: const Text('Alignment.topRight (Absolute)'),
              selected: _alignmentGeometry == Alignment.topRight,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _alignmentGeometry = Alignment.topRight);
                }
              },
            ),
            ChoiceChip(
              label: const Text('AlignmentDirectional.topEnd (RTL Aware)'),
              selected: _alignmentGeometry == AlignmentDirectional.topEnd,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _alignmentGeometry = AlignmentDirectional.topEnd);
                }
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _textDirection = _textDirection == TextDirection.ltr
                      ? TextDirection.rtl
                      : TextDirection.ltr;
                });
              },
              icon: const Icon(Icons.swap_horiz_rounded),
              label: Text(_textDirection == TextDirection.ltr ? 'LTR ➔ RTL' : 'RTL ➔ LTR'),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Visual alignment canvas
        Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Directionality(
            textDirection: _textDirection,
            child: Align(
              alignment: _alignmentGeometry, // Accepts AlignmentGeometry base class
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _alignmentGeometry is Alignment
                      ? theme.colorScheme.primary
                      : theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    _alignmentGeometry is Alignment ? 'Absolute' : 'RTL Aware',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Resolved Alignment position depends on layout direction: ${_textDirection == TextDirection.ltr ? "LTR" : "RTL"}',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
