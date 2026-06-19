const String accumulatorRnEquivalent = r'''
In React Native and standard JavaScript/TypeScript, there is no specialized class like `Accumulator`. Because JavaScript primitive values (like numbers) are passed by value rather than by reference, the standard pattern to track mutable counts across recursive functions is to pass a mutable wrapper object.

```javascript
// React Native / JS equivalent pattern:
const accumulator = { value: 0 };

const countNodesRecursively = (node, acc) => {
  acc.value += 1; // Mutates the value property
  
  if (node.children) {
    node.children.forEach(child => countNodesRecursively(child, acc));
  }
};

countNodesRecursively(rootNode, accumulator);
console.log(`Total nodes visited: ${accumulator.value}`);
```

In Flutter, the `Accumulator` class (from `package:flutter/painting.dart`) is a native utility that serves exactly this purpose. It encapsulates an integer state that can be passed as a reference to track running counts across recursive calls or painting tasks.
''';
