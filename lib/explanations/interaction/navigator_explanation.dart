import 'package:flutter/material.dart';

class NavigatorExplanation extends StatelessWidget {
  const NavigatorExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is Navigator?',
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Navigator manages a stack of Route objects. Pushing a route '
              'navigates forward; popping removes the top route. '
              'MaterialApp wraps your app in a Navigator automatically, '
              'so Navigator.of(context) is always available.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'React Native uses React Navigation or the built-in '
              'NavigationContainer + Stack.Navigator. The concept is '
              'identical — a route stack you push/pop — but Flutter\'s '
              'Navigator is built into the framework with no extra package '
              'required.',
            ),
            SizedBox(height: 20),
            Text('Key Methods',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• Navigator.push(context, route) – add a route'),
            Text('• Navigator.pop(context, [result]) – remove top route'),
            Text(
                '• Navigator.pushReplacement() – replace current route'),
            Text('• Navigator.pushAndRemoveUntil() – clear stack'),
            Text('• Navigator.pushNamed() – use named routes'),
          ],
        ),
      ),
    );
  }
}
