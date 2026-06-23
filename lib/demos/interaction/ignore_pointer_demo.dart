import 'package:flutter/material.dart';

class IgnorePointerDemo extends StatefulWidget {
  const IgnorePointerDemo({super.key});

  @override
  State<IgnorePointerDemo> createState() => _IgnorePointerDemoState();
}

class _IgnorePointerDemoState extends State<IgnorePointerDemo> {
  bool _ignoring = true;
  final List<String> _logs = [];

  void _addLog(String msg) {
    final time = DateTime.now().toLocal().toString().split(' ').last.substring(0, 8);
    setState(() {
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
                  'IgnorePointer Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Ignore Pointer Actions'),
                  subtitle: const Text('When enabled, the button ignores clicks and passes them through'),
                  value: _ignoring,
                  onChanged: (val) => setState(() => _ignoring = val),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Tap the button):',
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
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Underlay Card (will receive click if button ignores pointer)
              GestureDetector(
                onTap: () => _addLog('Underlay Card received click!'),
                child: Container(
                  width: 280,
                  height: 120,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Underlay Card (Taps hit me if button is ignored)',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              // Overlay Button wrapped in IgnorePointer
              IgnorePointer(
                ignoring: _ignoring,
                child: ElevatedButton.icon(
                  onPressed: () => _addLog('Button clicked!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                  ),
                  icon: const Icon(Icons.touch_app),
                  label: const Text('Target Button'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Event Logs:',
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
                    'No events clicked yet.',
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
