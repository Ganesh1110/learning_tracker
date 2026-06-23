import 'package:flutter/material.dart';

class DragTargetDemo extends StatefulWidget {
  const DragTargetDemo({super.key});

  @override
  State<DragTargetDemo> createState() => _DragTargetDemoState();
}

class _DragTargetDemoState extends State<DragTargetDemo> {
  int _score = 0;
  String _lastDropped = 'None';
  final List<String> _colors = ['Red', 'Blue', 'Green'];
  final Map<String, Color> _colorMap = {
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
  };

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drag Target Scoreboard',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Successful Drops: $_score | Last Item: $_lastDropped'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _score = 0;
                      _lastDropped = 'None';
                    });
                  },
                  child: const Text('Reset'),
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            children: [
              // 1. Draggable items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _colors.map((colorName) {
                  final color = _colorMap[colorName]!;
                  return Draggable<String>(
                    data: colorName,
                    feedback: Material(
                      elevation: 4,
                      shape: const CircleBorder(),
                      color: color,
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          colorName[0],
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        colorName,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),

              // 2. DragTarget zone
              DragTarget<String>(
                onWillAcceptWithDetails: (details) {
                  // highlight or accept anything
                  return true;
                },
                onAcceptWithDetails: (details) {
                  setState(() {
                    _score++;
                    _lastDropped = details.data;
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  final isHovered = candidateData.isNotEmpty;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isHovered
                          ? theme.colorScheme.primaryContainer.withValues(alpha: 0.7)
                          : theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isHovered
                            ? theme.colorScheme.primary
                            : theme.colorScheme.outlineVariant,
                        width: isHovered ? 2.5 : 1.5,
                      ),
                    ),
                    child: Center(
                      child: isHovered
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.download, color: theme.colorScheme.primary),
                                const SizedBox(height: 4),
                                Text(
                                  'Drop "${candidateData.first}" here!',
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.move_to_inbox, color: Colors.grey),
                                SizedBox(height: 4),
                                Text(
                                  'Drop Zone (Accepts any color)',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
