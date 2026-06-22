import 'package:flutter/material.dart';

// Concrete subclass of ConstrainedLayoutBuilder via LayoutBuilder
class LoggingLayoutBuilder extends LayoutBuilder {
  LoggingLayoutBuilder({
    super.key,
    required Widget Function(BuildContext, BoxConstraints) builder,
    required ValueChanged<BoxConstraints> onLayout,
  }) : super(
          builder: (context, constraints) {
            // We defer the callback notification to post-frame to avoid setState during build exceptions
            WidgetsBinding.instance.addPostFrameCallback((_) {
              onLayout(constraints);
            });
            return builder(context, constraints);
          },
        );
}

class ConstrainedLayoutBuilderDemo extends StatefulWidget {
  const ConstrainedLayoutBuilderDemo({super.key});

  @override
  State<ConstrainedLayoutBuilderDemo> createState() => _ConstrainedLayoutBuilderDemoState();
}

class _ConstrainedLayoutBuilderDemoState extends State<ConstrainedLayoutBuilderDemo> {
  double _parentWidth = 240.0;
  double _parentHeight = 160.0;
  BoxConstraints? _capturedConstraints;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Parent Bounding size (Constraints Simulator)',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Parent Width Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Parent Width: '),
                SizedBox(
                  width: 120,
                  child: Slider(
                    value: _parentWidth,
                    min: 100.0,
                    max: 300.0,
                    onChanged: (val) => setState(() => _parentWidth = val),
                  ),
                ),
                Text('${_parentWidth.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Parent Height Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Parent Height: '),
                SizedBox(
                  width: 120,
                  child: Slider(
                    value: _parentHeight,
                    min: 80.0,
                    max: 220.0,
                    onChanged: (val) => setState(() => _parentHeight = val),
                  ),
                ),
                Text('${_parentHeight.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'LoggingLayoutBuilder extends LayoutBuilder (which subclasses ConstrainedLayoutBuilder) to intercept and report active box constraints during the layout phase.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bounded Simulated Parent
              Container(
                width: _parentWidth,
                height: _parentHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.primary),
                  color: theme.colorScheme.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: LoggingLayoutBuilder(
                  onLayout: (constraints) {
                    if (_capturedConstraints != constraints) {
                      setState(() => _capturedConstraints = constraints);
                    }
                  },
                  builder: (context, constraints) {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Builder Callback\nTriggered!',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Constraints Console Logger
              Container(
                width: 320,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.terminal, size: 16, color: Colors.blueGrey),
                    const SizedBox(width: 8),
                    Text(
                      _capturedConstraints != null
                          ? 'Constraints: min(${_capturedConstraints!.minWidth.toStringAsFixed(0)}x${_capturedConstraints!.minHeight.toStringAsFixed(0)}) max(${_capturedConstraints!.maxWidth.toStringAsFixed(0)}x${_capturedConstraints!.maxHeight.toStringAsFixed(0)})'
                          : 'Waiting for layout pass...',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
