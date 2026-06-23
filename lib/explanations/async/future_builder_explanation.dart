const String futureBuilderRnEquivalent = r'''
In React Native, resolving a Promise (like a fetch API call) requires manually managing multiple local state variables (`data`, `loading`, `error`) and running the async operation inside a `useEffect` hook on mount.

```jsx
// React Native: Handling async lifecycle:
import React, { useState, useEffect } from 'react';
import { View, ActivityIndicator, Text, StyleSheet } from 'react-native';

const FetchDemo = () => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('https://api.example.com/profile')
      .then((res) => res.json())
      .then((json) => {
        setData(json);
        setLoading(false);
      })
      .catch((err) => {
        setError(err.message);
        setLoading(false);
      });
  }, []);

  if (loading) return <ActivityIndicator size="large" />;
  if (error) return <Text style={styles.error}>Error: {error}</Text>;

  return (
    <View style={styles.card}>
      <Text style={styles.name}>{data.name}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  error: { color: 'red' },
  card: { padding: 16, borderWith: 1 }
});
```

### The Difference in Flutter
Flutter provides `FutureBuilder` to handle the asynchronous lifecycle declaratively. It abstracts away all the local state variables (`loading`, `error`, `data`) and automatically listens to the resolution of a given `Future`:

```dart
FutureBuilder<String>(
  future: _fetchMyProfile(), // Future<String>
  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
    // 1. Loading State
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }
    
    // 2. Failure State
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    
    // 3. Success State
    if (snapshot.hasData) {
      return Text('Hello, ${snapshot.data}');
    }
    
    return const Text('Unresolved State');
  },
)
```

### Key Rules:
- **Avoid recreating Futures**: Do **not** instantiate the future inline inside the `build()` method (e.g. `future: _fetchMyProfile()`). Because `build()` is called frequently, it would re-trigger a new API call on every rebuild. Instead, trigger the future once inside `initState()` and pass the cached reference to `FutureBuilder`.
''';
