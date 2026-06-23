import 'package:flutter/material.dart';

class SafeAreaDemo extends StatefulWidget {
  const SafeAreaDemo({super.key});

  @override
  State<SafeAreaDemo> createState() => _SafeAreaDemoState();
}

class _SafeAreaDemoState extends State<SafeAreaDemo> {
  bool _useSafeArea = true;
  bool _left = true;
  bool _top = true;
  bool _right = true;
  bool _bottom = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Inner content inside our simulated viewport
    Widget content = Container(
      color: Colors.amber.shade100,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Content at the top edge (notch area)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(4),
              color: Colors.red.withOpacity(0.2),
              child: const Text(
                'Top Content (Under Notch)',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Content at the bottom edge (pill area)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(4),
              color: Colors.blue.withOpacity(0.2),
              child: const Text(
                'Bottom Content (Under Pill)',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Simulated App Body',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );

    // Apply safe area or not
    Widget viewportContent = _useSafeArea
        ? SafeArea(
            left: _left,
            top: _top,
            right: _right,
            bottom: _bottom,
            child: content,
          )
        : content;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SafeArea inserts padding to avoid system intrusions like phone notches, '
          'status bars, and navigation bottom bars.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Simulated Mobile Device
        Center(
          child: Container(
            height: 160,
            width: 260,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade800, width: 4),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                // Real app viewport
                Positioned.fill(child: viewportContent),

                // Top Notch overlay
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 16,
                    width: 90,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                    ),
                  ),
                ),

                // Bottom home indicator bar overlay
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    height: 4,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Center(
            child: Text(
              _useSafeArea
                  ? '⬆ SafeArea: Content is pushed inside safe boundaries.'
                  : '⬆ Danger: Content is covered by the top notch and bottom pill.',
              style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic, fontSize: 11),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Switch(
                  value: _useSafeArea,
                  onChanged: (v) => setState(() => _useSafeArea = v),
                ),
                const SizedBox(width: 4),
                Text('Enable SafeArea', style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),

        if (_useSafeArea) ...[
          const SizedBox(height: 8),
          Text('Safe Anchors:', style: theme.textTheme.labelMedium),
          Row(
            children: [
              _CheckboxLabel(
                label: 'Top',
                value: _top,
                onChanged: (v) => setState(() => _top = v),
              ),
              _CheckboxLabel(
                label: 'Bottom',
                value: _bottom,
                onChanged: (v) => setState(() => _bottom = v),
              ),
              _CheckboxLabel(
                label: 'Left',
                value: _left,
                onChanged: (v) => setState(() => _left = v),
              ),
              _CheckboxLabel(
                label: 'Right',
                value: _right,
                onChanged: (v) => setState(() => _right = v),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _CheckboxLabel extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _CheckboxLabel({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: (v) => onChanged(v ?? false),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 8),
      ],
    );
  }
}
