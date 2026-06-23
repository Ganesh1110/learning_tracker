import 'package:flutter/material.dart';

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({super.key});

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  bool _enabled = true;
  Axis? _dragAxis;
  String _status = 'Ready to drag!';

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
                  'Draggable Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Draggable Enabled'),
                  subtitle: const Text('Toggles whether item can be picked up'),
                  value: _enabled,
                  onChanged: (val) => setState(() => _enabled = val),
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Drag Axis Constraint: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<Axis?>(
                      value: _dragAxis,
                      onChanged: (Axis? val) {
                        setState(() => _dragAxis = val);
                      },
                      items: const [
                        DropdownMenuItem(
                          value: null,
                          child: Text('Unrestricted'),
                        ),
                        DropdownMenuItem(
                          value: Axis.horizontal,
                          child: Text('Horizontal Only'),
                        ),
                        DropdownMenuItem(
                          value: Axis.vertical,
                          child: Text('Vertical Only'),
                        ),
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
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  _status,
                  style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ),
              Positioned(
                left: 24,
                top: 24,
                child: Draggable<String>(
                  data: 'Package Cargo',
                  axis: _dragAxis,
                  maxSimultaneousDrags: _enabled ? 1 : 0,
                  onDragStarted: () {
                    setState(() => _status = 'Dragging package...');
                  },
                  onDraggableCanceled: (velocity, offset) {
                    setState(() => _status = 'Drag canceled!');
                  },
                  onDragCompleted: () {
                    setState(() => _status = 'Package successfully dropped!');
                  },
                  onDragEnd: (details) {
                    if (_status == 'Dragging package...') {
                      setState(() => _status = 'Released outside drop zone!');
                    }
                  },
                  // What is left behind in the starting place
                  childWhenDragging: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.3),
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: Text('Empty Slot', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ),
                  ),
                  // What follows the cursor/pointer
                  feedback: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8),
                    color: theme.colorScheme.primary,
                    child: Container(
                      width: 90,
                      height: 90,
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inventory_2, color: Colors.white),
                          SizedBox(height: 4),
                          Text(
                            'CARGO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Normal stationary child
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: theme.colorScheme.primary),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inventory_2, color: theme.colorScheme.primary),
                          const SizedBox(height: 4),
                          const Text(
                            'Drag Me',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Simple DashStyle implementation for custom border rendering if supported,
// or we can fallback to standard styles. Flutter's border doesn't support custom dashes out of the box
// without custom paint, let's replace dashStyle with a simpler dotted layout to avoid complex borders.
// Let's modify childWhenDragging to use simple Border.all with low opacity to represent the slot.
