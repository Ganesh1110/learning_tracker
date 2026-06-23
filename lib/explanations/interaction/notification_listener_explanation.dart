import 'package:flutter/material.dart';

class NotificationListenerExplanation extends StatelessWidget {
  const NotificationListenerExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('NotificationListener Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is NotificationListener?',
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'NotificationListener intercepts Notification objects that '
              'bubble up the widget tree. The most common use-case is '
              'listening to ScrollNotification (start, update, end) from a '
              'descendant scrollable widget, without needing a '
              'ScrollController.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'In React Native you use the onScroll prop on ScrollView or '
              'FlatList (with scrollEventThrottle) to receive scroll events. '
              'NotificationListener is Flutter\'s equivalent but it works '
              'through the widget tree, not via explicit prop wiring.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• onNotification – callback receiving the notification'),
            Text(
                '  • Return true to stop bubbling, false to let it continue'),
            Text('• Notification types:'),
            Text('  - ScrollStartNotification'),
            Text('  - ScrollUpdateNotification'),
            Text('  - ScrollEndNotification'),
            Text('  - OverscrollNotification'),
          ],
        ),
      ),
    );
  }
}
