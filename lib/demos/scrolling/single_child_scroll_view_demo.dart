import 'package:flutter/material.dart';

class SingleChildScrollViewDemo extends StatefulWidget {
  const SingleChildScrollViewDemo({super.key});

  @override
  State<SingleChildScrollViewDemo> createState() => _SingleChildScrollViewDemoState();
}

class _SingleChildScrollViewDemoState extends State<SingleChildScrollViewDemo> {
  final ScrollController _scrollController = ScrollController();
  Axis _scrollDirection = Axis.vertical;
  ScrollPhysics _physics = const BouncingScrollPhysics();

  final Map<String, ScrollPhysics> _physicsMap = {
    'Bouncing (iOS style)': const BouncingScrollPhysics(),
    'Clamping (Android style)': const ClampingScrollPhysics(),
    'Never Scrollable': const NeverScrollableScrollPhysics(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isHorizontal = _scrollDirection == Axis.horizontal;

    // Children of the scroll view
    final items = List.generate(8, (index) {
      return Container(
        margin: const EdgeInsets.all(6),
        width: isHorizontal ? 80 : double.infinity,
        height: isHorizontal ? double.infinity : 40,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1 + (index * 0.1)),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
        ),
        alignment: Alignment.center,
        child: Text(
          'Box ${index + 1}',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      );
    });

    final scrollContent = isHorizontal
        ? Row(children: items)
        : Column(children: items);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SingleChildScrollView is a scrollable container that holds a single '
          'child widget. It is mostly used for layouts that need to scroll when keyboard is shown.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live scroll viewport
        Center(
          child: Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: _scrollDirection,
              physics: _physics,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: scrollContent,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Direction Toggle
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Scroll Direction:', style: theme.textTheme.bodySmall),
            SegmentedButton<Axis>(
              segments: const [
                ButtonSegment(value: Axis.vertical, label: Text('Vertical')),
                ButtonSegment(value: Axis.horizontal, label: Text('Horizontal')),
              ],
              selected: {_scrollDirection},
              onSelectionChanged: (val) {
                setState(() => _scrollDirection = val.first);
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Physics Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Scroll Physics:', style: theme.textTheme.bodySmall),
            DropdownButton<ScrollPhysics>(
              value: _physics,
              items: _physicsMap.entries.map((entry) {
                return DropdownMenuItem<ScrollPhysics>(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _physics = val);
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Quick Navigation
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => _scrollTo(0.0),
              icon: const Icon(Icons.arrow_upward_rounded),
              label: const Text('Scroll Top'),
            ),
            ElevatedButton.icon(
              onPressed: () => _scrollTo(300.0),
              icon: const Icon(Icons.arrow_downward_rounded),
              label: const Text('Scroll Bottom'),
            ),
          ],
        ),
      ],
    );
  }
}
