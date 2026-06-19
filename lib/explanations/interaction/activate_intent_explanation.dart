const String activateIntentRnEquivalent = r'''
In React Native, `ActivateIntent` represents the user's keystroke command to execute or click a focused item. This is handled by mapping the Enter/Space keys in custom pressable elements on TV/Desktop platforms.

```jsx
// React Native custom press handling
const onKeyPress = (event) => {
  if (event.nativeEvent.key === 'select' || event.nativeEvent.key === 'enter') {
    triggerButtonPress();
  }
};
```

In Flutter, `ActivateIntent` is a pre-defined semantic `Intent` that requests the activation of the focused control. By default, the Flutter framework maps the `Space` and `Enter` keys on desktop, and standard gamepad buttons on mobile/console, to trigger this intent. It decouples the physical buttons from the command logic.
''';
