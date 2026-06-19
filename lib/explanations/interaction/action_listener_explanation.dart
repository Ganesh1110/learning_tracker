const String actionListenerRnEquivalent = r'''
In React Native, there is no direct counterpart to `ActionListener`. React Native developers achieve similar cleanup of action/event listeners by using the cleanup function returned from a `useEffect` hook:

```javascript
import React, { useEffect } from 'react';

const MyComponent = ({ customEventSource }) => {
  useEffect(() => {
    // Add event listener
    const subscription = customEventSource.addListener('actionTriggered', () => {
      console.log('Action occurred!');
    });

    // Return cleanup function to automatically remove listener
    return () => {
      subscription.remove();
    };
  }, [customEventSource]);

  return <Text>Listening for actions...</Text>;
};
```

In Flutter, `ActionListener` is a helper widget that wraps a subtree, listens to changes or invocations on a specific `Action`, and guarantees that the listener callback is automatically added and removed when the widget is inserted or removed from the tree.
''';
