import 'package:flutter/material.dart';

class FormFieldDemo extends StatefulWidget {
  const FormFieldDemo({super.key});

  @override
  State<FormFieldDemo> createState() => _FormFieldDemoState();
}

class _FormFieldDemoState extends State<FormFieldDemo> {
  final _fieldKey = GlobalKey<FormFieldState<int>>();
  String _status = 'No validation run yet.';

  void _validateField() {
    if (_fieldKey.currentState!.validate()) {
      setState(() {
        _status = 'Success! Selection is valid: ${_fieldKey.currentState!.value} stars.';
      });
    } else {
      setState(() {
        _status = 'Validation failed! ${_fieldKey.currentState!.errorText}';
      });
    }
  }

  void _resetField() {
    _fieldKey.currentState!.reset();
    setState(() {
      _status = 'Field reset back to initial value.';
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
                  'FormField Controls',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: _validateField,
                      icon: const Icon(Icons.verified),
                      label: const Text('Validate Field'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: _resetField,
                      icon: const Icon(Icons.replay),
                      label: const Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Custom Star FormField):',
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
              // Custom rating input wrapped in a FormField
              FormField<int>(
                key: _fieldKey,
                initialValue: 0,
                validator: (value) {
                  if (value == null || value == 0) {
                    return 'Please give a rating of at least 1 star.';
                  }
                  return null;
                },
                builder: (FormFieldState<int> state) {
                  final hasError = state.hasError;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Star selection UI
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: hasError ? Colors.red : theme.colorScheme.outlineVariant,
                            width: hasError ? 2.0 : 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Rating:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                final starVal = index + 1;
                                final isSelected = (state.value ?? 0) >= starVal;
                                return IconButton(
                                  onPressed: () {
                                    state.didChange(starVal);
                                  },
                                  icon: Icon(
                                    isSelected ? Icons.star : Icons.star_border,
                                    color: isSelected ? Colors.amber : Colors.grey,
                                    size: 32,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      // Error Text message
                      if (hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 4),
                          child: Text(
                            state.errorText ?? '',
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              // Field Status Logger
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _status,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
