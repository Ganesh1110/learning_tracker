const String decoratedBoxRnEquivalent = r'''
In React Native, layout, padding, constraints, and decorations (like backgrounds, gradients, borders, shadows, and rounded corners) are unified into standard style properties on a single `<View>` component.

Here is how React Native implements visual decorations on a container:

```jsx
// React Native:
import React from 'react';
import { View, StyleSheet, Text } from 'react-native';
import LinearGradient from 'react-native-linear-gradient';

const DecorationExample = () => {
  return (
    <LinearGradient
      colors={['#dbeafe', '#fee2e2']}
      style={styles.decoratedBox}
      start={{ x: 0, y: 0 }}
      end={{ x: 1, y: 1 }}
    >
      <View style={styles.content}>
        <Text style={styles.text}>Decorated Child Text</Text>
      </View>
    </LinearGradient>
  );
};

const styles = StyleSheet.create({
  decoratedBox: {
    borderRadius: 16,
    borderWidth: 3,
    borderColor: '#3b82f6',
    // Shadow properties
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.15,
    shadowRadius: 10,
    elevation: 4, // Android shadow
  },
  content: {
    paddingHorizontal: 40,
    paddingVertical: 32,
    alignItems: 'center',
  },
  text: {
    fontSize: 14,
    fontWeight: 'bold',
    color: '#1f2937',
  },
});
```

### Key Differences
1. **Separation of Concerns vs. All-in-One**:
   - **React Native**: A single `<View>` (or specialized gradient container) handles layout constraints, flex properties, inner padding, margins, borders, shadows, and content alignment simultaneously.
   - **Flutter**: Flutter separates layout, padding, and painting. **`DecoratedBox`** is a dedicated rendering node that only paints a `Decoration` (such as `BoxDecoration`). It does not calculate padding, margin, or layout alignment. If you want layout alignment and padding, you wrap the `DecoratedBox` in `Padding` and `Align` widgets.
   - *Note*: **`Container`** is a convenience widget that internally builds this exact nested composition (`Align` -> `Padding` -> `DecoratedBox` -> `ConstrainedBox`). Using `DecoratedBox` directly avoids container composition overhead when you don't need padding or alignment.

2. **Foreground vs. Background Painting**:
   - **Flutter**: `DecoratedBox` provides a `position` property (`DecorationPosition.background` or `DecorationPosition.foreground`). Selecting `foreground` causes the decoration to paint on top of the child widget (for example, to paint a semi-transparent tint overlay, a glassmorphic border, or an overlay gloss gradient over a card content).
   - **React Native**: React Native styles (borders, background color, gradients) always paint as the background layer. Painting borders or styling overlays *on top* of child text/images is not directly supported; developers must manually render absolute overlay layers.
''';
