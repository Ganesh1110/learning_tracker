const String clipRrectRnEquivalent = r'''
In React Native, clipping a child component to a rounded rectangular boundary is achieved by setting the `borderRadius` (or individual corner radius properties like `borderTopLeftRadius`) on a parent `View` and combining it with `overflow: 'hidden'`.

```jsx
// React Native:
import React from 'react';
import { View, Image, StyleSheet } from 'react-native';

const RoundedImageCard = () => {
  return (
    <View style={styles.cardContainer}>
      <Image
        source={{ uri: 'https://placekitten.com/200/160' }}
        style={styles.image}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  cardContainer: {
    width: 200,
    height: 160,
    borderRadius: 24, // Set the corner radius
    overflow: 'hidden', // Clips the image child to the rounded corners
    backgroundColor: '#333',
  },
  image: {
    width: '100%',
    height: '100%',
  },
});
```

### Key Differences
1. **Asymmetric Rounded Rectangles**:
   - **React Native**: Supports asymmetric corners by using individual corner styles (e.g. `borderTopLeftRadius: 32`, `borderBottomRightRadius: 32`). Combined with `overflow: 'hidden'`, it clips children to that custom asymmetric shape.
   - **Flutter**: Supports asymmetric corner clipping by using the standard **`ClipRRect`** widget and passing a detailed `BorderRadius` layout (such as `BorderRadius.only(...)` or `BorderRadius.horizontal(...)`) to the `borderRadius` parameter.

2. **Performance of Rounded Clip vs. Decorative Styles**:
   - **React Native**: Applying `borderRadius` and `overflow: 'hidden'` is standard for basic layout nodes, but on older rendering configurations it could cause minor screen tearing or jagged edges on some platforms.
   - **Flutter**: Like all clipping widgets, `ClipRRect` should only be used when clipping actual child content (like an image or a complex interactive map) is required. If you only need to show a decorated container with a solid color, gradient, or simple border, it is much more performant to use the `decoration` property of a `Container` or `DecoratedBox` with `BorderRadius`, which draws the rounded box directly on the screen canvas without pushing a clipping mask to the rendering pipeline.

3. **Programmatic Insetting and Offsets**:
   - **React Native**: Clipping bounds are bound to the layout box bounds. You cannot easily clip to a smaller rounded rectangle that is offset from the container's layout boundary without adding extra spacer elements.
   - **Flutter**: You can supply a custom `clipper` (`CustomClipper<RRect>`) to `ClipRRect`, which allows you to programmatically define a custom `RRect` bounding shape (including customized offsets and radii) independently of the widget's actual layout box size.
''';
