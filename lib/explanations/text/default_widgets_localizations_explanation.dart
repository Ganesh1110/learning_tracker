const String defaultWidgetsLocalizationsRnEquivalent = r'''
In React Native, internationalization (i18n) and localizations are typically handled using third-party packages like `i18next`, `react-i18next`, or expo-specific libraries (`expo-localization`).

```jsx
// React Native: Using react-i18next provider:
import React from 'react';
import { Text, View } from 'react-native';
import { useTranslation, Translation } from 'react-i18next';

// 1. Strings are resolved via hooks or HOCs from the i18n Context
const MyComponent = () => {
  const { t, i18n } = useTranslation();

  const changeLanguage = (lng) => {
    i18n.changeLanguage(lng);
  };

  return (
    <View>
      <Text>{t('welcome_message')}</Text>
    </View>
  );
};
```

### The Difference in Flutter
Flutter incorporates localization directly into the core widget library. The `Localizations` widget utilizes a list of `LocalizationsDelegate` subclasses to load locale-specific assets or settings:

1. **DefaultWidgetsLocalizations.delegate**: A basic delegate that resolves minimal localization values needed for layout and widgets (such as the default `TextDirection`). It does not require any external resource bundles.
2. **WidgetsLocalizations**: The parent class containing values resolved by the delegate. You access it anywhere via `WidgetsLocalizations.of(context)`.

By embedding `DefaultWidgetsLocalizations.delegate` in your app's delegate lists, core elements (like layout grids, keyboard shortcuts, scroll physics, and text direction) immediately adapt to the target locale.
''';
