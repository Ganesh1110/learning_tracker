const String animatedSwitcherRnEquivalent = r'''
In React Native, animatng a swap or transition between two different components (e.g., transitioning from a `<LoadingSpinner>` to a `<DataCard>`) typically requires mounting both components concurrently and fading their opacity styles using Reanimated `entering`/`exiting` animations, or manually managing the animations via an `Animated` opacity value.

```jsx
// React Native (using Reanimated layout transitions):
import React, { useState } from 'react';
import { View, Text, Button } from 'react-native';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

const SwitcherExample = () => {
  const [showData, setShowData] = useState(false);

  return (
    <View style={{ height: 200, justifyContent: 'center' }}>
      {showData ? (
        <Animated.View entering={FadeIn.duration(400)} exiting={FadeOut.duration(400)} key="data">
          <Text style={{ fontSize: 20 }}>📊 Data Card Content Loaded!</Text>
        </Animated.View>
      ) : (
        <Animated.View entering={FadeIn.duration(400)} exiting={FadeOut.duration(400)} key="loading">
          <Text style={{ fontSize: 16 }}>⏳ Loading content...</Text>
        </Animated.View>
      )}
      <Button title="Toggle State" onPress={() => setShowData(!showData)} />
    </View>
  );
};
```

In Flutter, **`AnimatedSwitcher`** manages this process declaratively. You provide it with a single child widget. When the child changes (meaning it has a different runtime type or a different **`Key`**), `AnimatedSwitcher` automatically runs an exit animation for the old child and an entrance animation for the new child.

### Key Conceptual Notes:
1. **Keys are Critical**: If the two swapping children have the same widget class type (e.g. transitioning from a `Text('Loading')` to a `Text('Success')`), you **MUST** assign them unique `ValueKey`s. Without keys, Flutter will update the existing widget in place rather than recognizing it as a new child, preventing the animation from triggering.
2. **Transition Customization**: By default, it performs a cross-fade (`FadeTransition`). However, using the **`transitionBuilder`** parameter, you can return custom combinations of `ScaleTransition`, `RotationTransition`, `SlideTransition`, etc.
''';
