import 'package:flutter/material.dart';

// Enum representing the child layout IDs
enum BadgeLayoutId {
  avatar,
  badge,
}

// Custom delegate to layout avatar and notification badge dynamically
class BadgeLayoutDelegate extends MultiChildLayoutDelegate {
  final double avatarSize;
  final double badgeSize;
  final String location; // 'top-right', 'top-left', 'bottom-right', 'bottom-left'

  BadgeLayoutDelegate({
    required this.avatarSize,
    required this.badgeSize,
    required this.location,
  });

  @override
  void performLayout(Size size) {
    Size actualAvatarSize = Size.zero;
    Size actualBadgeSize = Size.zero;

    // 1. Layout the main avatar child
    if (hasChild(BadgeLayoutId.avatar)) {
      // Force it to match avatarSize constraints
      actualAvatarSize = layoutChild(
        BadgeLayoutId.avatar,
        BoxConstraints.tight(Size(avatarSize, avatarSize)),
      );
      // Position avatar at the center of the viewport
      final double avatarX = (size.width - actualAvatarSize.width) / 2;
      final double avatarY = (size.height - actualAvatarSize.height) / 2;
      positionChild(BadgeLayoutId.avatar, Offset(avatarX, avatarY));

      // 2. Layout the badge child
      if (hasChild(BadgeLayoutId.badge)) {
        actualBadgeSize = layoutChild(
          BadgeLayoutId.badge,
          BoxConstraints.tight(Size(badgeSize, badgeSize)),
        );

        // Position badge overlapping a corner of the avatar by exactly half its diameter
        double badgeX;
        double badgeY;

        switch (location) {
          case 'top-left':
            badgeX = avatarX - (actualBadgeSize.width / 2);
            badgeY = avatarY - (actualBadgeSize.height / 2);
            break;
          case 'bottom-left':
            badgeX = avatarX - (actualBadgeSize.width / 2);
            badgeY = avatarY + actualAvatarSize.height - (actualBadgeSize.height / 2);
            break;
          case 'bottom-right':
            badgeX = avatarX + actualAvatarSize.width - (actualBadgeSize.width / 2);
            badgeY = avatarY + actualAvatarSize.height - (actualBadgeSize.height / 2);
            break;
          case 'top-right':
          default:
            badgeX = avatarX + actualAvatarSize.width - (actualBadgeSize.width / 2);
            badgeY = avatarY - (actualBadgeSize.height / 2);
            break;
        }

        positionChild(BadgeLayoutId.badge, Offset(badgeX, badgeY));
      }
    }
  }

  @override
  bool shouldRelayout(covariant BadgeLayoutDelegate oldDelegate) {
    return oldDelegate.avatarSize != avatarSize ||
        oldDelegate.badgeSize != badgeSize ||
        oldDelegate.location != location;
  }
}

class CustomMultiChildLayoutDemo extends StatefulWidget {
  const CustomMultiChildLayoutDemo({super.key});

  @override
  State<CustomMultiChildLayoutDemo> createState() => _CustomMultiChildLayoutDemoState();
}

class _CustomMultiChildLayoutDemoState extends State<CustomMultiChildLayoutDemo> {
  double _avatarSize = 100.0;
  double _badgeSize = 28.0;
  String _badgeLocation = 'top-right';

  final List<String> _locations = ['top-right', 'top-left', 'bottom-right', 'bottom-left'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Badge & Avatar Layout Controls',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Avatar Size Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Avatar Size: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _avatarSize,
                    min: 60.0,
                    max: 140.0,
                    onChanged: (val) => setState(() => _avatarSize = val),
                  ),
                ),
                Text('${_avatarSize.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Badge Size Slider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Badge Size: '),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _badgeSize,
                    min: 16.0,
                    max: 40.0,
                    onChanged: (val) => setState(() => _badgeSize = val),
                  ),
                ),
                Text('${_badgeSize.toStringAsFixed(0)}px', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            // Badge corner location dropdown
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Location: '),
                DropdownButton<String>(
                  value: _badgeLocation,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _badgeLocation = val);
                    }
                  },
                  items: _locations.map((loc) {
                    return DropdownMenuItem(value: loc, child: Text(loc));
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'CustomMultiChildLayout layouts the badge to perfectly intersect the avatar corner, positioning it dynamically based on the measured sizes of both elements.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),
        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: CustomMultiChildLayout(
            delegate: BadgeLayoutDelegate(
              avatarSize: _avatarSize,
              badgeSize: _badgeSize,
              location: _badgeLocation,
            ),
            children: [
              // Avatar
              LayoutId(
                id: BadgeLayoutId.avatar,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [theme.colorScheme.primary, theme.colorScheme.primaryContainer],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                ),
              ),

              // Notification Badge overlay
              LayoutId(
                id: BadgeLayoutId.badge,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '9',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _badgeSize > 24 ? 11 : 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
