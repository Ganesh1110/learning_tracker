import 'package:flutter/material.dart';

class BackButtonListenerDemo extends StatefulWidget {
  const BackButtonListenerDemo({super.key});

  @override
  State<BackButtonListenerDemo> createState() => _BackButtonListenerDemoState();
}

class _BackButtonListenerDemoState extends State<BackButtonListenerDemo> {
  int _currentStep = 1;
  final List<String> _logs = [];

  void _addLog(String message) {
    setState(() {
      _logs.insert(0, '${DateTime.now().toString().substring(11, 19)} - $message');
      if (_logs.length > 5) {
        _logs.removeLast();
      }
    });
  }

  Future<bool> _handleBackPress() async {
    _addLog('System Back Button Pressed');

    if (_currentStep > 1) {
      _addLog('Intercepted: Moving back to Step ${_currentStep - 1}');
      setState(() {
        _currentStep--;
      });
      return true; // Return true to indicate we handled the event (prevents route pop)
    }

    // Step 1 back press triggers dialog confirmation
    _addLog('Intercepted: Prompting exit confirmation');
    final exitConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Checkout?'),
        content: const Text('Are you sure you want to exit? Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Exit'),
          ),
        ],
      ),
    );

    if (exitConfirmed == true) {
      _addLog('User confirmed exit. Allowing route pop.');
      return false; // Return false to allow default router behavior (pop screen)
    }

    _addLog('User cancelled exit. Intercepting pop.');
    return true; // Prevent route pop
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BackButtonListener(
      onBackButtonPressed: _handleBackPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Simulated Device Border and Wizard Canvas
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Column(
              children: [
                // Step Progress Indicator
                Row(
                  children: List.generate(3, (index) {
                    final stepNum = index + 1;
                    final isActive = stepNum <= _currentStep;
                    final isCurrent = stepNum == _currentStep;
                    return Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: isCurrent
                                ? theme.colorScheme.primary
                                : isActive
                                    ? theme.colorScheme.primary.withValues(alpha: 0.6)
                                    : theme.colorScheme.outlineVariant,
                            child: Text(
                              '$stepNum',
                              style: TextStyle(
                                color: isActive ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (index < 2)
                            Expanded(
                              child: Container(
                                height: 2,
                                color: stepNum < _currentStep
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.outlineVariant,
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 24),

                // Wizard Content
                SizedBox(
                  height: 120,
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _buildStepContent(theme),
                    ),
                  ),
                ),
                const Divider(height: 20),

                // Action Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: _currentStep > 1
                          ? () => setState(() => _currentStep--)
                          : null,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Previous'),
                    ),
                    ElevatedButton.icon(
                      onPressed: _currentStep < 3
                          ? () => setState(() => _currentStep++)
                          : () {
                              _addLog('Checkout Complete!');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Order Submitted Successfully!')),
                              );
                            },
                      icon: Icon(_currentStep == 3 ? Icons.payment : Icons.arrow_forward),
                      label: Text(_currentStep == 3 ? 'Pay Now' : 'Next Step'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Simulation Button (since back button is hardware/system based)
          ElevatedButton.icon(
            onPressed: () async {
              final allowed = await _handleBackPress();
              if (!allowed && context.mounted) {
                // If it returned false, we simulate going back in navigation
                Navigator.of(context).maybePop();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.errorContainer.withValues(alpha: 0.1),
              foregroundColor: theme.colorScheme.error,
            ),
            icon: const Icon(Icons.settings_backup_restore_rounded),
            label: const Text('Simulate System Back Button Tapped'),
          ),
          const SizedBox(height: 16),

          // Visual Event Console Logs
          Text(
            'Event Console Logs',
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 110,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade800),
            ),
            child: _logs.isEmpty
                ? const Center(
                    child: Text(
                      'No events captured yet. Tap simulate back or next/prev buttons.',
                      style: TextStyle(color: Colors.grey, fontSize: 11, fontStyle: FontStyle.italic),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _logs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          _logs[index],
                          style: const TextStyle(
                            color: Colors.greenAccent,
                            fontFamily: 'monospace',
                            fontSize: 11,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent(ThemeData theme) {
    switch (_currentStep) {
      case 2:
        return Column(
          key: const ValueKey('step2'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Step 2: Shipping Address', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Enter destination address details & parcel size requirements.', textAlign: TextAlign.center),
          ],
        );
      case 3:
        return Column(
          key: const ValueKey('step3'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Step 3: Secure Payment', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Choose credit card or online payment gateway to finalize order.', textAlign: TextAlign.center),
          ],
        );
      case 1:
      default:
        return Column(
          key: const ValueKey('step1'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Step 1: Shopping Cart Review', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Review selected items, coupon discount credits, and delivery estimates.', textAlign: TextAlign.center),
          ],
        );
    }
  }
}
