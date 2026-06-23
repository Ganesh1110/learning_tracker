import 'package:flutter/material.dart';

class DefaultWidgetsLocalizationsDemo extends StatefulWidget {
  const DefaultWidgetsLocalizationsDemo({super.key});

  @override
  State<DefaultWidgetsLocalizationsDemo> createState() =>
      _DefaultWidgetsLocalizationsDemoState();
}

class _DefaultWidgetsLocalizationsDemoState
    extends State<DefaultWidgetsLocalizationsDemo> {
  Locale _selectedLocale = const Locale('en', 'US');
  final List<String> _logs = [];

  void _addLog(String msg) {
    final time = DateTime.now().toLocal().toString().split(' ').last.substring(0, 8);
    setState(() {
      _logs.insert(0, '[$time] $msg');
      if (_logs.length > 5) _logs.removeLast();
    });
  }

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
                  'Localization Options',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SegmentedButton<Locale>(
                  segments: const [
                    ButtonSegment(
                      value: Locale('en', 'US'),
                      label: Text('English (LTR)'),
                      icon: Icon(Icons.language),
                    ),
                    ButtonSegment(
                      value: Locale('ar', 'AE'),
                      label: Text('Arabic (RTL)'),
                      icon: Icon(Icons.translate),
                    ),
                  ],
                  selected: {_selectedLocale},
                  onSelectionChanged: (Set<Locale> newSelection) {
                    final newLocale = newSelection.first;
                    setState(() {
                      _selectedLocale = newLocale;
                    });
                    _addLog('Switched locale to: ${newLocale.languageCode}');
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Localized Subtree Output:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Scoped localizations widget
        Localizations(
          locale: _selectedLocale,
          delegates: const [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          child: Builder(
            builder: (localizedContext) {
              final widgetsLocalizations = WidgetsLocalizations.of(localizedContext);
              final textDirection = widgetsLocalizations.textDirection;

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                ),
                child: Directionality(
                  textDirection: textDirection,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resolved Direction: $textDirection',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.info_outline),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _selectedLocale.languageCode == 'ar'
                                  ? 'هذا النص يتم عرضه بالاتجاه من اليمين إلى اليسار.'
                                  : 'This text is rendered in Left-To-Right direction.',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Context Log:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 120,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: _logs.isEmpty
              ? const Center(
                  child: Text(
                    'No logs yet. Switch locales to see context outputs.',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              : ListView.builder(
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        _logs[index],
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
