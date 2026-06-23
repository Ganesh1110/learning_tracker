import 'package:flutter/material.dart';

class OffstageDemo extends StatefulWidget {
  const OffstageDemo({super.key});

  @override
  State<OffstageDemo> createState() => _OffstageDemoState();
}

class _OffstageDemoState extends State<OffstageDemo> {
  bool _isOffstage = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Offstage keeps its child in the widget tree (and running '
          'animations / state) but hides it visually and makes it '
          'non-interactive when offstage = true.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 20),

        // ── Offstage target ────────────────────────────────────────────
        Stack(
          alignment: Alignment.center,
          children: [
            // Placeholder shown when offstage
            AnimatedOpacity(
              opacity: _isOffstage ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: theme.colorScheme.outlineVariant,
                      style: BorderStyle.solid),
                ),
                child: Center(
                  child: Text(
                    'Widget is offstage  (invisible but still in the tree)',
                    style: TextStyle(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),

            // Actual Offstage widget
            Offstage(
              offstage: _isOffstage,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.indigo],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.visibility, color: Colors.white, size: 28),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'I am visible! (still in the tree when hidden)',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // ── Toggle ────────────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('offstage = true'),
            Switch(
              value: !_isOffstage,
              onChanged: (v) => setState(() => _isOffstage = !v),
            ),
            const Text('offstage = false'),
          ],
        ),
        const SizedBox(height: 8),
        FilledButton.icon(
          icon: Icon(
              _isOffstage ? Icons.visibility : Icons.visibility_off),
          label: Text(_isOffstage
              ? 'Make Visible  (offstage → false)'
              : 'Hide Widget  (offstage → true)'),
          onPressed: () =>
              setState(() => _isOffstage = !_isOffstage),
        ),
      ],
    );
  }
}
