import 'package:flutter/material.dart';

class AnimatedGridDemo extends StatefulWidget {
  const AnimatedGridDemo({super.key});

  @override
  State<AnimatedGridDemo> createState() => _AnimatedGridDemoState();
}

class _AnimatedGridDemoState extends State<AnimatedGridDemo> {
  final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();
  final List<_GridItem> _items = [];
  int _nextId = 1;

  final List<Color> _palette = const [
    Color(0xFF5C6BC0),
    Color(0xFFEC407A),
    Color(0xFF26A69A),
    Color(0xFFFF7043),
    Color(0xFF8D6E63),
    Color(0xFF42A5F5),
    Color(0xFFAB47BC),
    Color(0xFF66BB6A),
  ];

  final List<IconData> _icons = const [
    Icons.star_rounded,
    Icons.favorite_rounded,
    Icons.bolt_rounded,
    Icons.rocket_launch_rounded,
    Icons.local_fire_department_rounded,
    Icons.diamond_rounded,
    Icons.auto_awesome_rounded,
    Icons.celebration_rounded,
  ];

  @override
  void initState() {
    super.initState();
    // Start with 4 items
    for (int i = 0; i < 4; i++) {
      _items.add(_GridItem(
        id: _nextId++,
        color: _palette[i % _palette.length],
        icon: _icons[i % _icons.length],
      ));
    }
  }

  void _insertItem() {
    final idx = _items.length;
    final item = _GridItem(
      id: _nextId++,
      color: _palette[idx % _palette.length],
      icon: _icons[idx % _icons.length],
    );
    _items.insert(idx, item);
    _gridKey.currentState!.insertItem(
      idx,
      duration: const Duration(milliseconds: 400),
    );
  }

  void _removeItem() {
    if (_items.isEmpty) return;
    final idx = _items.length - 1;
    final removedItem = _items[idx];
    _gridKey.currentState!.removeItem(
      idx,
      (context, animation) => _buildAnimatedTile(removedItem, animation),
      duration: const Duration(milliseconds: 400),
    );
    _items.removeAt(idx);
  }

  Widget _buildAnimatedTile(_GridItem item, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: _buildTile(item),
      ),
    );
  }

  Widget _buildTile(_GridItem item) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [item.color, item.color.withValues(alpha: 0.7)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: item.color.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: Colors.white, size: 28),
          const SizedBox(height: 6),
          Text(
            '#${item.id}',
            style: theme.textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Action buttons
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilledButton.icon(
              onPressed: _insertItem,
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Insert Item'),
            ),
            FilledButton.tonalIcon(
              onPressed: _items.isEmpty ? null : _removeItem,
              icon: const Icon(Icons.remove_rounded, size: 18),
              label: const Text('Remove Last'),
            ),
            OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  // Remove all items from end to start
                  for (int i = _items.length - 1; i >= 0; i--) {
                    final item = _items[i];
                    _gridKey.currentState!.removeItem(
                      i,
                      (context, animation) => _buildAnimatedTile(item, animation),
                      duration: Duration(milliseconds: 200 + i * 50),
                    );
                  }
                  _items.clear();
                });
              },
              icon: const Icon(Icons.clear_all_rounded, size: 18),
              label: const Text('Clear All'),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Item count badge
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_items.length} items',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // AnimatedGrid
        SizedBox(
          height: 300,
          child: _items.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.grid_off_rounded, size: 48, color: theme.disabledColor),
                      const SizedBox(height: 8),
                      Text('Grid is empty. Tap Insert!',
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.disabledColor)),
                    ],
                  ),
                )
              : AnimatedGrid(
                  key: _gridKey,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  initialItemCount: _items.length,
                  itemBuilder: (context, index, animation) {
                    return _buildAnimatedTile(_items[index], animation);
                  },
                ),
        ),
      ],
    );
  }
}

class _GridItem {
  final int id;
  final Color color;
  final IconData icon;
  _GridItem({required this.id, required this.color, required this.icon});
}
