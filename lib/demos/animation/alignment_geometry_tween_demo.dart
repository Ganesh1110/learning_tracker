import 'package:flutter/material.dart';

class _NonNullableAlignmentGeometryTween extends Animatable<AlignmentGeometry> {
  final AlignmentGeometryTween tween;
  _NonNullableAlignmentGeometryTween(this.tween);

  @override
  AlignmentGeometry transform(double t) => tween.transform(t)!;
}

class AlignmentGeometryTweenDemo extends StatefulWidget {
  const AlignmentGeometryTweenDemo({super.key});

  @override
  State<AlignmentGeometryTweenDemo> createState() => _AlignmentGeometryTweenDemoState();
}

class _AlignmentGeometryTweenDemoState extends State<AlignmentGeometryTweenDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  AlignmentGeometry _begin = AlignmentDirectional.topStart;
  AlignmentGeometry _end = Alignment.bottomRight;
  TextDirection _textDirection = TextDirection.ltr;

  final Map<String, AlignmentGeometry> _alignments = {
    'Dir: topStart': AlignmentDirectional.topStart,
    'Dir: topEnd': AlignmentDirectional.topEnd,
    'Dir: bottomStart': AlignmentDirectional.bottomStart,
    'Dir: bottomEnd': AlignmentDirectional.bottomEnd,
    'Abs: topLeft': Alignment.topLeft,
    'Abs: topRight': Alignment.topRight,
    'Abs: center': Alignment.center,
    'Abs: bottomLeft': Alignment.bottomLeft,
    'Abs: bottomRight': Alignment.bottomRight,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // AlignmentGeometryTween interpolating between begin and end values using the helper
    final Animation<AlignmentGeometry> alignmentAnimation = _NonNullableAlignmentGeometryTween(
      AlignmentGeometryTween(begin: _begin, end: _end),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Direction and Selection Controls
        Row(
          children: [
            Expanded(
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Begin',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AlignmentGeometry>(
                    value: _begin,
                    isDense: true,
                    items: _alignments.entries.map((entry) {
                      return DropdownMenuItem(
                        value: entry.value,
                        child: Text(entry.key, style: const TextStyle(fontSize: 13)),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => _begin = val);
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'End',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AlignmentGeometry>(
                    value: _end,
                    isDense: true,
                    items: _alignments.entries.map((entry) {
                      return DropdownMenuItem(
                        value: entry.value,
                        child: Text(entry.key, style: const TextStyle(fontSize: 13)),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => _end = val);
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // TextDirection Toggle and Controller State Buttons
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Text Direction: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('LTR'),
                  selected: _textDirection == TextDirection.ltr,
                  onSelected: (val) {
                    if (val) setState(() => _textDirection = TextDirection.ltr);
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('RTL'),
                  selected: _textDirection == TextDirection.rtl,
                  onSelected: (val) {
                    if (val) setState(() => _textDirection = TextDirection.rtl);
                  },
                ),
              ],
            ),
            IconButton.filledTonal(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat(reverse: true);
                }
                setState(() {});
              },
              icon: Icon(_controller.isAnimating ? Icons.pause_rounded : Icons.play_arrow_rounded),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Canvas container wrapping the Directionality widget
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Directionality(
            textDirection: _textDirection,
            child: AnimatedBuilder(
              animation: alignmentAnimation,
              builder: (context, child) {
                return Align(
                  alignment: alignmentAnimation.value,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.secondary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(Icons.compare_arrows_rounded, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Notice how "Dir:" options swap sides when text direction is changed to RTL.',
          style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.outline, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
