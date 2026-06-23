import 'package:flutter/material.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({super.key});

  @override
  State<ImageDemo> createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  final TextEditingController _urlController = TextEditingController(
    text: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=600&auto=format&fit=crop',
  );
  
  BoxFit _selectedFit = BoxFit.cover;
  double _opacity = 1.0;

  final Map<String, String> _presets = {
    'Abstract Landscape': 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=600&auto=format&fit=crop',
    'Flutter Owl': 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    'Broken Image Link': 'https://invalid-url-that-does-not-exist.jpg',
  };

  final Map<String, BoxFit> _fits = {
    'Cover': BoxFit.cover,
    'Contain': BoxFit.contain,
    'Fill': BoxFit.fill,
    'Fit Width': BoxFit.fitWidth,
    'Fit Height': BoxFit.fitHeight,
    'Scale Down': BoxFit.scaleDown,
    'None': BoxFit.none,
  };

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
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
                  'Image Sandbox Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Presets Buttons
                const Text(
                  'Presets:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _presets.entries.map((entry) {
                    final isSelected = _urlController.text == entry.value;
                    return ChoiceChip(
                      label: Text(entry.key),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _urlController.text = entry.value;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // URL Input Field
                TextField(
                  controller: _urlController,
                  decoration: InputDecoration(
                    labelText: 'Custom Image URL',
                    labelStyle: const TextStyle(fontSize: 13),
                    border: const OutlineInputBorder(),
                    suffixIcon: _urlController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _urlController.clear();
                              });
                            },
                          )
                        : null,
                  ),
                  style: const TextStyle(fontSize: 12),
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),

                // BoxFit Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('BoxFit: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<BoxFit>(
                      value: _selectedFit,
                      onChanged: (BoxFit? val) {
                        if (val != null) {
                          setState(() => _selectedFit = val);
                        }
                      },
                      items: _fits.entries.map((entry) {
                        return DropdownMenuItem<BoxFit>(
                          value: entry.value,
                          child: Text(entry.key),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                
                // Opacity Slider
                Row(
                  children: [
                    const Text('Opacity: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${(_opacity * 100).toStringAsFixed(0)}%'),
                    Expanded(
                      child: Slider(
                        value: _opacity,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (val) => setState(() => _opacity = val),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 220,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.hardEdge,
          child: _urlController.text.isEmpty
              ? const Center(
                  child: Text(
                    'Please enter or select an image URL',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              : Image.network(
                  _urlController.text,
                  fit: _selectedFit,
                  opacity: AlwaysStoppedAnimation(_opacity),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    final totalBytes = loadingProgress.expectedTotalBytes;
                    final loadedBytes = loadingProgress.cumulativeBytesLoaded;
                    final progressValue = totalBytes != null ? loadedBytes / totalBytes : null;
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(value: progressValue),
                          const SizedBox(height: 8),
                          Text(
                            progressValue != null
                                ? 'Loading... ${(progressValue * 100).toStringAsFixed(0)}%'
                                : 'Loading...',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: theme.colorScheme.errorContainer.withValues(alpha: 0.4),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image, size: 48, color: theme.colorScheme.error),
                          const SizedBox(height: 8),
                          Text(
                            'Failed to load image',
                            style: TextStyle(
                              color: theme.colorScheme.onErrorContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            error.toString().split('\n').first,
                            style: TextStyle(
                              color: theme.colorScheme.onErrorContainer.withValues(alpha: 0.7),
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
