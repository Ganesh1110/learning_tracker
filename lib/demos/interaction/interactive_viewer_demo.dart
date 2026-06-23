import 'package:flutter/material.dart';

class InteractiveViewerDemo extends StatefulWidget {
  const InteractiveViewerDemo({super.key});

  @override
  State<InteractiveViewerDemo> createState() => _InteractiveViewerDemoState();
}

class _InteractiveViewerDemoState extends State<InteractiveViewerDemo> with SingleTickerProviderStateMixin {
  late TransformationController _transformationController;
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;

  bool _panEnabled = true;
  bool _scaleEnabled = true;
  double _minScale = 0.5;
  double _maxScale = 3.0;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        _transformationController.value = _animation!.value;
      });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _resetView() {
    _animation = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    ));
    _animationController.forward(from: 0.0);
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
                  'InteractiveViewer Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Toggle Pan & Scale
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: const Text('Pan Enabled', style: TextStyle(fontSize: 13)),
                        value: _panEnabled,
                        onChanged: (val) => setState(() => _panEnabled = val ?? true),
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: const Text('Scale Enabled', style: TextStyle(fontSize: 13)),
                        value: _scaleEnabled,
                        onChanged: (val) => setState(() => _scaleEnabled = val ?? true),
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Min Scale Slider
                Row(
                  children: [
                    const SizedBox(
                      width: 85,
                      child: Text('Min Scale: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Text('${_minScale.toStringAsFixed(1)}x'),
                    Expanded(
                      child: Slider(
                        value: _minScale,
                        min: 0.1,
                        max: 1.0,
                        divisions: 9,
                        onChanged: (val) => setState(() => _minScale = val),
                      ),
                    ),
                  ],
                ),

                // Max Scale Slider
                Row(
                  children: [
                    const SizedBox(
                      width: 85,
                      child: Text('Max Scale: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Text('${_maxScale.toStringAsFixed(1)}x'),
                    Expanded(
                      child: Slider(
                        value: _maxScale,
                        min: 1.0,
                        max: 5.0,
                        divisions: 8,
                        onChanged: (val) => setState(() => _maxScale = val),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Reset Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _resetView,
                    icon: const Icon(Icons.zoom_out_map),
                    label: const Text('Reset Scale & Pan'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Pinch to Zoom, Drag to Pan):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.hardEdge,
          child: InteractiveViewer(
            transformationController: _transformationController,
            panEnabled: _panEnabled,
            scaleEnabled: _scaleEnabled,
            minScale: _minScale,
            maxScale: _maxScale,
            boundaryMargin: const EdgeInsets.all(120),
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.1),
                border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3), width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    color: theme.colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.layers,
                            size: 18,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Item $index',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
