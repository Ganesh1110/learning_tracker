const String aspectRatioRnEquivalent = r'''
In React Native, maintaining a specific ratio between a component's width and height is accomplished using the `aspectRatio` layout property in React Native's layout engine (Yoga).

```jsx
// React Native:
import React from 'react';
import { View, Image, StyleSheet } from 'react-native';

const AspectRatioExample = () => {
  return (
    <View style={styles.parentContainer}>
      <View style={styles.imageWrapper}>
        <Image
          source={{ uri: 'https://placehold.co/600x400' }}
          style={styles.responsiveImage}
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  parentContainer: {
    width: '100%',
    padding: 16,
  },
  imageWrapper: {
    width: '100%',
    // Yoga allows defining aspect ratio as a number (width / height)
    // 16:9 aspect ratio is represented as 16/9 (or 1.777)
    aspectRatio: 16 / 9,
    borderRadius: 8,
    overflow: 'hidden',
  },
  responsiveImage: {
    flex: 1,
    resizeMode: 'cover',
  },
});
```

### Key Differences
1. **Yoga engine vs. Flutter Constraints**:
   In React Native, setting `aspectRatio` instructs Yoga to calculate whichever dimension (width or height) is unspecified. If both are specified, it scales to fit the aspect ratio depending on `alignSelf` or flex behaviors.
   In Flutter, `AspectRatio` is a specialized layout widget that intercepts incoming constraints from its parent. It calculates the largest width and height that satisfies the target ratio while fitting within the constraints, and forces those child constraints on its sub-elements.

2. **Strictness**:
   If parent constraints are too strict (for example, if a parent forces a child to be exactly `100x100` pixels), Flutter's `AspectRatio` widget will try to honor the ratio, but must ultimately conform to the parent's tight constraints, which might cause the aspect ratio to be overridden.
''';
