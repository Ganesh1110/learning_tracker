import 'package:flutter/material.dart';

class SpacerDemo extends StatefulWidget {
  const SpacerDemo({super.key});

  @override
  State<SpacerDemo> createState() => _SpacerDemoState();
}

class _SpacerDemoState extends State<SpacerDemo> {
  bool _isRow = true;
  String _spacerConfig = 'middle'; // 'none', 'middle', 'edges', 'double'
  int _flex1 = 1;
  int _flex2 = 2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Box children helper
    Widget buildBox(String label, Color color) {
      return Container(
        width: _isRow ? 65 : double.infinity,
        height: _isRow ? double.infinity : 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      );
    }

    // Helper to build visual Spacer indicators
    Widget buildSpacerIndicator(int flex) {
      return Expanded(
        flex: flex,
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.primary.withOpacity(0.6),
              style: BorderStyle.solid,
              width: 1.5,
            ),
            color: theme.colorScheme.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isRow ? Icons.compare_arrows : Icons.height,
                color: theme.colorScheme.primary,
                size: 16,
              ),
              Text(
                'Spacer\n(flex: $flex)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Assemble the children based on spacer configuration
    List<Widget> children = [];
    final boxA = buildBox('Item A', Colors.indigo);
    final boxB = buildBox('Item B', Colors.deepOrange);
    final boxC = buildBox('Item C', Colors.teal);

    switch (_spacerConfig) {
      case 'none':
        children = [boxA, boxB, boxC];
        break;
      case 'edges':
        children = [
          buildSpacerIndicator(1),
          boxA,
          boxB,
          boxC,
          buildSpacerIndicator(1),
        ];
        break;
      case 'double':
        children = [
          boxA,
          buildSpacerIndicator(_flex1),
          boxB,
          buildSpacerIndicator(_flex2),
          boxC,
        ];
        break;
      case 'middle':
      default:
        children = [
          boxA,
          buildSpacerIndicator(1),
          boxB,
          boxC,
        ];
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Spacer creates an adjustable empty space that expands to fill available '
          'room between widgets inside a Row or Column, using a flex factor.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Layout Direction:', style: theme.textTheme.bodySmall),
            ToggleButtons(
              isSelected: [_isRow, !_isRow],
              onPressed: (idx) {
                setState(() => _isRow = idx == 0);
              },
              borderRadius: BorderRadius.circular(8),
              constraints: const BoxConstraints(minWidth: 70, minHeight: 32),
              children: const [
                Text('Row'),
                Text('Column'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Spacer Placement:', style: theme.textTheme.bodySmall),
            DropdownButton<String>(
              value: _spacerConfig,
              items: const [
                DropdownMenuItem(value: 'none', child: Text('No Spacers (Packed)')),
                DropdownMenuItem(value: 'middle', child: Text('Single (A [Spacer] B C)')),
                DropdownMenuItem(value: 'edges', child: Text('Edges ([Spacer] A B C [Spacer])')),
                DropdownMenuItem(value: 'double', child: Text('Double (A [Flex1] B [Flex2] C)')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _spacerConfig = val);
              },
            ),
          ],
        ),

        // Dynamic flex sliders if double configuration is chosen
        if (_spacerConfig == 'double') ...[
          const SizedBox(height: 12),
          Row(
            children: [
              SizedBox(
                width: 110,
                child: Text('Spacer 1 Flex: $_flex1', style: theme.textTheme.bodySmall),
              ),
              Expanded(
                child: Slider(
                  value: _flex1.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  onChanged: (v) => setState(() => _flex1 = v.toInt()),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
                child: Text('Spacer 2 Flex: $_flex2', style: theme.textTheme.bodySmall),
              ),
              Expanded(
                child: Slider(
                  value: _flex2.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  onChanged: (v) => setState(() => _flex2 = v.toInt()),
                ),
              ),
            ],
          ),
        ],

        const SizedBox(height: 16),

        // Live Preview Canvas
        Text(
          'Preview Canvas:',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          padding: const EdgeInsets.all(12),
          child: _isRow
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
        ),
      ],
    );
  }
}
