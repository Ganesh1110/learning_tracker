import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultAssetBundleDemo extends StatefulWidget {
  const DefaultAssetBundleDemo({super.key});

  @override
  State<DefaultAssetBundleDemo> createState() => _DefaultAssetBundleDemoState();
}

class _DefaultAssetBundleDemoState extends State<DefaultAssetBundleDemo> {
  String _selectedProfile = 'Profile A (Admin)';

  // Mock asset maps for two different profiles
  final Map<String, String> _profileAData = {
    'assets/data/config.json': json.encode({
      'profileName': 'Administrator Account',
      'userRole': 'admin',
      'permissions': ['read', 'write', 'delete', 'publish'],
      'preferredTheme': 'Dark Mode (Ocean Blue)',
      'apiVersion': 'v2.4.1-alpha',
    }),
  };

  final Map<String, String> _profileBData = {
    'assets/data/config.json': json.encode({
      'profileName': 'Standard Guest Account',
      'userRole': 'guest',
      'permissions': ['read'],
      'preferredTheme': 'Light Mode (Sunset Peach)',
      'apiVersion': 'v1.0.0-stable',
    }),
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mockData = _selectedProfile == 'Profile A (Admin)' ? _profileAData : _profileBData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Asset Bundle Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Asset Scoped Profile: '),
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: _selectedProfile,
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selectedProfile = val);
                }
              },
              items: ['Profile A (Admin)', 'Profile B (User)'].map((p) {
                return DropdownMenuItem(value: p, child: Text(p));
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Changing the profile replaces the active DefaultAssetBundle with a mock bundle containing configuration assets.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
            fontStyle: FontStyle.italic,
          ),
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Loaded Asset Output',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Inject the selected MockAssetBundle into the tree
        DefaultAssetBundle(
          bundle: MockAssetBundle(mockData),
          child: const ConfigViewer(),
        ),
      ],
    );
  }
}

// Subcomponent that resolves DefaultAssetBundle from the BuildContext
class ConfigViewer extends StatefulWidget {
  const ConfigViewer({super.key});

  @override
  State<ConfigViewer> createState() => _ConfigViewerState();
}

class _ConfigViewerState extends State<ConfigViewer> {
  String _rawJson = '';
  Map<String, dynamic> _configData = {};
  bool _loading = false;
  String _errorMsg = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAsset();
  }

  Future<void> _loadAsset() async {
    setState(() {
      _loading = true;
      _errorMsg = '';
    });

    try {
      // Resolve the DefaultAssetBundle from context and load asset string
      final String jsonStr = await DefaultAssetBundle.of(context).loadString('assets/data/config.json');
      final Map<String, dynamic> data = json.decode(jsonStr) as Map<String, dynamic>;
      if (mounted) {
        setState(() {
          _rawJson = jsonStr;
          _configData = data;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMsg = e.toString();
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_loading) {
      return const SizedBox(
        height: 120,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMsg.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text('Error loading asset: $_errorMsg', style: TextStyle(color: theme.colorScheme.onErrorContainer)),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.terminal, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              const Text('assets/data/config.json', style: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          Text('Profile Name: ${_configData['profileName'] ?? ''}', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('User Role: ${_configData['userRole'] ?? ''}'),
          Text('Permissions: ${(_configData['permissions'] as List<dynamic>?)?.join(', ') ?? ''}'),
          Text('Preferred Theme: ${_configData['preferredTheme'] ?? ''}'),
          Text('API Version: ${_configData['apiVersion'] ?? ''}'),
          const Divider(height: 16),
          const Text('Raw JSON payload:', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.black.withValues(alpha: 0.05),
            child: Text(
              _rawJson,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom mock asset bundle class overriding resource resolution
class MockAssetBundle extends CachingAssetBundle {
  final Map<String, String> mockAssets;

  MockAssetBundle(this.mockAssets);

  @override
  Future<ByteData> load(String key) async {
    if (mockAssets.containsKey(key)) {
      final list = utf8.encode(mockAssets[key]!);
      return ByteData.sublistView(Uint8List.fromList(list));
    }
    throw FlutterError('Asset key not found in mock bundle: $key');
  }
}
