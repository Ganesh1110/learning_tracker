const String blockSemanticsRnEquivalent = r'''
In React Native, making an overlay or modal component block accessibility focus from reaching the background layout elements is accomplished on the overlay container view. This requires combining two properties for cross-platform compatibility: `accessibilityViewIsModal` (iOS) and `importantForAccessibility` (Android).

```jsx
// React Native:
import React from 'react';
import { View, Text, Modal, StyleSheet } from 'react-native';

const AccessibilityModal = ({ visible, onClose }) => {
  return (
    <Modal visible={visible} transparent animationType="fade">
      {/* Background Dim Backdrop */}
      <View style={styles.backdrop}>
        
        {/* Modal Overlay Box:
            1. accessibilityViewIsModal={true} hides background nodes on iOS.
            2. importantForAccessibility="no-hide-descendants" is handled on background 
               elements or modal parent elements on Android.
        */}
        <View 
          style={styles.modal}
          accessibilityViewIsModal={true} // iOS: Blocks screen reader from looking behind
          accessibilityRole="alert"
        >
          <Text style={styles.title}>Security Prompt</Text>
          <Text>Please confirm details below.</Text>
        </View>

      </View>
    </Modal>
  );
};
```

### Key Differences
1. **Declarative Component vs. Container Attributes**:
   - **Flutter**: Accessibility blocking is represented declaratively as a widget wrapper: **`BlockSemantics`**. Any subtree wrapped in `BlockSemantics(blocking: true, child: ...)` will tell the platform accessibility bridge (iOS VoiceOver / Android TalkBack) to completely drop the semantic properties of any widgets painted *before* or *behind* it in the same semantic node layer.
   - **React Native**: Relies on specific view-container flags (`accessibilityViewIsModal`) which Yoga passes to platform views. On Android, you often must manually flag the underlying background container with `importantForAccessibility="no-hide-descendants"` or toggle `aria-hidden={true}` to hide background controls while a modal dialog overlay is displayed.

2. **Implicit in Scaffold Dialogs**:
   - In Flutter, standard overlays like `showDialog`, `showModalBottomSheet`, and `Drawer` wrap their contents in `BlockSemantics` automatically. You rarely need to write `BlockSemantics` manually unless building a completely custom overlay stack.
   - In React Native, utilizing standard `<Modal>` components handles this overlay isolation natively, but custom absolute-positioned overlays (such as custom drawer components) require manual toggle settings on all sibling background views.
''';
