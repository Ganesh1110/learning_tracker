import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AndroidViewDemo extends StatefulWidget {
  const AndroidViewDemo({super.key});

  @override
  State<AndroidViewDemo> createState() => _AndroidViewDemoState();
}

class _AndroidViewDemoState extends State<AndroidViewDemo> {
  final List<String> _logs = [];
  bool _virtualDisplayEnabled = true;
  String _simulatedEvent = 'Idle';

  void _addLog(String msg) {
    setState(() {
      _logs.insert(0, '${DateTime.now().toIso8601String().substring(11, 19)} - $msg');
      if (_logs.length > 5) _logs.removeLast();
    });
  }

  @override
  void initState() {
    super.initState();
    _addLog('AndroidView initialized');
    _addLog('Platform View Factory registered on native thread');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Platform status indicator
        Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: isAndroid ? theme.colorScheme.primary : theme.colorScheme.secondary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                isAndroid
                    ? 'Running on Android. Real AndroidView requires native setup.'
                    : 'Running on non-Android platform (${defaultTargetPlatform.name}). Showing simulated view.',
                style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Controls
        Row(
          children: [
            const Text('Virtual Display Render: ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            const Spacer(),
            Switch(
              value: _virtualDisplayEnabled,
              onChanged: (val) {
                setState(() => _virtualDisplayEnabled = val);
                _addLog(val ? 'Enabled Virtual Display mode (Texture ID: 4)' : 'Disabled Virtual Display mode');
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Simulation Canvas (Simulating Android Calendar View)
        GestureDetector(
          onTapDown: (details) {
            final localPos = details.localPosition;
            setState(() {
              _simulatedEvent = 'Tap at (${localPos.dx.toInt()}, ${localPos.dy.toInt()})';
            });
            _addLog('Touch captured at (${localPos.dx.toInt()}, ${localPos.dy.toInt()})');
            _addLog('Forwarding pointer events to Android Native Window...');
          },
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant, width: 2),
            ),
            child: Stack(
              children: [
                // Simulated Android Native Calendar UI
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.withValues(alpha: 0.5), width: 2),
                    ),
                    child: Column(
                      children: [
                        // Native Android Title Bar Mock
                        Container(
                          color: Colors.green.shade700,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: const Row(
                            children: [
                              Icon(Icons.android_rounded, color: Colors.white, size: 16),
                              SizedBox(width: 6),
                              Text(
                                'Android CalendarView (Native)',
                                style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text('SDK 34', style: TextStyle(color: Colors.white70, fontSize: 9)),
                            ],
                          ),
                        ),
                        // Calendar Days Grid Mock
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(8),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              childAspectRatio: 1.8,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            itemCount: 28,
                            itemBuilder: (context, index) {
                              final isSelected = index == 14;
                              return Container(
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.green.shade100 : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: isSelected ? Colors.green : Colors.grey.shade300),
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      color: isSelected ? Colors.green.shade900 : Colors.black87,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Texture Overlay Simulation
                if (_virtualDisplayEnabled)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Virtual Display Texture (ID 4)',
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                // Event Toast overlay
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Simulated Event: $_simulatedEvent',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'monospace'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Live logs panel
        const Text('Console / Pipe Logs: ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
            itemCount: _logs.length,
            itemBuilder: (context, index) {
              return Text(
                _logs[index],
                style: const TextStyle(color: Colors.greenAccent, fontSize: 10, fontFamily: 'monospace'),
              );
            },
          ),
        ),
      ],
    );
  }
}
