import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  double _itemCount = 20.0;
  bool _useSeparated = false;
  bool _shrinkWrap = false;

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
                  'ListView Sandbox Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Sliders for item count
                Row(
                  children: [
                    const SizedBox(
                      width: 90,
                      child: Text('Item Count: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Text('${_itemCount.toInt()} items'),
                    Expanded(
                      child: Slider(
                        value: _itemCount,
                        min: 10.0,
                        max: 200.0,
                        divisions: 19,
                        onChanged: (val) => setState(() => _itemCount = val),
                      ),
                    ),
                  ],
                ),
                
                // Toggle Separators
                SwitchListTile(
                  title: const Text('Use Separators (ListView.separated)', style: TextStyle(fontSize: 13)),
                  subtitle: const Text('Add visual dividing lines between list items'),
                  value: _useSeparated,
                  onChanged: (val) => setState(() => _useSeparated = val),
                  contentPadding: EdgeInsets.zero,
                ),

                // Toggle shrinkWrap
                SwitchListTile(
                  title: const Text('ShrinkWrap List View', style: TextStyle(fontSize: 13)),
                  subtitle: const Text('Allow list size to wrap exactly to its content height'),
                  value: _shrinkWrap,
                  onChanged: (val) => setState(() => _shrinkWrap = val),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Scrollable List View):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          child: _useSeparated
              ? ListView.separated(
                  shrinkWrap: _shrinkWrap,
                  padding: const EdgeInsets.all(12),
                  itemCount: _itemCount.toInt(),
                  separatorBuilder: (context, index) => Divider(
                    height: 16,
                    thickness: 1,
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                  ),
                  itemBuilder: (context, index) => _buildListItem(index, theme),
                )
              : ListView.builder(
                  shrinkWrap: _shrinkWrap,
                  padding: const EdgeInsets.all(12),
                  itemCount: _itemCount.toInt(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: _buildListItem(index, theme),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildListItem(int index, ThemeData theme) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          child: Text('${index + 1}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        title: Text(
          'List Item Description #${index + 1}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        subtitle: const Text(
          'Lazy-loaded listing item details render dynamically.',
          style: TextStyle(fontSize: 11, color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      ),
    );
  }
}
