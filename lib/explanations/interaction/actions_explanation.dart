const String actionsRnEquivalent = r'''
In React Native, mapping event action types to handler callbacks is typically done using:
1. **React Context**: Exposing event handler methods from a top-level provider to all descendent widgets.
2. **Redux / Reducer Dispatchers**: Mapping action names (`type: 'SELECT_ITEM'`) to reducer cases.

```jsx
// React Native Context Mapping equivalent:
import React, { createContext, useContext } from 'react';
import { View, Button } from 'react-native';

const ActionsContext = createContext({
  save: () => {},
  delete: () => {},
});

const ParentActions = ({ children }) => {
  const actions = {
    save: () => console.log('Saving...'),
    delete: () => console.log('Deleting...'),
  };

  return (
    <ActionsContext.Provider value={actions}>
      {children}
    </ActionsContext.Provider>
  );
};

const SaveButton = () => {
  const { save } = useContext(ActionsContext); // Access action by intent
  return <Button title="Save" onPress={save} />;
};
```

In Flutter, the `Actions` widget maps an `Intent` (class type) to a concrete `Action` subclass. Any descendant widget in the tree can invoke that action using `Actions.invoke(context, const SaveIntent())` without direct dependency on the handler function itself.
''';
