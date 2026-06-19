import 'package:flutter/material.dart';

class AlwaysScrollableScrollPhysicsDemo extends StatefulWidget {
  const AlwaysScrollableScrollPhysicsDemo({super.key});

  @override
  State<AlwaysScrollableScrollPhysicsDemo> createState() =>
      _AlwaysScrollableScrollPhysicsDemoState();
}

class _AlwaysScrollableScrollPhysicsDemoState
    extends State<AlwaysScrollableScrollPhysicsDemo> {
  ScrollPhysics _selectedPhysics = const AlwaysScrollableScrollPhysics();
  int _itemCount = 2; // Keep it short so it fits within the viewport
  String _statusLog = 'Ready. Try dragging down to refresh.';

  final Map<String, ScrollPhysics> _physicsOptions = {
    'AlwaysScrollableScrollPhysics': const AlwaysScrollableScrollPhysics(),
    'NeverScrollableScrollPhysics': const NeverScrollableScrollPhysics(),
    'ClampingScrollPhysics (Clamps short lists)': const ClampingScrollPhysics(),
  };

  Future<void> _handleRefresh() async {
    setState(() {
      _statusLog = 'Refreshing data... ⏳';
    });
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _statusLog = 'Refresh completed successfully! ✅';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Physics selector
        InputDecorator(
          decoration: const InputDecoration(
            labelText: 'Scroll Physics',
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            border: OutlineInputBorder(),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ScrollPhysics>(
              value: _selectedPhysics,
              isDense: true,
              items: _physicsOptions.entries.map((entry) {
                return DropdownMenuItem(
                  value: entry.value,
                  child: Text(entry.key, style: const TextStyle(fontSize: 13)),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _selectedPhysics = val;
                    _statusLog = 'Physics updated. Try dragging the list.';
                  });
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Controls to add/remove items
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Items: $_itemCount (fits viewport: ${_itemCount <= 3 ? "Yes" : "No"})',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton.filledTonal(
                  onPressed: _itemCount > 1
                      ? () => setState(() => _itemCount--)
                      : null,
                  icon: const Icon(Icons.remove_rounded, size: 18),
                ),
                const SizedBox(width: 4),
                IconButton.filledTonal(
                  onPressed: () => setState(() => _itemCount++),
                  icon: const Icon(Icons.add_rounded, size: 18),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Status log display
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
          ),
          child: Text(
            _statusLog,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),

        // Scroll Canvas with RefreshIndicator
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: RefreshIndicator(
            onRefresh: _handleRefresh,
            child: ListView.builder(
              physics: _selectedPhysics,
              itemCount: _itemCount,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    radius: 12,
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    child: Text('${index + 1}', style: TextStyle(fontSize: 10, color: theme.colorScheme.onSecondaryContainer)),
                  ),
                  title: Text('List Item #${index + 1}'),
                  subtitle: const Text('Drag down to test refresh trigger'),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Android/Web default clamps short lists. Use AlwaysScrollableScrollPhysics to make sure refresh works even with 1 item.',
          style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.outline, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
