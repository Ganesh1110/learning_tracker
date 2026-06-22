import 'package:flutter/material.dart';

class BlockSemanticsDemo extends StatefulWidget {
  const BlockSemanticsDemo({super.key});

  @override
  State<BlockSemanticsDemo> createState() => _BlockSemanticsDemoState();
}

class _BlockSemanticsDemoState extends State<BlockSemanticsDemo> {
  bool _isModalOpen = false;
  bool _blockSemantics = true;
  bool _simulatingAccessibility = true;
  int _clicksCount = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Accessibility Simulator Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _simulatingAccessibility,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _simulatingAccessibility = val);
                    }
                  },
                ),
                const Text('Show Accessibility Focus Circles'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _blockSemantics,
                  onChanged: _isModalOpen
                      ? (val) {
                          if (val != null) {
                            setState(() => _blockSemantics = val);
                          }
                        }
                      : null, // Only editable when modal is open to see impact
                ),
                const Text('Block Semantics'),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Canvas
        Text(
          'Settings Page (Playground Canvas)',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. Background Content (Settings List)
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'App Settings',
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          _buildFocusCircle(1, 'Title'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildMockSettingsItem(
                        theme: theme,
                        focusId: 2,
                        label: 'Notification Toggles',
                        icon: Icons.notifications_active_outlined,
                      ),
                      const SizedBox(height: 12),
                      _buildMockSettingsItem(
                        theme: theme,
                        focusId: 3,
                        label: 'Dark Mode Theme',
                        icon: Icons.dark_mode_outlined,
                      ),
                      const Spacer(),
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            ElevatedButton(
                              onPressed: _isModalOpen
                                  ? null
                                  : () => setState(() {
                                        _isModalOpen = true;
                                        _blockSemantics = true;
                                      }),
                              child: const Text('Open Security Prompt'),
                            ),
                            if (!_isModalOpen)
                              Positioned(
                                right: -24,
                                top: -8,
                                child: _buildFocusCircle(4, 'Button'),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Dim overlay when modal is open
              if (_isModalOpen)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.4),
                  ),
                ),

              // 2. Custom Dialog Modal Box
              if (_isModalOpen)
                Positioned(
                  width: 260,
                  height: 170,
                  child: _buildSemanticsWrapper(
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Security Check',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                _buildFocusCircle(5, 'Modal Title', forceActive: true),
                              ],
                            ),
                            const Text(
                              'Please confirm to save changes.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    TextButton(
                                      onPressed: () => setState(() => _isModalOpen = false),
                                      child: const Text('Cancel'),
                                    ),
                                    Positioned(
                                      right: -10,
                                      bottom: -10,
                                      child: _buildFocusCircle(6, 'Cancel Btn', forceActive: true),
                                    ),
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _clicksCount++;
                                          _isModalOpen = false;
                                        });
                                      },
                                      child: const Text('Confirm'),
                                    ),
                                    Positioned(
                                      right: -10,
                                      bottom: -10,
                                      child: _buildFocusCircle(7, 'Confirm Btn', forceActive: true),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Confirmed Clicks: $_clicksCount',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSemanticsWrapper({required Widget child}) {
    // BlockSemantics stops accessibility tools from looking at widgets painted before it
    return BlockSemantics(
      blocking: _blockSemantics,
      child: child,
    );
  }

  Widget _buildMockSettingsItem({
    required ThemeData theme,
    required int focusId,
    required String label,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Text(label),
          const Spacer(),
          _buildFocusCircle(focusId, label),
        ],
      ),
    );
  }

  // Visual helper to draw green/red accessibility circles simulating screen reader focus
  Widget _buildFocusCircle(int order, String label, {bool forceActive = false}) {
    if (!_simulatingAccessibility) return const SizedBox.shrink();

    // If modal is open and blockSemantics is active, background nodes (orders 1-4) are blocked!
    final isBlocked = _isModalOpen && _blockSemantics && !forceActive;
    final color = isBlocked ? Colors.red : Colors.green;

    return Tooltip(
      message: isBlocked ? '$label (Accessibility Blocked)' : '$label (Screen Reader Focus #$order)',
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 2),
        ),
        child: Center(
          child: Icon(
            isBlocked ? Icons.block : Icons.accessibility_new_rounded,
            size: 10,
            color: color,
          ),
        ),
      ),
    );
  }
}
