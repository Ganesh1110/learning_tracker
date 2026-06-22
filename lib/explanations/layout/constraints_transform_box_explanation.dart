const String constraintsTransformBoxRnEquivalent = r'''
In React Native, layout size boundaries are not passed down using strict, immutable structural range objects (like BoxConstraints). Yoga calculates element sizes dynamically.

If a parent view in React Native has a fixed size (e.g. `width: 150, height: 120`), absolute-positioned children can bypass these limits entirely. You can also specify negative margins or absolute sizing on children to let them bleed outside the parent box boundaries.

```jsx
// React Native: Allowing child to exceed parent fixed dimensions
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const OverflowExample = () => {
  return (
    <View style={styles.parent}>
      {/* Child breaks out of parent bounds */}
      <View style={styles.absoluteChild}>
        <Text style={styles.text}>Child Size: 220x110</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  parent: {
    width: 150,
    height: 120,
    borderWidth: 2,
    borderColor: 'red',
    justifyContent: 'center',
    alignItems: 'center',
    overflow: 'visible', // Bleeds content outside parent box
  },
  absoluteChild: {
    position: 'absolute', // Breaks out of parent flex flow
    width: 220,
    height: 110,
    backgroundColor: '#3b82f6',
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: { color: 'white', fontSize: 10 },
});
```

### Key Differences
1. **Implicit Override vs. Explicit Constraints Transformers**:
   - **React Native**: Overriding layout limits is implicit. Setting `position: 'absolute'` or declaring fixed sizes on child views overrides normal flex alignment limits automatically.
   - **Flutter**: If a parent widget passes tight constraints (telling the child it *must* paint at exactly 150x120), the child has no way to override this directly; it will be forced to match the parent size. To modify how these layout constraints are passed down, you must wrap the child in a **`ConstraintsTransformBox`** widget.

2. **Built-in Transformations**:
   - Flutter's `ConstraintsTransformBox` provides preset transformation functions:
     - `ConstraintsTransformBox.unconstrained`: Strips all constraints, allowing the child to choose its preferred size (similar to setting `position: 'absolute'` in RN).
     - `ConstraintsTransformBox.widthUnconstrained` / `heightUnconstrained`: Removes constraints along one axis while keeping the other bound.
     - `ConstraintsTransformBox.maxUnconstrained`: Allows the child to expand infinitely while maintaining minimum limits.
   - React Native does not have a formal constraint-mapping layer in JS; Yoga resolves size computations implicitly.
''';
