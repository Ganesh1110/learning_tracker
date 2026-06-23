import 'package:flutter/material.dart';

/// Second page shown when user taps "Navigator.push()"
class _SecondPage extends StatelessWidget {
  final String message;
  const _SecondPage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline,
                size: 56, color: Colors.green),
            const SizedBox(height: 16),
            Text(message,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go Back'),
              onPressed: () =>
                  Navigator.of(context).pop('Returned from 2nd page'),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorDemo extends StatefulWidget {
  const NavigatorDemo({super.key});

  @override
  State<NavigatorDemo> createState() => _NavigatorDemoState();
}

class _NavigatorDemoState extends State<NavigatorDemo> {
  String _result = 'No result yet — tap a button above';

  Future<void> _pushPage(BuildContext ctx, String msg) async {
    final result = await Navigator.of(ctx, rootNavigator: true).push<String>(
      MaterialPageRoute(builder: (_) => _SecondPage(message: msg)),
    );
    if (mounted) setState(() => _result = result ?? 'No value returned');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Navigator manages a stack of Route objects.\n'
          'push() adds a new screen; pop() removes it.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 20),

        FilledButton.icon(
          icon: const Icon(Icons.open_in_new),
          label: const Text('Navigator.push()'),
          onPressed: () => _pushPage(context, 'Pushed via Navigator.push()'),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          icon: const Icon(Icons.swap_horiz),
          label: const Text('Navigator.push() → pop with value'),
          onPressed: () => _pushPage(
              context, 'Pop this page to see the returned value below.'),
        ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withAlpha(80),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: theme.colorScheme.primary.withAlpha(60))),
          child: Row(
            children: [
              Icon(Icons.info_outline,
                  color: theme.colorScheme.primary, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Returned: $_result',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
