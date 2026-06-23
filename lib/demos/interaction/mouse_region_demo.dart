import 'package:flutter/material.dart';

class MouseRegionDemo extends StatefulWidget {
  const MouseRegionDemo({super.key});

  @override
  State<MouseRegionDemo> createState() => _MouseRegionDemoState();
}

class _MouseRegionDemoState extends State<MouseRegionDemo> {
  bool _isHovered = false;
  MouseCursor _selectedCursor = SystemMouseCursors.click;
  Offset _hoverPosition = Offset.zero;

  final Map<String, MouseCursor> _cursors = {
    'Click Link (Hand)': SystemMouseCursors.click,
    'Text Input (I-Beam)': SystemMouseCursors.text,
    'Grab Hand': SystemMouseCursors.grab,
    'Zoom In': SystemMouseCursors.zoomIn,
    'Forbidden / Blocked': SystemMouseCursors.forbidden,
    'Normal Arrow': SystemMouseCursors.basic,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MouseRegion Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Cursor type selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Hover Cursor Type: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    DropdownButton<MouseCursor>(
                      value: _selectedCursor,
                      onChanged: (MouseCursor? val) {
                        if (val != null) {
                          setState(() => _selectedCursor = val);
                        }
                      },
                      items: _cursors.entries.map((entry) {
                        return DropdownMenuItem<MouseCursor>(
                          value: entry.value,
                          child: Text(entry.key, style: const TextStyle(fontSize: 13)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        Text(
          'Visual Output (Move mouse pointer inside container):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        // Animated Mouse Region target box
        Center(
          child: MouseRegion(
            cursor: _selectedCursor,
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() {
              _isHovered = false;
              _hoverPosition = Offset.zero;
            }),
            onHover: (event) => setState(() => _hoverPosition = event.localPosition),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 300,
              height: 160,
              decoration: BoxDecoration(
                color: _isHovered
                    ? theme.colorScheme.primaryContainer.withValues(alpha: 0.25)
                    : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isHovered ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
                  width: _isHovered ? 2 : 1.5,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        )
                      ]
                    : [],
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isHovered ? Icons.mouse : Icons.mouse_outlined,
                    size: 36,
                    color: _isHovered ? theme.colorScheme.primary : Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isHovered ? 'Hover Active!' : 'Hover mouse over this area',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _isHovered ? theme.colorScheme.primary : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (_isHovered)
                    Text(
                      'Cursor Coordinate: X=${_hoverPosition.dx.toStringAsFixed(0)}, Y=${_hoverPosition.dy.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
