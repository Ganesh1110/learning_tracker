import 'package:flutter/material.dart';

class FutureBuilderDemo extends StatefulWidget {
  const FutureBuilderDemo({super.key});

  @override
  State<FutureBuilderDemo> createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  late Future<String> _futureData;
  bool _simulateError = false;
  int _delaySeconds = 2;

  @override
  void initState() {
    super.initState();
    _futureData = _fetchMockData();
  }

  Future<String> _fetchMockData() async {
    await Future.delayed(Duration(seconds: _delaySeconds));
    if (_simulateError) {
      throw Exception('Network timeout! Failed to connect to server.');
    }
    return 'Alice Smith | Senior Mobile Architect';
  }

  void _triggerFetch() {
    setState(() {
      _futureData = _fetchMockData();
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
                  'FutureBuilder Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Simulate Fetch Error'),
                  subtitle: const Text('Forces the mock future to throw an exception'),
                  value: _simulateError,
                  onChanged: (val) => setState(() => _simulateError = val),
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Fetch Delay (s): ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<int>(
                      value: _delaySeconds,
                      onChanged: (int? val) {
                        if (val != null) {
                          setState(() => _delaySeconds = val);
                        }
                      },
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('1 Second')),
                        DropdownMenuItem(value: 2, child: Text('2 Seconds')),
                        DropdownMenuItem(value: 3, child: Text('3 Seconds')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _triggerFetch,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh API Call'),
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
          height: 160,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: FutureBuilder<String>(
            future: _futureData,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              // 1. ConnectionState.waiting
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 12),
                    Text(
                      'Fetching profile details...',
                      style: TextStyle(color: theme.colorScheme.primary, fontStyle: FontStyle.italic),
                    ),
                  ],
                );
              }

              // 2. Exception / Error state
              if (snapshot.hasError) {
                return Card(
                  margin: const EdgeInsets.all(16),
                  color: Colors.red.withValues(alpha: 0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.error, color: Colors.red),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Error: ${snapshot.error.toString().replaceAll('Exception: ', '')}',
                            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // 3. Data resolved successfully
              if (snapshot.hasData) {
                final data = snapshot.data!.split(' | ');
                final name = data[0];
                final role = data[1];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.all(16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: const Icon(Icons.account_circle),
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(role),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              }

              return const Text('State unresolved.');
            },
          ),
        ),
      ],
    );
  }
}
