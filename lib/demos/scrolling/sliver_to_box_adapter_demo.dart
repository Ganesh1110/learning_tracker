import 'package:flutter/material.dart';

class SliverToBoxAdapterDemo extends StatefulWidget {
  const SliverToBoxAdapterDemo({super.key});

  @override
  State<SliverToBoxAdapterDemo> createState() => _SliverToBoxAdapterDemoState();
}

class _SliverToBoxAdapterDemoState extends State<SliverToBoxAdapterDemo> {
  String _activeWidgetType = 'header'; // 'header', 'carousel', 'banner'
  double _adapterHeight = 120.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Build the custom non-sliver box widget based on selection
    Widget boxWidget;
    switch (_activeWidgetType) {
      case 'carousel':
        boxWidget = SizedBox(
          height: _adapterHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.shadow.withOpacity(0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.dashboard, color: theme.colorScheme.onPrimary, size: 20),
                    Text(
                      'Feature Card ${index + 1}',
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
        break;
      case 'banner':
        boxWidget = Container(
          height: _adapterHeight,
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.tertiary.withOpacity(0.2)),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.discount, color: theme.colorScheme.onTertiaryContainer, size: 36),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Special Offer Active!',
                      style: TextStyle(
                        color: theme.colorScheme.onTertiaryContainer,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Use code FLUTTER50 for 50% off.',
                      style: TextStyle(
                        color: theme.colorScheme.onTertiaryContainer.withOpacity(0.8),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      case 'header':
      default:
        boxWidget = Container(
          height: _adapterHeight,
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: theme.colorScheme.secondaryContainer,
                child: Icon(Icons.person, color: theme.colorScheme.onSecondaryContainer, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alex Carter',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Flutter Developer • Portfolio Hub',
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'SliverToBoxAdapter bridges normal box widgets (non-slivers like Card or Row) '
          'so they can be placed directly inside a Sliver scroll container.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Controls Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Adapted Widget:', style: theme.textTheme.bodySmall),
            DropdownButton<String>(
              value: _activeWidgetType,
              items: const [
                DropdownMenuItem(value: 'header', child: Text('Profile Header (Container)')),
                DropdownMenuItem(value: 'carousel', child: Text('Horizontal List (ListView)')),
                DropdownMenuItem(value: 'banner', child: Text('Promo Banner (Row/DecoratedBox)')),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _activeWidgetType = val;
                    // Reset height bounds according to widget type
                    if (val == 'carousel') {
                      _adapterHeight = 140.0;
                    } else if (val == 'banner') {
                      _adapterHeight = 90.0;
                    } else {
                      _adapterHeight = 110.0;
                    }
                  });
                }
              },
            ),
          ],
        ),

        Row(
          children: [
            SizedBox(
              width: 120,
              child: Text('height: ${_adapterHeight.toInt()}px', style: theme.textTheme.bodySmall),
            ),
            Expanded(
              child: Slider(
                value: _adapterHeight,
                min: 70.0,
                max: 180.0,
                onChanged: (v) => setState(() => _adapterHeight = v),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Scroll Simulator Canvas
        Text(
          'CustomScrollView Canvas (Adapter highlighted in Green):',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant, width: 1.5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 80.0,
                  automaticallyImplyLeading: false,
                  backgroundColor: theme.colorScheme.surfaceContainer,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Sliver Feed Demo',
                      style: TextStyle(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    centerTitle: true,
                  ),
                ),

                // SliverToBoxAdapter wrapping the normal Box widget
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.withOpacity(0.5), width: 1.5),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    margin: const EdgeInsets.all(4),
                    child: boxWidget,
                  ),
                ),

                // Standard scroll content
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          color: theme.colorScheme.surfaceContainerLow,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: theme.colorScheme.outlineVariant),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.article_outlined, color: theme.colorScheme.primary),
                            title: Text('Standard List Item ${index + 1}'),
                            subtitle: const Text('Scrollable sliver content child'),
                          ),
                        );
                      },
                      childCount: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
