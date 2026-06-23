import 'package:flutter/material.dart';

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({super.key});

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  final List<String> _items = List.generate(5, (index) => 'Notification item #${index + 1}');
  DismissDirection _selectedDirection = DismissDirection.horizontal;

  void _resetItems() {
    setState(() {
      _items.clear();
      _items.addAll(List.generate(5, (index) => 'Notification item #${index + 1}'));
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Items list reset')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 0,
          color: theme.colorScheme.surfaceContainerLow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dismissible Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Swipe Direction: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<DismissDirection>(
                      value: _selectedDirection,
                      onChanged: (DismissDirection? val) {
                        if (val != null) {
                          setState(() => _selectedDirection = val);
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: DismissDirection.horizontal,
                          child: Text('Horizontal (Both)'),
                        ),
                        DropdownMenuItem(
                          value: DismissDirection.endToStart,
                          child: Text('EndToStart (Left Only)'),
                        ),
                        DropdownMenuItem(
                          value: DismissDirection.vertical,
                          child: Text('Vertical'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _resetItems,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset Items List'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Swipe items left/right):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 320,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: _items.isEmpty
              ? const Center(
                  child: Text(
                    'All items dismissed. Click reset above!',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Dismissible(
                      key: Key(item),
                      direction: _selectedDirection,
                      onDismissed: (direction) {
                        setState(() {
                          _items.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              direction == DismissDirection.endToStart ||
                                      direction == DismissDirection.horizontal && index % 2 == 1
                                  ? 'Deleted "$item"'
                                  : 'Archived "$item"',
                            ),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                setState(() {
                                  _items.insert(index, item);
                                });
                              },
                            ),
                          ),
                        );
                      },
                      // Archive background
                      background: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Icon(Icons.archive, color: Colors.white),
                      ),
                      // Delete background
                      secondaryBackground: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: theme.colorScheme.outlineVariant),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.notifications_active_outlined,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          title: Text(item),
                          subtitle: const Text('Swipe left to delete, right to archive'),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
