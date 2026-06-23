import 'package:flutter/material.dart';

class ShaderMaskDemo extends StatefulWidget {
  const ShaderMaskDemo({super.key});

  @override
  State<ShaderMaskDemo> createState() => _ShaderMaskDemoState();
}

class _ShaderMaskDemoState extends State<ShaderMaskDemo> {
  int _targetIndex = 0; // 0 = Text, 1 = Icon, 2 = Color Box
  int _gradientIndex = 0; // 0 = Linear, 1 = Radial, 2 = Sweep
  BlendMode _blendMode = BlendMode.srcIn;

  final List<String> _targets = ['Text', 'Icon', 'Color Box'];
  final List<String> _gradients = ['Linear', 'Radial', 'Sweep'];

  Shader _createShader(Rect bounds) {
    final colors = [Colors.purple, Colors.orange, Colors.redAccent];
    final stops = [0.0, 0.5, 1.0];

    switch (_gradientIndex) {
      case 1:
        return RadialGradient(
          center: Alignment.center,
          radius: 0.5,
          colors: colors,
          stops: stops,
        ).createShader(bounds);
      case 2:
        return SweepGradient(
          center: Alignment.center,
          colors: colors,
          stops: stops,
        ).createShader(bounds);
      default:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
          stops: stops,
        ).createShader(bounds);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Target child widget
    Widget maskChild;
    switch (_targetIndex) {
      case 1:
        maskChild = const Icon(
          Icons.star_rounded,
          size: 100,
          color: Colors.white,
        );
        break;
      case 2:
        maskChild = Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        );
        break;
      default:
        maskChild = const Text(
          'Shader Mask',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        );
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ShaderMask applies a shader (like gradients or bitmap patterns) '
          'to its child using alpha-compositing blend operations.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),

        // Live preview area
        Center(
          child: Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            alignment: Alignment.center,
            child: ShaderMask(
              shaderCallback: _createShader,
              blendMode: _blendMode,
              child: maskChild,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Target Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Target Element:', style: theme.textTheme.bodySmall),
            SegmentedButton<int>(
              segments: List.generate(_targets.length, (index) {
                return ButtonSegment(value: index, label: Text(_targets[index]));
              }),
              selected: {_targetIndex},
              onSelectionChanged: (val) {
                setState(() => _targetIndex = val.first);
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Gradient Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shader Gradient:', style: theme.textTheme.bodySmall),
            SegmentedButton<int>(
              segments: List.generate(_gradients.length, (index) {
                return ButtonSegment(value: index, label: Text(_gradients[index]));
              }),
              selected: {_gradientIndex},
              onSelectionChanged: (val) {
                setState(() => _gradientIndex = val.first);
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        // BlendMode Dropdown
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Compositing BlendMode:', style: theme.textTheme.bodySmall),
            DropdownButton<BlendMode>(
              value: _blendMode,
              items: const [
                DropdownMenuItem(value: BlendMode.srcIn, child: Text('srcIn (Solid Fill)')),
                DropdownMenuItem(value: BlendMode.srcATop, child: Text('srcATop')),
                DropdownMenuItem(value: BlendMode.modulate, child: Text('modulate')),
                DropdownMenuItem(value: BlendMode.difference, child: Text('difference')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _blendMode = val);
              },
            ),
          ],
        ),
      ],
    );
  }
}
