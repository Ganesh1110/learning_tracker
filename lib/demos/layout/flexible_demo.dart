import 'package:flutter/material.dart';

class FlexibleDemo extends StatefulWidget {
  const FlexibleDemo({super.key});

  @override
  State<FlexibleDemo> createState() => _FlexibleDemoState();
}

class _FlexibleDemoState extends State<FlexibleDemo> {
  FlexFit _flexFit = FlexFit.loose;
  double _contentWidth = 80.0;

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
                  'Flexible Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('FlexFit Mode: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<FlexFit>(
                      value: _flexFit,
                      onChanged: (FlexFit? val) {
                        if (val != null) {
                          setState(() => _flexFit = val);
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: FlexFit.loose,
                          child: Text('Loose (Child can be smaller)'),
                        ),
                        DropdownMenuItem(
                          value: FlexFit.tight,
                          child: Text('Tight (Equivalent to Expanded)'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Content Width: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_contentWidth.toStringAsFixed(0)}px'),
                    Expanded(
                      child: Slider(
                        value: _contentWidth,
                        min: 40,
                        max: 200,
                        onChanged: (val) => setState(() => _contentWidth = val),
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
          'Visual Output (Row Layout):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                ),
                child: Row(
                  children: [
                    // Box 1 (Fixed)
                    Container(
                      width: 60,
                      color: Colors.red.withValues(alpha: 0.8),
                      alignment: Alignment.center,
                      child: const Text('Fixed\n60px', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                    // Box 2 (Flexible)
                    Flexible(
                      fit: _flexFit,
                      flex: 1,
                      child: Container(
                        width: _contentWidth,
                        color: Colors.blue.withValues(alpha: 0.8),
                        alignment: Alignment.center,
                        child: Text(
                          'Flexible Child\n(Width: ${_contentWidth.toStringAsFixed(0)}px)',
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Box 3 (Fixed spacer or expanded to highlight remaining space)
                    Expanded(
                      child: Container(
                        color: Colors.grey.withValues(alpha: 0.3),
                        alignment: Alignment.center,
                        child: const Text('Remaining\nSpace', style: TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _flexFit == FlexFit.loose
                    ? '* In Loose mode, the Blue box occupies only its requested width ($_contentWidth px). It leaves the rest of the flex allocation space empty.'
                    : '* In Tight mode, the Blue box is forced to fill all its flex allocation space, completely ignoring its own width configuration.',
                style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
