import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool _horizontal = true;
  bool _allowImplicit = false;

  final List<_PageData> _pages = const [
    _PageData('Page 1', Icons.looks_one_rounded, Colors.deepPurple,
        'Swipe to go to the next page'),
    _PageData('Page 2', Icons.looks_two_rounded, Colors.indigo,
        'PageView snaps to each page'),
    _PageData('Page 3', Icons.looks_3_rounded, Colors.teal,
        'Use PageController to jump programmatically'),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'PageView is a scrollable list that works page by page. '
          'It snaps to each page and supports programmatic navigation.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 12),

        // Options row
        Wrap(
          spacing: 8,
          children: [
            FilterChip(
              label: const Text('Horizontal'),
              selected: _horizontal,
              onSelected: (_) => setState(() => _horizontal = true),
            ),
            FilterChip(
              label: const Text('Vertical'),
              selected: !_horizontal,
              onSelected: (_) => setState(() => _horizontal = false),
            ),
            FilterChip(
              label: const Text('allowImplicit'),
              selected: _allowImplicit,
              onSelected: (v) => setState(() => _allowImplicit = v),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // PageView
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _controller,
            scrollDirection:
                _horizontal ? Axis.horizontal : Axis.vertical,
            allowImplicitScrolling: _allowImplicit,
            itemCount: _pages.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (_, i) {
              final page = _pages[i];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [page.color, page.color.withAlpha(180)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(page.icon, color: Colors.white, size: 40),
                    const SizedBox(height: 8),
                    Text(page.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(page.subtitle,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 12),
                        textAlign: TextAlign.center),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // Page indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_pages.length, (i) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == i ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == i
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),

        // Navigation buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.outlined(
              icon: const Icon(Icons.chevron_left),
              onPressed: _currentPage > 0
                  ? () => _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut)
                  : null,
            ),
            const SizedBox(width: 12),
            Text('${_currentPage + 1} / ${_pages.length}',
                style: theme.textTheme.titleMedium),
            const SizedBox(width: 12),
            IconButton.outlined(
              icon: const Icon(Icons.chevron_right),
              onPressed: _currentPage < _pages.length - 1
                  ? () => _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut)
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}

class _PageData {
  final String title;
  final IconData icon;
  final Color color;
  final String subtitle;
  const _PageData(this.title, this.icon, this.color, this.subtitle);
}
