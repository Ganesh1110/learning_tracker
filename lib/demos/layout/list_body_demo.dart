import 'package:flutter/material.dart';

class ListBodyDemo extends StatefulWidget {
  const ListBodyDemo({super.key});

  @override
  State<ListBodyDemo> createState() => _ListBodyDemoState();
}

class _ListBodyDemoState extends State<ListBodyDemo> {
  Axis _axis = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Widget> children = [
      Container(
        color: theme.colorScheme.primaryContainer,
        padding: const EdgeInsets.all(16),
        child: Text(
          'Widget 1 (Short Text)',
          style: TextStyle(
            color: theme.colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        color: theme.colorScheme.secondaryContainer,
        padding: const EdgeInsets.all(24), // different padding/height
        child: Text(
          'Widget 2\n(Two lines of text)',
          style: TextStyle(
            color: theme.colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        color: theme.colorScheme.tertiaryContainer,
        padding: const EdgeInsets.all(16),
        child: Text(
          'Widget 3',
          style: TextStyle(
            color: theme.colorScheme.onTertiaryContainer,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ];

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
                  'ListBody Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ListBody lays out its children sequentially along the main axis, forcing them to match the parent\'s cross-axis dimensions.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Main Axis:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    DropdownButton<Axis>(
                      value: _axis,
                      onChanged: (Axis? val) {
                        if (val != null) {
                          setState(() => _axis = val);
                        }
                      },
                      items: const [
                        DropdownMenuItem(value: Axis.vertical, child: Text('Vertical')),
                        DropdownMenuItem(value: Axis.horizontal, child: Text('Horizontal')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 240,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: _axis,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListBody(
                mainAxis: _axis,
                children: children,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
