import 'package:flutter/material.dart';

class BuilderDemo extends StatefulWidget {
  const BuilderDemo({super.key});

  @override
  State<BuilderDemo> createState() => _BuilderDemoState();
}

class _BuilderDemoState extends State<BuilderDemo> {
  bool _useBuilder = true;
  String _statusMessage = 'Ready. Click button to attempt opening Drawer.';
  bool _isSuccess = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Configuration Controls
        Text(
          'Nesting Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: _useBuilder,
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _useBuilder = val;
                    _statusMessage = 'Ready. Switch toggled.';
                    _isSuccess = true;
                  });
                }
              },
            ),
            const Expanded(
              child: Text(
                'Wrap Button in a Builder widget (provides nested BuildContext)',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Canvas
        Text(
          'Drawer Controller (Playground Canvas)',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text('Embedded Scaffold', style: TextStyle(fontSize: 14)),
                automaticallyImplyLeading: false, // Hide default drawer button to force manual trigger
                backgroundColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              ),
              drawer: Drawer(
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: theme.colorScheme.primary),
                      child: const Text('Custom Drawer', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    ListTile(
                      leading: const Icon(Icons.close),
                      title: const Text('Close Drawer'),
                      onTap: () => Navigator.of(context).pop(), // pops the drawer
                    ),
                  ],
                ),
              ),
              body: Center(
                child: _useBuilder
                    ? Builder(
                        builder: (BuildContext builderContext) {
                          // This builderContext is below the Scaffold in the widget tree,
                          // so Scaffold.of(builderContext) works perfectly!
                          return ElevatedButton.icon(
                            onPressed: () {
                              Scaffold.of(builderContext).openDrawer();
                              setState(() {
                                _statusMessage = 'Success! Scaffold found via Builder Context.';
                                _isSuccess = true;
                              });
                            },
                            icon: const Icon(Icons.menu),
                            label: const Text('Open Drawer (Builder)'),
                          );
                        },
                      )
                    : ElevatedButton.icon(
                        onPressed: () {
                          // This context is the build() context of BuilderDemoState.
                          // The Scaffold is defined inside this build method, so it is a CHILD of this context,
                          // meaning Scaffold.maybeOf(context) will return null and crash in standard apps.
                          final scaffoldState = Scaffold.maybeOf(context);
                          if (scaffoldState == null) {
                            setState(() {
                              _statusMessage = 'Error: No Scaffold ancestor found in build() context!';
                              _isSuccess = false;
                            });
                          } else {
                            scaffoldState.openDrawer();
                          }
                        },
                        icon: const Icon(Icons.menu),
                        label: const Text('Open Drawer (Direct Context)'),
                      ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Status Console
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isSuccess 
                ? theme.colorScheme.secondaryContainer.withValues(alpha: 0.3)
                : theme.colorScheme.errorContainer.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isSuccess 
                  ? theme.colorScheme.secondary.withValues(alpha: 0.2)
                  : theme.colorScheme.error.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Icon(
                _isSuccess ? Icons.info_outline : Icons.error_outline,
                color: _isSuccess ? theme.colorScheme.secondary : theme.colorScheme.error,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _statusMessage,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    color: _isSuccess ? theme.colorScheme.onSecondaryContainer : theme.colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
