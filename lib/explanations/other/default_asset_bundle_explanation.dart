const String defaultAssetBundleRnEquivalent = r'''
In React Native, managing and loading local asset resources (like images, JSON files, or configurations) is handled by the Metro bundler using the static `require()` statement or modern ES module `import` statements. Metro resolves assets compile-time, packaging them directly into the bundle.

Here is how React Native handles static local asset loading:

```jsx
// React Native:
import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet } from 'react-native';

// Static asset bundle resolution at compile-time
const localConfig = require('./assets/data/config.json');

const ConfigViewerExample = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Loaded local config:</Text>
      <Text>User: {localConfig.profileName}</Text>
      <Text>Role: {localConfig.userRole}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: { padding: 16, backgroundColor: '#f3f4f6', borderRadius: 12 },
  title: { fontWeight: 'bold', marginBottom: 8 }
});
```

### Key Differences
1. **Dynamic Runtime Bundles vs Compile-Time Bundler Requires**:
   - **React Native**: Since Metro bundler evaluates `require()` statements statically during the compilation phase, you cannot dynamic pass resource filepaths at runtime (e.g. `require('./assets/data/' + profile + '.json')` throws a bundler error).
   - **Flutter**: Flutter divides resource paths into runtime virtual directories. You can request any asset path at runtime programmatically via `rootBundle.loadString('assets/data/config.json')`.

2. **Scoped Dependency Injection via Context**:
   - **React Native**: If you need to mock or change the resource file dynamically based on testing profiles, locale settings, or user accounts, you must rely on standard JavaScript module mocking (like Jest mocks during test suites) or manually passing custom data props down the component tree.
   - **Flutter**: Flutter uses the **`DefaultAssetBundle`** widget to establish a scoped asset bundle configuration in the widget tree. Any child widget calling `DefaultAssetBundle.of(context)` resolves the nearest bundle registered above it in the context tree. This allows developers to dynamically inject custom mock bundles, localization resources, or sandbox configurations for specific subtrees of widgets without changing the underlying loading paths.
''';
