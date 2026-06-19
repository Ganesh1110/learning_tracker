const String alwaysStoppedAnimationRnEquivalent = r'''
In React Native, styling and visual properties accept both standard literals (like `'red'` or `0.5`) and dynamic `Animated.Value` instances interchangeably. The React Native framework automatically handles them:

```jsx
// React Native:
import React from 'react';
import { View, ActivityIndicator } from 'react-native';

const StaticSpinner = () => (
  // We can pass static styles directly to any component, even if it normally supports animations:
  <View style={{ opacity: 0.5 }}>
    <ActivityIndicator color="blue" />
  </View>
);
```

In Flutter, certain widgets or parameters are strongly typed to only accept an `Animation<T>` object (e.g., the `valueColor` of a `CircularProgressIndicator`, or transitioning elements in custom routers).

If you want to feed a constant, static value to these widgets without the boilerplate of instantiating, triggering, and disposing an `AnimationController`, you wrap the static value inside an **`AlwaysStoppedAnimation<T>(value)`**. This creates a lightweight, read-only `Animation` subclass that remains locked at that given value.
''';
