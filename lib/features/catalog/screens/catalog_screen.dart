import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_tracker/core/registry/widget_registry.dart';
import 'package:learning_tracker/shared/widgets/widget_card.dart';

import 'package:learning_tracker/core/models/widget_category.dart';
import 'package:learning_tracker/core/models/widget_info.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  WidgetCategory? _selectedCategory;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<WidgetInfo> get _filteredWidgets {
    return widgetRegistry.where((widget) {
      final matchesCategory = _selectedCategory == null || widget.category == _selectedCategory;
      final matchesSearch = widget.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          widget.description.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          widget.rnEquivalent.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = _filteredWidgets;
    final isDark = theme.brightness == Brightness.dark;

    // Compute progress stats dynamically
    final totalRegistered = widgetRegistry.length;
    const totalAPI = 937;
    final percentage = (totalRegistered / totalAPI * 100).toStringAsFixed(1);

    // Responsive grid layout calculation
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 1200
        ? 4
        : screenWidth > 800
            ? 3
            : 2;
    final childAspectRatio = screenWidth > 800 ? 1.25 : 1.15;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.widgets_rounded, color: theme.colorScheme.primary, size: 22),
            const SizedBox(width: 8),
            Text(
              'Flutter Widgets for RN Devs',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'About',
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Flutter Widgets for RN Devs',
                applicationVersion: '1.0.0',
                applicationLegalese: 'A learning resource for React Native developers.',
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Stats badge Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Widgets Catalog',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.8,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.primary.withOpacity(0.15),
                        ),
                      ),
                      child: Text(
                        '$totalRegistered / $totalAPI Covered ($percentage%)',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Search widget names or concepts to see interactive demos and styling code.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Pill Search Field
                TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search by widget name, category, or RN equivalent...',
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
                    ),
                    prefixIcon: Icon(Icons.search_rounded, color: theme.colorScheme.primary),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: isDark
                        ? theme.colorScheme.surfaceContainerHigh
                        : Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary.withOpacity(0.4),
                        width: 1.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
          
          // Horizontal Category List
          SizedBox(
            height: 42,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: WidgetCategory.values.length + 1,
              itemBuilder: (context, index) {
                final isAll = index == 0;
                final category = isAll ? null : WidgetCategory.values[index - 1];
                final isSelected = _selectedCategory == category;
                final label = isAll ? 'All' : category!.displayName;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(label),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = selected ? category : null;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: BorderSide(
                      color: isSelected
                          ? Colors.transparent
                          : (isDark
                              ? Colors.white12
                              : theme.colorScheme.primary.withOpacity(0.08)),
                    ),
                    backgroundColor: isDark
                        ? theme.colorScheme.surfaceContainer
                        : Colors.white,
                    selectedColor: theme.colorScheme.primary.withOpacity(0.12),
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 13,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface,
                    ),
                    avatar: isAll
                        ? null
                        : Icon(
                            category!.icon,
                            size: 14,
                            color: isSelected
                                ? theme.colorScheme.primary
                                : category.color,
                          ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          
          // Responsive Grid of widgets
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off_rounded, size: 48, color: theme.disabledColor),
                        const SizedBox(height: 16),
                        Text(
                          'No matching widgets found',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.disabledColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final info = filtered[index];
                      return WidgetCard(
                        info: info,
                        onTap: () => context.push(
                          '/widget/${Uri.encodeComponent(info.name)}',
                          extra: info,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
