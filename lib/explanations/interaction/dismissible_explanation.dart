const String dismissibleRnEquivalent = r'''
In React Native, swipe-to-dismiss lists are commonly built using the `Swipeable` component from `react-native-gesture-handler` (often used inside a `FlatList`), or via custom implementations using `PanResponder` or `react-native-reanimated`.

```jsx
// React Native: Swipeable list item:
import React from 'react';
import { Text, View, StyleSheet, Animated } from 'react-native';
import { Swipeable } from 'react-native-gesture-handler';

const SwipeableItem = () => {
  const renderRightActions = (progress, dragX) => {
    const scale = dragX.interpolate({
      inputRange: [-100, 0],
      outputRange: [1, 0],
      extrapolate: 'clamp',
    });
    return (
      <View style={styles.rightAction}>
        <Animated.Text style={[styles.actionText, { transform: [{ scale }] }]}>
          Delete
        </Animated.Text>
      </View>
    );
  };

  return (
    <Swipeable renderRightActions={renderRightActions} onSwipeableOpen={(direction) => console.log('Opened', direction)}>
      <View style={styles.item}>
        <Text>Swipe me left</Text>
      </View>
    </Swipeable>
  );
};

const styles = StyleSheet.create({
  item: { padding: 20, backgroundColor: 'white' },
  rightAction: { backgroundColor: 'red', justifyContent: 'center', width: 100, alignItems: 'flex-end', padding: 20 },
  actionText: { color: 'white', fontWeight: '600' }
});
```

### The Difference in Flutter
Flutter provides the `Dismissible` widget in the core library. It automates swipe physics, snap-back, fade-out, resizing, and dismissal transitions without any external package dependencies.

Key properties include:
1. **key**: A unique key is strictly required so that Flutter can correctly manage elements in the stateful list tree.
2. **background**: Rendered when swiping right (typically "Archive" or "Share").
3. **secondaryBackground**: Rendered when swiping left (typically "Delete").
4. **direction**: Constrains swiping to horizontal, vertical, or unidirectional swipes.
5. **onDismissed**: A callback triggered once the swipe gesture exceeds the dismiss threshold, letting you immediately update the application state.
''';
