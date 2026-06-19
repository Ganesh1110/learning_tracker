import 'package:flutter/material.dart';

class BannerDemo extends StatefulWidget {
  const BannerDemo({super.key});

  @override
  State<BannerDemo> createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> {
  String _message = 'SALE';
  BannerLocation _location = BannerLocation.topEnd;
  Color _bannerColor = Colors.red;
  bool _showBanner = true;

  final Map<String, BannerLocation> _locations = {
    'Top End (Right)': BannerLocation.topEnd,
    'Top Start (Left)': BannerLocation.topStart,
    'Bottom End (Right)': BannerLocation.bottomEnd,
    'Bottom Start (Left)': BannerLocation.bottomStart,
  };

  final Map<String, Color> _colors = {
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Orange': Colors.orange,
    'Purple': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Panel
        Text(
          'Banner Badge Controls',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Message input field
            SizedBox(
              width: 140,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Banner Text',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                controller: TextEditingController(text: _message)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: _message.length),
                  ),
                onChanged: (val) {
                  setState(() {
                    _message = val.toUpperCase();
                  });
                },
              ),
            ),

            // Location Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Location: '),
                const SizedBox(width: 4),
                DropdownButton<BannerLocation>(
                  value: _location,
                  onChanged: (loc) {
                    if (loc != null) {
                      setState(() => _location = loc);
                    }
                  },
                  items: _locations.entries.map((e) {
                    return DropdownMenuItem(
                      value: e.value,
                      child: Text(e.key),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Color Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Color: '),
                const SizedBox(width: 4),
                DropdownButton<Color>(
                  value: _bannerColor,
                  onChanged: (color) {
                    if (color != null) {
                      setState(() => _bannerColor = color);
                    }
                  },
                  items: _colors.entries.map((e) {
                    return DropdownMenuItem(
                      value: e.value,
                      child: Text(e.key),
                    );
                  }).toList(),
                ),
              ],
            ),

            // Toggle show/hide
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _showBanner,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _showBanner = val);
                    }
                  },
                ),
                const Text('Show Banner'),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Product Card Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: _showBanner
              ? Banner(
                  message: _message.isEmpty ? 'TAG' : _message,
                  location: _location,
                  color: _bannerColor,
                  child: _buildProductCard(theme),
                )
              : _buildProductCard(theme),
        ),
      ],
    );
  }

  Widget _buildProductCard(ThemeData theme) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 190,
        height: 210,
        color: theme.colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thumbnail Area
            Expanded(
              flex: 5,
              child: Container(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                child: Center(
                  child: Icon(
                    Icons.directions_run_rounded,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),

            // Card details
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Pulse Runner 3.0',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Responsive mesh athletic shoe',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$120.00',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        const Icon(
                          Icons.add_shopping_cart,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
