const String heroRnEquivalent = r'''
In React Native, shared element transitions (flying an image or card from a list page into a header image on a details page) are not supported by the core framework.

Developers use libraries like `react-native-shared-element` combined with `react-navigation-shared-element` to map element bounds across navigation screens.

```jsx
// React Native: Proposing shared element transition:
import React from 'react';
import { SharedElement } from 'react-navigation-shared-element';
import { View, Image, TouchableOpacity } from 'react-native';

const ListScreen = ({ navigation }) => (
  <TouchableOpacity onPress={() => navigation.navigate('Details')}>
    {/* Wrap in SharedElement and give a unique id */}
    <SharedElement id="photo-transition-id">
      <Image source={{ uri: 'https://example.com/item.jpg' }} style={styles.thumbnail} />
    </SharedElement>
  </TouchableOpacity>
);

// In navigation config:
// You must explicitly register the element id with the stack navigator config
```

### The Difference in Flutter
Flutter includes `Hero` transitions in the core animation and navigation libraries. It requires no configuration setups on the router layer.

You simply:
1. Wrap the source widget in a `Hero` with a unique tag:
   ```dart
   Hero(
     tag: 'item-photo-123',
     child: Image.network('url'),
   )
   ```
2. Wrap the destination widget on the next route with the **exact same** tag:
   ```dart
   Hero(
     tag: 'item-photo-123',
     child: Image.network('url'),
   )
   ```

When pushing the new route via `Navigator.push`, the routing transition manager:
- Detects matching tags on both screens.
- Spawns a floating element in the app's global overlay.
- Automatically interpolates the size, aspect ratio, and coordinates to fly the widget smoothly from the source coordinates to the target coordinates.
''';
