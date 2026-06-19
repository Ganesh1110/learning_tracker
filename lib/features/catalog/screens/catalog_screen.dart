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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets for RN Devs'),
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
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Reference Catalog',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Search widgets and tap to see live demos & React Native equivalents.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 16),
                // Search Field
                TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  decoration: InputDecoration(
                    hintText: 'Search widget name, description...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  ),
                ),
              ],
            ),
          ),
          // Horizontal Category List
          SizedBox(
            height: 40,
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
                    avatar: isAll
                        ? null
                        : Icon(
                            category!.icon,
                            size: 16,
                            color: isSelected
                                ? theme.colorScheme.onPrimary
                                : category.color,
                          ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Grid of widgets
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.1,
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
