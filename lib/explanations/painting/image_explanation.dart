const String imageRnEquivalent = r'''
In React Native, images are rendered using the standard `<Image>` component, which supports local assets, network URIs, and temporary file paths.

### React Native Usage

```jsx
import React from 'react';
import { Image, StyleSheet, View } from 'react-native';

const ImageExample = () => (
  <View style={styles.container}>
    {/* Local Asset */}
    <Image 
      source={require('./assets/logo.png')} 
      style={styles.image} 
    />
    
    {/* Network URL */}
    <Image 
      source={{ uri: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg' }} 
      style={styles.image}
      resizeMode="cover" // equivalent to BoxFit.cover
    />
  </View>
);

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16 },
  image: { width: 200, height: 200 }
});
```

### The Difference in Flutter

Flutter uses the `Image` widget, which provides multiple dedicated constructors depending on the source of the image:

1. **Asset Images**: `Image.asset('assets/logo.png')`
2. **Network Images**: `Image.network('https://url.to/image.png')`
3. **File Images**: `Image.file(File('/path/to/image.png'))`
4. **Memory Images**: `Image.memory(uint8ListBytes)`

### Comparison of Core Props

| Feature / Prop | React Native `<Image>` | Flutter `Image` |
|:---|:---|:---|
| **Source** | `source={require(...)}` or `source={{ uri: '...' }}` | `Image.asset(...)`, `Image.network(...)`, etc. |
| **Resize Mode** | `resizeMode` ('cover', 'contain', 'stretch', 'repeat', 'center') | `fit` (`BoxFit.cover`, `BoxFit.contain`, `BoxFit.fill`, `BoxFit.none`, etc.) |
| **Loading State** | Handled manually with `onLoadStart`, `onLoadEnd` + state variables | `loadingBuilder` callback provides loading progress directly |
| **Error Handling** | Handled manually with `onError` | `errorBuilder` callback directly returns a fallback widget |
| **Alignment** | CSS styles / positioning | `alignment` (`Alignment.center`, `Alignment.topLeft`, etc.) |
| **Opacity** | Style prop `opacity: 0.5` | `opacity` property wrapped in an animation value `AlwaysStoppedAnimation(0.5)` |

In Flutter, the `Image` widget handles loading and error states as native callback parameters, removing the need to manage custom state variables just to show loading spinners or error icons.
''';
