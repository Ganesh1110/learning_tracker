import 'package:flutter/material.dart';

class AlignmentDirectionalDemo extends StatefulWidget {
  const AlignmentDirectionalDemo({super.key});

  @override
  State<AlignmentDirectionalDemo> createState() => _AlignmentDirectionalDemoState();
}

class _AlignmentDirectionalDemoState extends State<AlignmentDirectionalDemo> {
  TextDirection _textDirection = TextDirection.ltr;
  AlignmentDirectional _alignment = AlignmentDirectional.topStart;

  final Map<String, AlignmentDirectional> _directionalAlignments = {
    'topStart': AlignmentDirectional.topStart,
    'topEnd': AlignmentDirectional.topEnd,
    'centerStart': AlignmentDirectional.centerStart,
    'centerEnd': AlignmentDirectional.centerEnd,
    'bottomStart': AlignmentDirectional.bottomStart,
    'bottomEnd': AlignmentDirectional.bottomEnd,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls: Alignment Selector and Direction Toggle
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<AlignmentDirectional>(
              value: _alignment,
              onChanged: (val) {
                if (val != null) {
                  setState(() => _alignment = val);
                }
              },
              items: _directionalAlignments.entries.map((entry) {
                return DropdownMenuItem<AlignmentDirectional>(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _textDirection = _textDirection == TextDirection.ltr
                      ? TextDirection.rtl
                      : TextDirection.ltr;
                });
              },
              icon: const Icon(Icons.translate_rounded),
              label: Text(_textDirection == TextDirection.ltr ? 'LTR ➔ RTL' : 'RTL ➔ LTR'),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Visual display box wrapping the Align widget with a Directionality container
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
              alignment: _alignment,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    _textDirection == TextDirection.ltr ? 'Start' : 'End',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Current Layout Direction: ${_textDirection == TextDirection.ltr ? "Left-to-Right" : "Right-to-Left"}',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
