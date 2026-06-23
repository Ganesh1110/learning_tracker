import 'package:flutter/material.dart';

class DraggableScrollableSheetDemo extends StatefulWidget {
  const DraggableScrollableSheetDemo({super.key});

  @override
  State<DraggableScrollableSheetDemo> createState() =>
      _DraggableScrollableSheetDemoState();
}

class _DraggableScrollableSheetDemoState
    extends State<DraggableScrollableSheetDemo> {
  double _initialChildSize = 0.4;
  double _minChildSize = 0.25;
  double _maxChildSize = 0.9;
  bool _snap = true;

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
                  'Sheet Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Initial Size: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_initialChildSize.toStringAsFixed(2)),
                    Expanded(
                      child: Slider(
                        value: _initialChildSize,
                        min: _minChildSize,
                        max: _maxChildSize,
                        onChanged: (val) {
                          setState(() {
                            _initialChildSize = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Min Size: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_minChildSize.toStringAsFixed(2)),
                    Expanded(
                      child: Slider(
                        value: _minChildSize,
                        min: 0.1,
                        max: _initialChildSize,
                        onChanged: (val) {
                          setState(() {
                            _minChildSize = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Max Size: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_maxChildSize.toStringAsFixed(2)),
                    Expanded(
                      child: Slider(
                        value: _maxChildSize,
                        min: _initialChildSize,
                        max: 1.0,
                        onChanged: (val) {
                          setState(() {
                            _maxChildSize = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SwitchListTile(
                  title: const Text('Snap to Sizes'),
                  subtitle: const Text('Snaps to min/max/initial positions when released'),
                  value: _snap,
                  onChanged: (val) => setState(() => _snap = val),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Drag the sheet up/down):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 350,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              const Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'This represents the underlying screen content. You can place maps, profiles, or details here, while the bottom sheet overlays it.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              // We reconstruct or rebuild key of sheet to force reinitialization
              // when config sliders change.
              DraggableScrollableSheet(
                key: ValueKey('$_initialChildSize-$_minChildSize-$_maxChildSize-$_snap'),
                initialChildSize: _initialChildSize,
                minChildSize: _minChildSize,
                maxChildSize: _maxChildSize,
                snap: _snap,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainer,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Drag Handle
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.outline,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: Text(
                            'Draggable Bottom Sheet',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(height: 1),
                        Expanded(
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: theme.colorScheme.secondaryContainer,
                                  child: Text('${index + 1}'),
                                ),
                                title: Text('Scrollable Item #${index + 1}'),
                                subtitle: const Text('Swipe sheet up to view more'),
                              );
                            },
                          ),
                        ),
                      ],
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
