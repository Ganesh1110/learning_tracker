const String builderRnEquivalent = r'''
In React Native, accessing a Context value (using the `useContext` hook or `<Context.Consumer>` component) requires that the component invoking the hook is a descendant of the `<Context.Provider>` in the render tree.

If you try to declare a Provider and consume it in the same functional component, it will fail because the hook resolves against the context above the current component.

```jsx
// React Native (Failure case):
const App = () => {
  // 1. Declare provider
  // 2. Try to consume it in the same component -> FAIL! (returns default value)
  const theme = useContext(ThemeContext); 
  
  return (
    <ThemeContext.Provider value="dark">
      <View style={{ backgroundColor: theme === 'dark' ? '#000' : '#fff' }} />
    </ThemeContext.Provider>
  );
};
```

To resolve this, you must split the consumption into a sub-component:

```jsx
// React Native (Fix via Sub-Component):
const ThemeView = () => {
  const theme = useContext(ThemeContext); // WORKS! Sub-component is a descendant
  return <View style={{ backgroundColor: theme === 'dark' ? '#000' : '#fff' }} />;
};

const App = () => {
  return (
    <ThemeContext.Provider value="dark">
      <ThemeView />
    </ThemeContext.Provider>
  );
};
```

### Key Differences
1. **Implicit Builder Callback vs. Explicit Sub-Components**:
   - **React Native**: Developers typically resolve context nesting issues by extracting layout sub-trees into distinct, separate functional components (e.g. creating `ThemeView` as a separate component).
   - **Flutter**: You can achieve the same separation inline without leaving the current build method using the **`Builder`** widget. The `Builder` takes a `builder` callback containing a nested `BuildContext`. This nested context sits *below* any widgets introduced above the `Builder` in the same build block.

2. **Inline Context Scoping**:
   - `Builder` acts as a micro-component wrapper. It is commonly used in Flutter when code needs to lookup a `Scaffold` ancestor (e.g. `Scaffold.of(context)`) or retrieve theme settings (e.g. `Theme.of(context)`) in the same build block that instantiates the provider/controller.
''';
