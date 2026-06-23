import 'package:flutter/material.dart';

class GestureDetectorDemo extends StatefulWidget {
  const GestureDetectorDemo({super.key});

  @override
  State<GestureDetectorDemo> createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {
  String _currentGesture = 'No gesture detected yet.';
  final List<String> _logs = [];

  void _addLog(String msg) {
    final time = DateTime.now().toLocal().toString().split(' ').last.substring(0, 8);
    setState(() {
      _currentGesture = msg;
      _logs.insert(0, '[$time] $msg');
      if (_logs.length > 5) _logs.removeLast();
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
                  'GestureDetector Sandbox',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'GestureDetector detects physical touch coordinates and gesture actions (taps, drags, pinches) without visual styling overlay constraints.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Interact with the canvas below):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _addLog('Tap detected!'),
          onDoubleTap: () => _addLog('Double Tap detected!'),
          onLongPress: () => _addLog('Long Press detected!'),
          onPanStart: (details) => _addLog('Pan Drag Started at: ${details.localPosition.dx.toStringAsFixed(0)}, ${details.localPosition.dy.toStringAsFixed(0)}'),
          onPanUpdate: (details) => _addLog('Dragging at: ${details.localPosition.dx.toStringAsFixed(0)}, ${details.localPosition.dy.toStringAsFixed(0)}'),
          onPanEnd: (_) => _addLog('Pan Drag ended!'),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.primary, width: 1.5),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.gesture,
                  size: 48,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Touch, Double-Tap, Long-Press, or Drag here',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  _currentGesture,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Gesture Event Logs:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 120,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: _logs.isEmpty
              ? const Center(
                  child: Text(
                    'Waiting for touch interaction...',
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
