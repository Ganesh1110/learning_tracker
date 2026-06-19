import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  @override
  State<AnimatedListDemo> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<_ListItem> _items = [];
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
    Icons.inbox_rounded,
    Icons.mail_rounded,
    Icons.notifications_rounded,
    Icons.bookmark_rounded,
    Icons.cloud_rounded,
    Icons.security_rounded,
    Icons.palette_rounded,
    Icons.language_rounded,
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _items.add(_ListItem(
        id: _nextId++,
        color: _palette[i % _palette.length],
        icon: _icons[i % _icons.length],
        label: _labels[i % _labels.length],
      ));
    }
  }

  static const List<String> _labels = [
    'Inbox', 'Updates', 'Alerts', 'Bookmarks',
    'Cloud Sync', 'Security', 'Appearance', 'Language',
  ];

  void _insertAtTop() {
    final idx = 0;
    final item = _ListItem(
      id: _nextId++,
      color: _palette[_items.length % _palette.length],
      icon: _icons[_items.length % _icons.length],
      label: _labels[_items.length % _labels.length],
    );
    _items.insert(idx, item);
    _listKey.currentState!.insertItem(idx, duration: const Duration(milliseconds: 400));
  }

  void _insertAtBottom() {
    final idx = _items.length;
    final item = _ListItem(
      id: _nextId++,
      color: _palette[idx % _palette.length],
      icon: _icons[idx % _icons.length],
      label: _labels[idx % _labels.length],
    );
    _items.insert(idx, item);
    _listKey.currentState!.insertItem(idx, duration: const Duration(milliseconds: 400));
  }

  void _removeItem(int index) {
    if (_items.isEmpty || index >= _items.length) return;
    final removedItem = _items[index];
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildAnimatedRow(removedItem, animation, index),
      duration: const Duration(milliseconds: 350),
    );
    _items.removeAt(index);
  }

  Widget _buildAnimatedRow(_ListItem item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeOut)),
          ),
          child: _buildRow(item, index),
        ),
      ),
    );
  }

  Widget _buildRow(_ListItem item, int index) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: item.color.withValues(alpha: 0.3)),
          gradient: LinearGradient(
            colors: [
              item.color.withValues(alpha: 0.12),
              item.color.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: item.color.withValues(alpha: 0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(item.icon, color: Colors.white, size: 22),
          ),
          title: Text(
            item.label,
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Item #${item.id}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: () => _removeItem(index),
            color: theme.colorScheme.error,
          ),
        ),
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
              onPressed: _insertAtTop,
              icon: const Icon(Icons.vertical_align_top_rounded, size: 18),
              label: const Text('Insert Top'),
            ),
            FilledButton.tonalIcon(
              onPressed: _insertAtBottom,
              icon: const Icon(Icons.vertical_align_bottom_rounded, size: 18),
              label: const Text('Insert Bottom'),
            ),
            OutlinedButton.icon(
              onPressed: _items.isEmpty ? null : () => _removeItem(0),
              icon: const Icon(Icons.remove_circle_outline_rounded, size: 18),
              label: const Text('Remove First'),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Count badge
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

        // AnimatedList
        SizedBox(
          height: 320,
          child: _items.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.list_rounded, size: 48, color: theme.disabledColor),
                      const SizedBox(height: 8),
                      Text('List is empty. Tap Insert!',
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.disabledColor)),
                    ],
                  ),
                )
              : AnimatedList(
                  key: _listKey,
                  initialItemCount: _items.length,
                  itemBuilder: (context, index, animation) {
                    return _buildAnimatedRow(_items[index], animation, index);
                  },
                ),
        ),
      ],
    );
  }
}

class _ListItem {
  final int id;
  final Color color;
  final IconData icon;
  final String label;
  _ListItem({required this.id, required this.color, required this.icon, required this.label});
}
