const String listWheelScrollViewRnEquivalent = r'''
In React Native, creating a 3D cylindrical scrolling wheel selector (similar to the iOS date/time wheels) is not supported out-of-the-box in a cross-platform way.

### React Native Picker Approaches
1. **iOS Native Picker**: The standard community picker `@react-native-picker/picker` renders the native iOS cylindrical wheel style (`UIPickerView`) on iOS.
2. **Android Dropdown Picker**: On Android, that same package fallback to rendering a flat dropdown modal or dialogue, which looks completely different from the iOS cylindrical wheel style:

```jsx
// React Native - Flat picker on Android, Wheel picker on iOS:
import React, { useState } from 'react';
import { Picker } from '@react-native-picker/picker';

const OptionPicker = () => {
  const [selected, setSelected] = useState('java');
  return (
    <Picker
      selectedValue={selected}
      onValueChange={(itemValue) => setSelected(itemValue)}
    >
      <Picker.Item label="Java" value="java" />
      <Picker.Item label="JavaScript" value="js" />
    </Picker>
  );
};
```

To achieve uniform 3D cylindrical wheel layouts on both iOS and Android in React Native, developers must write complex custom math calculations using ScrollView listener matrices and Reanimated stylesheet transforms, or install highly platform-dependent, third-party packages.

### The Difference in Flutter
Because Flutter renders its own pixels directly to a canvas, it compiles a uniform 3D cylindrical wheel layout on **all platforms** (iOS, Android, Web, and Desktop) natively.

The `ListWheelScrollView` widget features:
1. **Cylindrical Projections**: It maps children onto the surface of a virtual 3D cylinder.
2. **Diameter Bending Controls**: Easily configure the perspective curvature of the cylinder using `diameterRatio`.
3. **Off-Axis Cylindrical Shifts**: Angle the scroll direction to look like a rotating dial offset from the center using `offAxisFraction`.
4. **Focused Center Magnification**: Focus attention on center items using `useMagnifier` and `magnification` settings.
5. **Item Alignment snapping**: Snap to exact choices using `FixedExtentScrollPhysics` and a `FixedExtentScrollController`.
''';
