const String abstractLayoutBuilderRnEquivalent = r'''
In React Native, there is no direct equivalent of a builder that defers construction until the layout phase. Instead, you achieve this by listening to the `onLayout` event of a `<View>` and triggering a state update with the layout dimensions.

```jsx
import React, { useState } from 'react';
import { View, Text } from 'react-native';

const DynamicLayoutComponent = () => {
  const [dimensions, setDimensions] = useState(null);

  const onLayout = (event) => {
    const { width, height } = event.nativeEvent.layout;
    setDimensions({ width, height });
  };

  return (
    <View onLayout={onLayout} style={{ flex: 1 }}>
      {dimensions && (
        <View style={{
          width: dimensions.width > 500 ? 400 : 250,
          backgroundColor: 'blue',
        }}>
          <Text>Responsive based on parent width!</Text>
        </View>
      )}
    </View>
  );
};
```

In Flutter, `AbstractLayoutBuilder<LayoutInfoType>` is the abstract base class for widgets that defer their building until layout. Its most common concrete implementation is `LayoutBuilder` (which subclasses it with `BoxConstraints`), allowing you to dynamically build different widget subtrees depending on the available size.
''';
