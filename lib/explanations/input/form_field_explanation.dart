const String formFieldRnEquivalent = r'''
In React Native, when you build a custom input control (like a star rating selector, tag selector, or switch) and need to integrate it with validation systems like React Hook Form, you wrap it in a `<Controller>` component.

```jsx
// React Native: Wrapping a custom star rating inside a Hook Form Controller:
import React from 'react';
import { View, TouchableOpacity, Text, StyleSheet } from 'react-native';
import { useForm, Controller } from 'react-hook-form';

const StarSelector = () => {
  const { control, handleSubmit, formState: { errors } } = useForm();

  return (
    <View style={styles.container}>
      <Controller
        control={control}
        name="rating"
        rules={{ required: true, min: 1 }}
        render={({ field: { onChange, value } }) => (
          <View style={styles.starsRow}>
            {[1, 2, 3, 4, 5].map((star) => (
              <TouchableOpacity key={star} onPress={() => onChange(star)}>
                <Text style={{ fontSize: 32, color: value >= star ? 'gold' : 'grey' }}>★</Text>
              </TouchableOpacity>
            ))}
          </View>
        )}
      />
      {errors.rating && <Text style={styles.errorText}>Please select a rating.</Text>}
    </View>
  );
};
```

### The Difference in Flutter
Flutter provides `FormField<T>` in the core widgets library to perform the exact same job as the Hook Form `<Controller>`. 

It is a generic wrapper widget that manages the state of a single input:

1. **initialValue & validator**: Specifies the initial type `T` value and registers validation rules.
2. **builder**: Yields a `FormFieldState<T>`. Inside this builder, you:
   - Access `state.value` to render the correct UI selection.
   - Call `state.didChange(newValue)` when the user interacts, updating the state value and triggering a repaint of the input.
   - Query `state.hasError` and `state.errorText` to conditionally render red outlines or helper error labels.
3. **Integration**: Because it is a `FormField`, it automatically registers with any ancestor `Form` widget, letting you call validate, save, or reset globally.
''';
