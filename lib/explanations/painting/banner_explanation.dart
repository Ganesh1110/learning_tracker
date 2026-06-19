const String bannerRnEquivalent = r'''
In React Native, displaying a diagonal badge banner (like a "NEW" or "SALE" tag) over the corner of a card requires setting up absolute positioning, clipping, and rotation transforms manually.

```jsx
// React Native:
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const ProductCard = () => {
  return (
    <View style={styles.card}>
      {/* Product Thumbnail content here */}
      <View style={styles.thumbnail} />

      {/* Manual diagonal banner badge overlay */}
      <View style={styles.bannerContainer}>
        <View style={styles.banner}>
          <Text style={styles.bannerText}>SALE</Text>
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    width: 200,
    height: 250,
    backgroundColor: '#fff',
    borderRadius: 12,
    elevation: 3,
    overflow: 'hidden', // Required to clip the banner's overflow
    position: 'relative',
  },
  thumbnail: { flex: 1, backgroundColor: '#f0f0f0' },
  bannerContainer: {
    position: 'absolute',
    top: 0,
    right: 0,
    width: 80,
    height: 80,
    overflow: 'hidden', // Clip the rotated banner ribbon inside this square
  },
  banner: {
    backgroundColor: 'red',
    position: 'absolute',
    top: 15,
    right: -25,
    width: 110,
    paddingVertical: 4,
    transform: [{ rotate: '45deg' }], // Rotate diagonally
    alignItems: 'center',
    justifyContent: 'center',
  },
  bannerText: {
    color: 'white',
    fontSize: 10,
    fontWeight: 'bold',
    letterSpacing: 1,
  },
});
```

### Key Differences
1. **Compositing vs. Manual Layout Math**:
   - **Flutter**: The **`Banner`** widget computes the layout coordinates, diagonal dimensions, angles, and translations mathematically under the hood based on the `BannerLocation` enum (e.g. `topStart`, `bottomEnd`). You do not need to guess offsets or worry about clipping values.
   - **React Native**: Requires manual layout math. You must hardcode absolute styles (like `right: -25`, `top: 15`), rotation angles (`45deg` or `-45deg`), and apply `overflow: 'hidden'` on the parent card to hide the excess banner ribbon protruding outside the border radius.

2. **Built-in Placement Options**:
   - Flutter's `Banner` supports 4 directions out of the box via `BannerLocation`. In React Native, switching a banner from top-right to bottom-left requires changing the rotation sign (e.g. `-45deg`) and altering the absolute positioning styles entirely.
''';
