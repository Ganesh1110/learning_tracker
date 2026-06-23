import 'package:flutter/material.dart';

class PageViewExplanation extends StatelessWidget {
  const PageViewExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageView Explained')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is PageView?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'PageView is a scrollable list that displays one page at a '
              'time and snaps to each page boundary. It supports both '
              'horizontal and vertical scroll directions and can be '
              'controlled programmatically via a PageController.',
            ),
            SizedBox(height: 20),
            Text('React Native Equivalent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Equivalent to a FlatList with horizontal={true} and '
              'pagingEnabled={true}, or a ScrollView with '
              'pagingEnabled={true}. In the React Native community, '
              'react-native-pager-view or react-native-snap-carousel '
              'are popular dedicated pager libraries.',
            ),
            SizedBox(height: 20),
            Text('Key Properties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• controller – PageController for programmatic control'),
            Text('• scrollDirection – Axis.horizontal (default) or .vertical'),
            Text('• onPageChanged – callback with new page index'),
            Text('• allowImplicitScrolling – pre-render adjacent pages'),
            Text('• pageSnapping – whether to snap to pages (default: true)'),
            SizedBox(height: 12),
            Text('Constructors',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• PageView(children: [...]) – fixed list of pages'),
            Text('• PageView.builder(itemBuilder: ...) – lazily built pages'),
            Text('• PageView.custom(childDelegate: ...) – custom delegate'),
          ],
        ),
      ),
    );
  }
}
