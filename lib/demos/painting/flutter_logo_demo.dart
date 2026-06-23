import 'package:flutter/material.dart';

class FlutterLogoDemo extends StatefulWidget {
  const FlutterLogoDemo({super.key});

  @override
  State<FlutterLogoDemo> createState() => _FlutterLogoDemoState();
}

class _FlutterLogoDemoState extends State<FlutterLogoDemo> {
  double _logoSize = 100.0;
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

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
                  'FlutterLogo Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Logo Size: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_logoSize.toStringAsFixed(0)}px'),
                    Expanded(
                      child: Slider(
                        value: _logoSize,
                        min: 50,
                        max: 200,
                        onChanged: (val) => setState(() => _logoSize = val),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Logo Style: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<FlutterLogoStyle>(
                      value: _logoStyle,
                      onChanged: (FlutterLogoStyle? val) {
                        if (val != null) {
                          setState(() => _logoStyle = val);
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: FlutterLogoStyle.markOnly,
                          child: Text('Mark Only (Icon)'),
                        ),
                        DropdownMenuItem(
                          value: FlutterLogoStyle.horizontal,
                          child: Text('Horizontal (Mark + Text)'),
                        ),
                        DropdownMenuItem(
                          value: FlutterLogoStyle.stacked,
                          child: Text('Stacked (Mark over Text)'),
                        ),
                      ],
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
          height: 240,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16),
            child: FlutterLogo(
              size: _logoSize,
              style: _logoStyle,
              textColor: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
