import 'package:flutter/material.dart';

class CenterDemo extends StatefulWidget {
  const CenterDemo({super.key});

  @override
  State<CenterDemo> createState() => _CenterDemoState();
}

class _CenterDemoState extends State<CenterDemo> {
  bool _useWidthFactor = false;
  bool _useHeightFactor = false;
  double _widthFactor = 1.8;
  double _heightFactor = 1.8;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Center Dimensions Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: _useWidthFactor,
              onChanged: (val) {
                if (val != null) {
                  setState(() => _useWidthFactor = val);
                }
              },
            ),
            const Text('Use widthFactor'),
            if (_useWidthFactor) ...[
              Expanded(
                child: Slider(
                  value: _widthFactor,
                  min: 1.0,
                  max: 3.0,
                  divisions: 10,
                  label: _widthFactor.toStringAsFixed(1),
                  onChanged: (val) => setState(() => _widthFactor = val),
                ),
              ),
              Text('${_widthFactor.toStringAsFixed(1)}x', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _useHeightFactor,
              onChanged: (val) {
                if (val != null) {
                  setState(() => _useHeightFactor = val);
                }
              },
            ),
            const Text('Use heightFactor'),
            if (_useHeightFactor) ...[
              Expanded(
                child: Slider(
                  value: _heightFactor,
                  min: 1.0,
                  max: 3.0,
                  divisions: 10,
                  label: _heightFactor.toStringAsFixed(1),
                  onChanged: (val) => setState(() => _heightFactor = val),
                ),
              ),
              Text('${_heightFactor.toStringAsFixed(1)}x', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 240,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bounding box representing parent constraints
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.4),
                    style: BorderStyle.solid,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: theme.colorScheme.primary.withValues(alpha: 0.05),
                ),
                child: _buildCenterWidget(theme),
              ),
              const SizedBox(height: 8),
              Text(
                _useWidthFactor || _useHeightFactor
                    ? 'Center constraints are determined by the specified dimension factor(s).'
                    : 'Center expands to fill the entire parent container bounds (default).',
                style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCenterWidget(ThemeData theme) {
    // Center centers its child within itself, and optionally sizes itself to child size * factors.
    final center = Center(
      widthFactor: _useWidthFactor ? _widthFactor : null,
      heightFactor: _useHeightFactor ? _heightFactor : null,
      child: Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: const Center(
          child: Text(
            'Child\n80x60',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );

    // To visually show the bounds of Center itself:
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green.withValues(alpha: 0.6),
          style: BorderStyle.solid,
          width: 1.5,
        ),
        color: Colors.green.withValues(alpha: 0.05),
      ),
      child: center,
    );
  }
}
