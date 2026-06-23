import 'package:flutter/material.dart';

class NotificationListenerDemo extends StatefulWidget {
  const NotificationListenerDemo({super.key});

  @override
  State<NotificationListenerDemo> createState() =>
      _NotificationListenerDemoState();
}

class _NotificationListenerDemoState
    extends State<NotificationListenerDemo> {
  double _scrollOffset = 0;
  String _scrollStatus = 'Not scrolling yet — try scrolling the list below';
  Color _statusColor = Colors.grey;
  IconData _statusIcon = Icons.touch_app_outlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'NotificationListener intercepts ScrollNotification events '
          'that bubble up the widget tree — no ScrollController needed.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 12),

        // ── Status banner ──────────────────────────────────────────────
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: _statusColor.withAlpha(25),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _statusColor.withAlpha(80)),
          ),
          child: Row(
            children: [
              Icon(_statusIcon, color: _statusColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _scrollStatus,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _statusColor,
                          fontSize: 13),
                    ),
                    Text(
                      'Offset: ${_scrollOffset.toStringAsFixed(1)} px',
                      style: const TextStyle(
                          fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // ── NotificationListener wrapping a fixed-height list ──────────
        SizedBox(
          height: 220,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              setState(() {
                _scrollOffset = notification.metrics.pixels;
                if (notification is ScrollStartNotification) {
                  _scrollStatus = 'ScrollStartNotification received';
                  _statusColor = Colors.blue;
                  _statusIcon = Icons.play_arrow_rounded;
                } else if (notification is ScrollUpdateNotification) {
                  _scrollStatus = 'ScrollUpdateNotification — scrolling…';
                  _statusColor = Colors.orange;
                  _statusIcon = Icons.sync_rounded;
                } else if (notification is ScrollEndNotification) {
                  _scrollStatus = 'ScrollEndNotification received';
                  _statusColor = Colors.green;
                  _statusIcon = Icons.check_circle_outline_rounded;
                }
              });
              return false; // let the event bubble further
            },
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (_, i) => ListTile(
                dense: true,
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  radius: 14,
                  child: Text('${i + 1}',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 11)),
                ),
                title: Text('List Item ${i + 1}'),
                subtitle: const Text('Scroll to fire notifications'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
