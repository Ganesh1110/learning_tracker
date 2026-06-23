import 'package:flutter/material.dart';

class NestedScrollViewDemo extends StatelessWidget {
  const NestedScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // NestedScrollView requires an unbounded height context to render
    // meaningfully as an embedded demo. We show an annotated visual diagram
    // plus a self-contained SliverAppBar preview instead of an embedded
    // NestedScrollView (which requires a full-screen Scaffold to be usable).
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NestedScrollView coordinates a collapsing outer sliver header '
          '(e.g. SliverAppBar + TabBar) with an independently scrolling '
          'inner body. Best experienced full-screen — tap the launch button '
          'below to open the live demo.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Architecture diagram
        _DiagramCard(theme: theme),

        const SizedBox(height: 16),

        // Full-screen launch button
        FilledButton.icon(
          icon: const Icon(Icons.open_in_full),
          label: const Text('Open Full-Screen Demo'),
          style: FilledButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                  builder: (_) => const _NestedScrollViewFullDemo()),
            );
          },
        ),
      ],
    );
  }
}

/// Diagram card explaining the two layers of NestedScrollView.
class _DiagramCard extends StatelessWidget {
  const _DiagramCard({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          _Layer(
            color: Colors.deepPurple,
            label: 'Outer — headerSliverBuilder',
            sublabel: 'SliverAppBar + TabBar (collapses on scroll)',
            icon: Icons.layers,
          ),
          const Divider(height: 1),
          _Layer(
            color: Colors.indigo,
            label: 'Inner — body',
            sublabel: 'ListView / TabBarView (scrolls independently)',
            icon: Icons.list,
          ),
          const Divider(height: 1),
          _Layer(
            color: Colors.blueGrey,
            label: 'Glue — SliverOverlapAbsorber / Injector',
            sublabel: 'Synchronises the overlap between the two layers',
            icon: Icons.link,
          ),
        ],
      ),
    );
  }
}

class _Layer extends StatelessWidget {
  const _Layer({
    required this.color,
    required this.label,
    required this.sublabel,
    required this.icon,
  });
  final Color color;
  final String label;
  final String sublabel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withAlpha(40),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13)),
                Text(sublabel,
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Full-screen demo opened via Navigator.push().
class _NestedScrollViewFullDemo extends StatelessWidget {
  const _NestedScrollViewFullDemo();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle:
                  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: const Text('NestedScrollView'),
                pinned: true,
                expandedHeight: 160,
                forceElevated: innerBoxIsScrolled,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.indigo],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Scroll to collapse me!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                bottom: const TabBar(
                  tabs: [Tab(text: 'Tab A'), Tab(text: 'Tab B')],
                ),
              ),
            ),
          ],
          body: Builder(
            builder: (context) => CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => Card(
                        child: ListTile(
                          leading:
                              CircleAvatar(child: Text('${i + 1}')),
                          title: Text('Item ${i + 1}'),
                          subtitle:
                              Text('Subtitle for item ${i + 1}'),
                        ),
                      ),
                      childCount: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
