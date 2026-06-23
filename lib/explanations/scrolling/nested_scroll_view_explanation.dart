import 'package:flutter/material.dart';

class NestedScrollViewExplanation extends StatelessWidget {
  const NestedScrollViewExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NestedScrollView Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is NestedScrollView?',
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'NestedScrollView coordinates two scroll views: an outer '
              'sliver list (headerSliverBuilder) and an inner scrollable '
              'body. The outer list can collapse an app bar while the '
              'inner view continues scrolling independently. This is '
              'especially useful for collapsible app bars with tab views.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'In React Native you replicate this with Animated + '
              'interpolated styles on a collapsible header above a '
              'ScrollView/FlatList. Libraries like react-native-collapsible '
              'handle the coordination. Flutter\'s NestedScrollView provides '
              'this coordination natively.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
                '• headerSliverBuilder – builds the collapsing outer sliver list'),
            Text('• body – the inner scrollable widget'),
            Text(
                '• controller – shared ScrollController for the outer list'),
            Text(
                '• SliverOverlapAbsorber / Injector – synchronise overlap'),
          ],
        ),
      ),
    );
  }
}
