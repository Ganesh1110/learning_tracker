import 'package:flutter/material.dart';

class NavigationToolbarDemo extends StatelessWidget {
  const NavigationToolbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget toolbarCard({
      required String label,
      required Color bg,
      required Widget leading,
      required Widget middle,
      required Widget trailing,
      double middleSpacing = NavigationToolbar.kMiddleSpacing,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: theme.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: kToolbarHeight,
              child: ColoredBox(
                color: bg,
                child: NavigationToolbar(
                  middleSpacing: middleSpacing,
                  leading: leading,
                  middle: middle,
                  trailing: trailing,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NavigationToolbar arranges leading, middle, and trailing '
          'widgets in a horizontal bar — the backbone of every AppBar.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 20),

        // Example 1 — basic
        toolbarCard(
          label: 'Basic toolbar',
          bg: Colors.indigo,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          middle: const Text(
            'Page Title',
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ),

        const SizedBox(height: 20),

        // Example 2 — middleSpacing 0
        toolbarCard(
          label: 'middleSpacing = 0',
          bg: Colors.teal,
          middleSpacing: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          middle: Container(
            color: Colors.teal.shade700,
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: const Text('Custom Middle',
                style: TextStyle(color: Colors.white)),
          ),
          trailing:
              const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
