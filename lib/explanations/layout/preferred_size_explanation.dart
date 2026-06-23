import 'package:flutter/material.dart';

class PreferredSizeExplanation extends StatelessWidget {
  const PreferredSizeExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PreferredSize Explanation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PreferredSize Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'PreferredSize is a layout-helping widget that implements the PreferredSizeWidget '
              'interface. Certain parent widgets in Flutter (such as Scaffold\'s appBar slot or '
              'TabBar\'s bottom slot) require children that specify their preferred dimensions. '
              'PreferredSize allows you to wrap any arbitrary widget and explicitly assign a preferred '
              'width and height, making it compatible with these parent slots.',
            ),
            const SizedBox(height: 20),
            const Text(
              'React Native Equivalent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'In React Native, layout interfaces do not use a "preferred size" contract. '
              'Headers, tabs, and navigation elements calculate their sizes automatically based '
              'on child flex properties or explicit style bounds. To define height constraints, '
              'developers simply apply styling rules (e.g., `height: 60` or standard paddings) '
              'directly on the layout component.',
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Key Properties',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text('• preferredSize: A Size object specifying the width and height (typically Size.fromHeight).'),
                    Text('• child: The widget being wrapped and given a preferred size profile.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
