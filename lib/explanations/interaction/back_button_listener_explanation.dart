const String backButtonListenerRnEquivalent = r'''
In React Native, intercepting the hardware back button (primarily on Android and Android TV devices) is handled imperatively using the `BackHandler` API.

```jsx
// React Native:
import React, { useEffect, useState } from 'react';
import { View, Text, Button, Alert, BackHandler } from 'react-native';

const WizardScreen = () => {
  const [step, setStep] = useState(1);

  useEffect(() => {
    const handleBackPress = () => {
      if (step > 1) {
        setStep(step - 1);
        return true; // Return true to prevent default back behavior (intercepted)
      }

      Alert.alert(
        'Exit Wizard',
        'Do you want to discard your progress?',
        [
          { text: 'Cancel', onPress: () => null, style: 'cancel' },
          { text: 'Exit', onPress: () => BackHandler.exitApp() },
        ]
      );
      return true; // Keep true to handle dialog asynchronously
    };

    // Register event listener
    const subscription = BackHandler.addEventListener(
      'hardwareBackPress',
      handleBackPress
    );

    // Clean up event listener on unmount
    return () => subscription.remove();
  }, [step]); // Re-run effect whenever step changes to capture correct state

  return (
    <View style={{ padding: 16 }}>
      <Text>Step {step} of 3</Text>
      <Button title="Next" onPress={() => step < 3 && setStep(step + 1)} />
    </View>
  );
};
```

### Key Differences
1. **Declarative Component vs. Imperative API**:
   - **Flutter**: **`BackButtonListener`** is a declarative widget. You place it directly in your widget tree, passing in your navigation check callback. Flutter takes care of registering it with the platform navigation services and removing the listener automatically during the widget's lifecycle.
   - **React Native**: Uses `BackHandler` which is an imperative event emitter. You must manually call `.addEventListener` inside a `useEffect` hook and ensure you return a clean-up function to call `.remove()` to avoid memory leaks.

2. **Scoping**:
   - Flutter's `BackButtonListener` respects the widget tree hierarchy. If multiple `BackButtonListener` widgets are active, the one closest to the active leaf in the widget tree will intercept the press first.
   - React Native's `BackHandler` uses a stack-based event queue. Event listeners are invoked in reverse order of registration (the last registered listener is called first).
''';
