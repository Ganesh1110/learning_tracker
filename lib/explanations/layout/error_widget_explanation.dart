const String errorWidgetRnEquivalent = r'''
In React Native, unhandled runtime exceptions inside the rendering tree will crash the JavaScript thread, leading to a screen freeze or full application crash. 

To mitigate this, developers use React **Error Boundaries** (special class components implementing `componentDidCatch` and `getDerivedStateFromError`) to catch children errors and render fallback UI.

```jsx
// React Native: Declaring an Error Boundary:
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

class ErrorBoundary extends React.Component {
  state = { hasError: false };

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.log('Logged error:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <View style={styles.errorContainer}>
          <Text style={styles.errorTitle}>Something went wrong.</Text>
        </View>
      );
    }
    return this.props.children;
  }
}

const styles = StyleSheet.create({
  errorContainer: { padding: 20, backgroundColor: 'red', alignItems: 'center' },
  errorTitle: { color: 'white', fontWeight: 'bold' }
});
```

### The Difference in Flutter
Flutter is designed to be highly resilient against build-time failures. When a widget's `build` method throws an exception during rendering, Flutter catches it and renders the `ErrorWidget` returned by `ErrorWidget.builder` *in place of* the failing widget, keeping the rest of the application active.

Key points:
1. **Debug Mode**: Renders the famous red screen with yellow lettering containing full stack trace details.
2. **Release Mode**: By default, renders a silent grey box.
3. **Global Customization**: You can globally override `ErrorWidget.builder` in your `main()` function to render a custom branded error page for all crashes:
   ```dart
   void main() {
     ErrorWidget.builder = (FlutterErrorDetails details) {
       return MyCustomErrorScreen(details: details);
     };
     runApp(const MyApp());
   }
   ```
''';
