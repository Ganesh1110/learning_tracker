const String baselineRnEquivalent = r'''
In React Native, aligning text elements with different font sizes or custom line-heights along their baseline is achieved using the `alignItems: 'baseline'` style on a flex row container.

```jsx
// React Native:
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const BaselineExample = () => {
  return (
    <View style={styles.container}>
      {/* Aligning children by baseline inside a row */}
      <View style={styles.row}>
        <Text style={styles.largeText}>LargeText</Text>
        <Text style={styles.smallText}>small_desc</Text>
        <Text style={styles.kanjiText}>漢字 (Kanji)</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    padding: 16,
    backgroundColor: '#fafafa',
  },
  row: {
    flexDirection: 'row',
    alignItems: 'baseline', // Aligns all text baselines horizontally
    paddingVertical: 12,
    backgroundColor: 'rgba(0,0,0,0.05)',
  },
  largeText: {
    fontSize: 36,
    fontWeight: 'bold',
  },
  smallText: {
    fontSize: 14,
    color: 'blue',
    fontStyle: 'italic',
    marginHorizontal: 8,
  },
  kanjiText: {
    fontSize: 20,
  },
});
```

### Key Differences
1. **Implicit Row Align vs. Individual Constraints**:
   - **React Native**: Baseline alignment is applied container-wide via `alignItems: 'baseline'`. There is no way in Yoga to set a specific baseline offset distance in pixels for a single component.
   - **Flutter**: In addition to using `CrossAxisAlignment.baseline` inside a `Row`, Flutter provides the **`Baseline`** widget. This allows developers to explicitly set the baseline offset (the distance from the top of the `Baseline` container to the child's baseline). This is useful for custom layout constraints where you want to lock the exact location of the text baseline inside a bounding box.

2. **Types of Baselines**:
   - Flutter's `Baseline` supports `TextBaseline.alphabetic` (for Latin-like scripts) and `TextBaseline.ideographic` (for Chinese/Japanese/Korean scripts, aligning at the bottom of the character boxes).
   - React Native's Yoga engine handles baseline alignment automatically behind the scenes (binding to Android's Paint baseline and iOS's CoreText metrics), but doesn't expose configuration for baseline types explicitly in the style API.
''';
