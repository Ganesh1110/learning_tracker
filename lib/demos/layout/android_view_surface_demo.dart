import 'package:flutter/material.dart';

class AndroidViewSurfaceDemo extends StatefulWidget {
  const AndroidViewSurfaceDemo({super.key});

  @override
  State<AndroidViewSurfaceDemo> createState() => _AndroidViewSurfaceDemoState();
}

class _AndroidViewSurfaceDemoState extends State<AndroidViewSurfaceDemo> {
  final List<String> _consoleLogs = [];
  bool _isHybridMode = true;
  double _tiltAngle = 15.0; // Slider to rotate 3D view layers

  void _log(String msg) {
    setState(() {
      _consoleLogs.insert(0, '${DateTime.now().toIso8601String().substring(11, 19)} - $msg');
      if (_consoleLogs.length > 5) _consoleLogs.removeLast();
    });
  }

  @override
  void initState() {
    super.initState();
    _log('AndroidViewSurface created (Hybrid Composition initialized)');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Mode Selector Toggle
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('Composition Mode:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                ChoiceChip(
                  label: const Text('Hybrid Composition'),
                  selected: _isHybridMode,
                  onSelected: (val) {
                    if (val) {
                      setState(() => _isHybridMode = true);
                      _log('Switched to Hybrid Composition (AndroidViewSurface)');
                      _log('Attaching native view directly to Android ViewGroup');
                    }
                  },
                ),
                ChoiceChip(
                  label: const Text('Virtual Display'),
                  selected: !_isHybridMode,
                  onSelected: (val) {
                    if (val) {
                      setState(() => _isHybridMode = false);
                      _log('Switched to Virtual Display (AndroidView)');
                      _log('Rendering native view to offscreen GL texture');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Tilt controller for 3D layout simulation
        Row(
          children: [
            const Text('3D Layer Tilt:', style: TextStyle(fontSize: 12)),
            Expanded(
              child: Slider(
                value: _tiltAngle,
                min: 0.0,
                max: 45.0,
                divisions: 9,
                onChanged: (val) => setState(() => _tiltAngle = val),
              ),
            ),
            Text('${_tiltAngle.toInt()}°', style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
          ],
        ),
        const SizedBox(height: 12),

        // 3D Layer Visualizer Canvas
        Container(
          height: 200,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Center(
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateX(_tiltAngle * 3.14159 / 180)
                ..rotateY(-_tiltAngle * 0.5 * 3.14159 / 180),
              alignment: FractionalOffset.center,
              child: SizedBox(
                width: 260,
                height: 140,
                child: Stack(
                  children: [
                    // Layer 1: Flutter Background (Bottom layer)
                    _buildVisualLayer(
                      title: 'Flutter UI Background',
                      color: theme.colorScheme.primaryContainer,
                      borderColor: theme.colorScheme.primary,
                      offsetZ: -30.0,
                    ),

                    // Layer 2: Android Native View (Middle layer)
                    _buildVisualLayer(
                      title: _isHybridMode
                          ? 'Android Native View\n(Direct AndroidViewSurface)'
                          : 'Android Virtual Display Texture\n(Copied Pixel Map)',
                      color: _isHybridMode ? Colors.green.shade100 : Colors.blue.shade100,
                      borderColor: _isHybridMode ? Colors.green : Colors.blue,
                      offsetZ: 0.0,
                      isNative: true,
                    ),

                    // Layer 3: Flutter Overlay (Top layer)
                    _buildVisualLayer(
                      title: 'Flutter Floating UI\n(App Bar / Dialogs)',
                      color: theme.colorScheme.secondaryContainer,
                      borderColor: theme.colorScheme.secondary,
                      offsetZ: 30.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Event logs
        const Text('Pipe Diagnostics:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
            itemCount: _consoleLogs.length,
            itemBuilder: (context, index) {
              return Text(
                _consoleLogs[index],
                style: const TextStyle(color: Colors.greenAccent, fontSize: 10, fontFamily: 'monospace'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVisualLayer({
    required String title,
    required Color color,
    required Color borderColor,
    required double offsetZ,
    bool isNative = false,
  }) {
    return Transform(
      transform: Matrix4.translationValues(0.0, -offsetZ * 0.5, 0.0),
      child: Opacity(
        opacity: 0.85,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isNative)
                  const Icon(Icons.android, size: 16, color: Colors.green)
                else
                  const Icon(Icons.flutter_dash, size: 16, color: Colors.blue),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withValues(alpha: 0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
