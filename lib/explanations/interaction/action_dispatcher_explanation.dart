const String actionDispatcherRnEquivalent = r'''
In React Native, dispatching commands or actions to trigger business logic is typically done using:
1. **Redux Dispatcher**: The `dispatch(action)` method returned by the `useDispatch` hook, which broadcasts actions to all reducers.
2. **Custom Event Emitters**: Custom dispatcher classes that manage a map of event listeners and invoke them.

```javascript
// React Native / Redux equivalent:
import { useDispatch } from 'react-redux';

const MyComponent = () => {
  const dispatch = useDispatch();

  const handleAction = () => {
    // Dispatches a command to be handled globally
    dispatch({ type: 'INCREMENT_COUNTER', payload: 1 });
  };

  return <Button title="Trigger" onPress={handleAction} />;
};
```

In Flutter, `ActionDispatcher` is the class responsible for invoking actions. It verifies if an action is enabled and executes it. By extending `ActionDispatcher`, you can create a custom dispatcher to intercept, log, or store a history of all user commands triggered in your application (useful for analytics or implementing undo/redo features).
''';
