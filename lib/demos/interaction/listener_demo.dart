import 'package:flutter/material.dart';

class ListenerDemo extends StatefulWidget {
  const ListenerDemo({super.key});

  @override
  State<ListenerDemo> createState() => _ListenerDemoState();
}

class _ListenerDemoState extends State<ListenerDemo> {
  final List<String> _logs = [];
  Offset? _currentPosition;
  String _activePointerInfo = 'No pointer active';

  void _addLog(String msg) {
    final time = DateTime.now().toLocal().toString().split(' ').last.substring(0, 8);
    setState(() {
      _logs.insert(0, '[$time] $msg');
      if (_logs.length > 6) _logs.removeLast();
    });
  }

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
                  'Listener Sandbox',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Listener captures raw touch/pointer coordinates, pressure, and device signals directly from the operating system, bypassing gesture arena resolutions.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        Text(
          'Visual Output (Touch & Drag inside the tracker box):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        
        // Low-level pointer listener region
        Listener(
          onPointerDown: (PointerDownEvent event) {
            _addLog('Down: Pointer #${event.pointer} (${event.kind.name})');
            setState(() {
              _currentPosition = event.localPosition;
              _activePointerInfo = 'Pointer #${event.pointer} Down: ${event.localPosition.dx.toStringAsFixed(0)}, ${event.localPosition.dy.toStringAsFixed(0)}';
            });
          },
          onPointerMove: (PointerMoveEvent event) {
            setState(() {
              _currentPosition = event.localPosition;
              _activePointerInfo = 'Pointer #${event.pointer} Move: ${event.localPosition.dx.toStringAsFixed(0)}, ${event.localPosition.dy.toStringAsFixed(0)} (Pressure: ${event.pressure.toStringAsFixed(1)})';
            });
          },
          onPointerUp: (PointerUpEvent event) {
            _addLog('Up: Pointer #${event.pointer}');
            setState(() {
              _currentPosition = null;
              _activePointerInfo = 'No pointer active';
            });
          },
          onPointerCancel: (PointerCancelEvent event) {
            _addLog('Cancel: Pointer #${event.pointer}');
            setState(() {
              _currentPosition = null;
              _activePointerInfo = 'No pointer active';
            });
          },
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.primary, width: 1.5),
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.track_changes,
                        size: 32,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _activePointerInfo,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                
                // Real-time pointer coordinate feedback dot
                if (_currentPosition != null)
                  Positioned(
                    left: _currentPosition!.dx - 16,
                    top: _currentPosition!.dy - 16,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                        border: Border.all(color: theme.colorScheme.primary, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Event Logs
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Raw Pointer Event Logs:',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_logs.isNotEmpty)
              TextButton(
                onPressed: () => setState(() => _logs.clear()),
                child: const Text('Clear'),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 140,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: _logs.isEmpty
              ? const Center(
                  child: Text(
                    'No pointer actions recorded yet.',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              : ListView.builder(
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        _logs[index],
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
