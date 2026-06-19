const String autofillGroupRnEquivalent = r'''
In React Native, autofill support is configured on individual TextInput components using two properties: `textContentType` (primarily for iOS) and `autoComplete` (primarily for Android). There is no native equivalent to a wrapper grouping component like `AutofillGroup`.

```jsx
// React Native:
import React, { useState } from 'react';
import { View, TextInput, Button, StyleSheet } from 'react-native';

const AutofillForm = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  return (
    <View style={styles.form}>
      {/* Email input field */}
      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        textContentType="emailAddress" // iOS
        autoComplete="email"           // Android
        keyboardType="email-address"
      />

      {/* Password input field */}
      <TextInput
        style={styles.input}
        placeholder="Password"
        secureTextEntry
        value={password}
        onChangeText={setPassword}
        textContentType="password"     // iOS
        autoComplete="password"       // Android
      />

      <Button title="Login" onPress={() => console.log('Login')} />
    </View>
  );
};

const styles = StyleSheet.create({
  form: { padding: 16 },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 12,
    paddingHorizontal: 8,
  },
});
```

### Key Differences
1. **Autofill Context Lifecycle Management**:
   - **Flutter**: Supports explicit control over the lifetime of autofill input contexts. Wrap fields in an `AutofillGroup`. When you complete input, calling `TextInput.finishAutofillContext()` programmatically informs the OS (iOS Password AutoFill or Android Autofill Service) to prompt the user to save/update their credentials.
   - **React Native**: Relies entirely on the native OS heuristic to detect when a form is submitted (e.g., when the keyboard is dismissed, fields are unmounted, or navigation happens). There is no standard, built-in API in React Native to programmatically finalize or submit an autofill context.

2. **Group Identification**:
   - In React Native, the OS auto-detects form fields based on proximity and text fields layout structure.
   - In Flutter, `AutofillGroup` explicitly bounds the fields. Even if there are nested child widgets between forms or inputs are separated into different custom widgets, they will be combined into a single autofill payload for the OS as long as they reside under the same `AutofillGroup`.
''';
