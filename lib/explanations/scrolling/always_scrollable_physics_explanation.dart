const String alwaysScrollableScrollPhysicsRnEquivalent = r'''
In React Native, `ScrollView` and `FlatList` component boundaries clamping is standard. However, you can force the scroll view to bounce and allow scroll gestures even when the content fits entirely within the screen by using bounce properties:

```jsx
// React Native:
import React from 'react';
import { ScrollView, View, Text } from 'react-native';

const ShortBounceList = () => (
  // Force vertical scrolling and spring back effects:
  <ScrollView alwaysBounceVertical={true}>
    <View style={{ padding: 20 }}>
      <Text>Short list content</Text>
    </View>
  </ScrollView>
);
```

In Flutter, scroll views like `ListView`, `GridView`, or `SingleChildScrollView` use platform-native scroll physics. On Android and Web, if the list content is shorter than the viewport, it clamps and will **not scroll** or trigger scroll triggers.

To override this default behavior—especially when incorporating a **`RefreshIndicator`** which requires vertical drag gestures to trigger—you must set `physics: const AlwaysScrollableScrollPhysics()`. This forces the list to accept scroll gestures, bounce/stretch animations, and trigger refreshers regardless of content size.
''';
