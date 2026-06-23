const String slideTransitionRnEquivalent = r'''
In React Native, sliding layout animations are configured by setting the transform style properties of an `Animated.View` component:

```javascript
<Animated.View style={{ transform: [{ translateX: animValue }] }} />
```

Note that in React Native, translations are absolute pixel values (e.g. 100px), whereas in Flutter, they are fractional offsets (e.g. Offset(1.0, 0.0) translates by exactly 100% of the child's width). To achieve fractional translation in React Native, developers must first measure view sizes in onLayout or run complex percentage math.

### Key Properties
• `position`: The Animation<Offset> driving the translate factors.
• `textDirection`: Determines which horizontal direction is LTR/RTL (affects direction logic).
• `child`: The child element being translated.
''';
