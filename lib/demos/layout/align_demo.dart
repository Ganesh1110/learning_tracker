import 'package:flutter/material.dart';

class AlignDemo extends StatefulWidget {
  const AlignDemo({super.key});

  @override
  State<AlignDemo> createState() => _AlignDemoState();
}

class _AlignDemoState extends State<AlignDemo> {
  Alignment _selectedAlignment = Alignment.center;

  final Map<String, Alignment> _alignments = {
    'topLeft': Alignment.topLeft,
    'topCenter': Alignment.topCenter,
    'topRight': Alignment.topRight,
    'centerLeft': Alignment.centerLeft,
    'center': Alignment.center,
    'centerRight': Alignment.centerRight,
    'bottomLeft': Alignment.bottomLeft,
    'bottomCenter': Alignment.bottomCenter,
    'bottomRight': Alignment.bottomRight,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Dropdown to select alignment
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Alignment: ', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<Alignment>(
              value: _selectedAlignment,
              onChanged: (Alignment? val) {
                if (val != null) {
                  setState(() => _selectedAlignment = val);
                }
              },
              items: _alignments.entries.map((entry) {
                return DropdownMenuItem<Alignment>(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Visual alignment canvas
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Align(
            alignment: _selectedAlignment,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.star, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
