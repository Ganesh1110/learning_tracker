# Flutter Widgets Learning Tracker - Progress Analysis Report

This report analyzes the progress of the **Flutter Widgets Learning Tracker** app by comparing the implemented widgets in [widget_registry.dart](file:///Users/ganeshjayaprakash/WorkSpace/Mine/learning_tracker/lib/core/registry/widget_registry.dart) against the official Flutter widgets documentation [https://api.flutter.dev/flutter/widgets/](https://api.flutter.dev/flutter/widgets/).

## Progress Summary

| Metric | Count | Percentage |
| :--- | :---: | :---: |
| **Total API Classes** | 937 | 100% |
| **Completed Classes** | 30 | 3.2% |
| **Pending Classes** | 907 | 96.8% |

> [!NOTE]
> The official Flutter documentation contains both core user-facing **Widgets** (like `Container`, `Align`) and **Supporting Classes** (such as `State` classes, `Controllers`, `Tweens`, and helper utilities). This tracker intends to cover all major components, prioritizing concrete user-facing widgets.

## Category Breakdown

| Class Category | Completed | Pending | Total |
| :--- | :---: | :---: | :---: |
| Animation/Tween/Curve | 3 | 42 | 45 |
| Border/Radius | 0 | 19 | 19 |
| Controller | 0 | 18 | 18 |
| Intent/Action | 4 | 61 | 65 |
| Other/Supporting | 10 | 407 | 417 |
| Painter/Painting | 0 | 9 | 9 |
| Physics | 1 | 6 | 7 |
| State | 1 | 10 | 11 |
| Widget | 11 | 335 | 346 |

## Completed Widgets & Classes (30)

The following classes are fully implemented with a live interactive demo, code snippet, and React Native equivalency documentation:

| Implemented Class | Implemented Class | Implemented Class |
| :--- | :--- | :--- |
| AbsorbPointer | AbstractLayoutBuilder | Accumulator |
| Action | ActionDispatcher | ActionListener |
| Actions | ActivateAction | ActivateIntent |
| Align | AlignTransition | Alignment |
| AlignmentDirectional | AlignmentGeometry | AlignmentGeometryTween |
| AlignmentTween | AlwaysScrollableScrollPhysics | AlwaysStoppedAnimation |
| AndroidView | AndroidViewSurface | Animatable |
| AnimatedAlign | AnimatedBuilder | AnimatedContainer |
| AnimatedCrossFade | AnimatedDefaultTextStyle | AnimatedFractionallySizedBox |
| AnimatedGrid | AnimatedGridState | AnimatedList |

## Next Up: Next 20 Concrete Widgets

Following the alphabetical ordering of the documentation, the next 20 concrete widgets up for implementation are:

1. **AnimatedModalBarrier** - *A widget that prevents the user from interacting with widgets behind itself, and can be configured with an animated color value.*
2. **AnimatedSize** - *Animated widget that automatically transitions its size over a given duration whenever the given child's size changes.*
3. **AnimatedSlide** - *Widget which automatically transitions the child's offset relative to its normal position whenever the given offset changes.*
4. **AnimatedSwitcher** - *A widget that by default does a cross-fade between a new widget and the widget previously set on the AnimatedSwitcher as a child.*
5. **AnimatedWidget** - *A widget that rebuilds when the given Listenable changes value.*
6. **AnimatedWidgetBaseState** - *A base class for widgets with implicit animations that need to rebuild their widget tree as the animation runs.*
7. **AppKitView** - *Widget that contains a macOS AppKit view.*
8. **AspectRatio** - *A widget that attempts to size the child to a specific aspect ratio.*
9. **AutocompleteHighlightedOption** - *An inherited widget used to indicate which autocomplete option should be highlighted for keyboard navigation.*
10. **AutofillGroup** - *An AutofillScope widget that groups AutofillClients together.*
11. **AutofillGroupState** - *State associated with an AutofillGroup widget.*
12. **BackButtonListener** - *A convenience widget that registers a callback for when the back button is pressed.*
13. **BackdropFilter** - *A widget that applies a filter to the existing painted content and then paints child.*
14. **BackdropGroup** - *A widget that establishes a shared backdrop layer for all child BackdropFilter widgets that opt into using it.*
15. **Banner** - *Displays a diagonal message above the corner of another widget.*
16. **Baseline** - *A widget that positions its child according to the child's baseline.*
17. **BlockSemantics** - *A widget that drops the semantics of all widget that were painted before it in the same semantic container.*
18. **BoxScrollView** - *A ScrollView that uses a single child layout model.*
19. **BuildContext** - *A handle to the location of a widget in the widget tree.*
20. **Builder** - *A stateless utility widget whose build method uses its builder callback to create the widget's child.*

## Pending Concrete Widgets by Letter

There are **335** concrete widgets pending. Here is the alphabetical breakdown of these widgets:

### A (11)
`AnimatedModalBarrier`, `AnimatedSize`, `AnimatedSlide`, `AnimatedSwitcher`, `AnimatedWidget`, `AnimatedWidgetBaseState`, `AppKitView`, `AspectRatio`, `AutocompleteHighlightedOption`, `AutofillGroup`, `AutofillGroupState`

### B (10)
`BackButtonListener`, `BackdropFilter`, `BackdropGroup`, `Banner`, `Baseline`, `BlockSemantics`, `BoxScrollView`, `BuildContext`, `Builder`, `BuildOwner`

### C (21)
`CallbackShortcuts`, `CapturedThemes`, `Center`, `ClipOval`, `ClipPath`, `ClipRect`, `ClipRRect`, `ClipRSuperellipse`, `ColoredBox`, `Column`, `CompositedTransformFollower`, `CompositedTransformTarget`, `ConstrainedBox`, `ConstrainedLayoutBuilder`, `ConstraintsTransformBox`, `Container`, `CustomMultiChildLayout`, `CustomPaint`, `CustomPainter`, `CustomScrollView`, `CustomSingleChildLayout`

### D (20)
`DecoratedBox`, `DecoratedBoxTransition`, `DecoratedSliver`, `DefaultAssetBundle`, `DefaultSelectionStyle`, `DefaultTextEditingShortcuts`, `DefaultTextHeightBehavior`, `DefaultTextStyle`, `DefaultTextStyleTransition`, `DefaultWidgetsLocalizations`, `DeviceOrientationBuilder`, `Directionality`, `DisableWidgetInspectorScope`, `DismissAction`, `Dismissible`, `DismissIntent`, `DragBoundary`, `Draggable`, `DraggableScrollableActuator`, `DragTarget`

### E (8)
`Element`, `EnableWidgetInspectorScope`, `ErrorWidget`, `ExcludeFocus`, `ExcludeFocusTraversal`, `ExcludeSemantics`, `Expanded`, `Expansible`

### F (17)
`FadeTransition`, `FittedBox`, `Flex`, `Flexible`, `Flow`, `FlutterLogo`, `Focus`, `FocusableActionDetector`, `FocusNode`, `FocusTraversalGroup`, `FocusTraversalOrder`, `FocusTraversalPolicy`, `Form`, `FormFieldState`, `FormState`, `FractionallySizedBox`, `FutureBuilder`

### G (3)
`GestureDetector`, `GridPaper`, `GridView`

### H (4)
`Hero`, `HeroControllerScope`, `HeroMode`, `HtmlElementView`

### I (17)
`Icon`, `IconTheme`, `IgnoreBaseline`, `IgnorePointer`, `Image`, `ImplicitlyAnimatedWidget`, `ImplicitlyAnimatedWidgetState`, `IndexedSemantics`, `InheritedElement`, `InheritedModel`, `InheritedNotifier`, `InheritedTheme`, `InheritedWidget`, `InspectorReferenceData`, `InteractiveViewer`, `IntrinsicHeight`, `IntrinsicWidth`

### K (3)
`Key`, `KeyboardListener`, `KeyedSubtree`

### L (11)
`LayoutBuilder`, `LeafRenderObjectElement`, `LeafRenderObjectWidget`, `LexicalFocusOrder`, `LimitedBox`, `ListBody`, `ListenableBuilder`, `Listener`, `ListView`, `ListWheelScrollView`, `LocalizationsDelegate`

### M (6)
`MatrixTransition`, `MergeSemantics`, `ModalBarrier`, `MouseRegion`, `MultiChildRenderObjectElement`, `MultiChildRenderObjectWidget`

### N (7)
`NavigationToolbar`, `Navigator`, `NavigatorState`, `NestedScrollView`, `Notification`, `NotificationListener`, `NumericFocusOrder`

### O (10)
`Offstage`, `Opacity`, `OrderedTraversalPolicy`, `OrientationBuilder`, `OverflowBar`, `OverflowBox`, `OverlayEntry`, `OverlayPortal`, `OverlayRoute`, `OverscrollNotification`

### P (20)
`Padding`, `PageStorage`, `PageStorageKey`, `PageView`, `ParentDataElement`, `ParentDataWidget`, `PhysicalModel`, `PhysicalShape`, `PinnedHeaderSliver`, `Placeholder`, `PlatformMenuDelegate`, `PlatformSelectableRegionContextMenu`, `PopupRoute`, `Positioned`, `PositionedDirectional`, `PositionedTransition`, `PreferredSize`, `PreferredSizeWidget`, `ProxyElement`, `ProxyWidget`

### R (28)
`RawAutocomplete`, `RawGestureDetector`, `RawImage`, `RawKeyboardListener`, `RawMenuAnchor`, `RawScrollbarState`, `RawTooltip`, `RawView`, `RelativePositionedTransition`, `RenderBox`, `RenderObjectElement`, `RenderObjectWidget`, `RenderSliverOverlapAbsorber`, `RenderSliverOverlapInjector`, `ReorderableDelayedDragStartListener`, `ReorderableDragStartListener`, `RepaintBoundary`, `RepeatingAnimationBuilder`, `RestorationScope`, `RootRestorationScope`, `RootWidget`, `RotatedBox`, `RotationTransition`, `RouteInformationParser`, `RouteInformationProvider`, `RouterConfig`, `RouterDelegate`, `Row`

### S (93)
`SafeArea`, `ScaleTransition`, `Scrollable`, `ScrollableDetails`, `ScrollableState`, `ScrollBehavior`, `ScrollConfiguration`, `ScrollContext`, `ScrollController`, `ScrollEndNotification`, `ScrollMetricsNotification`, `ScrollPhysics`, `ScrollStartNotification`, `ScrollUpdateNotification`, `ScrollView`, `SelectableRegion`, `SelectionRegistrarScope`, `Semantics`, `SemanticsDebugger`, `SensitiveContent`, `SensitiveContentHost`, `ShaderMask`, `ShortcutRegistrar`, `Shortcuts`, `ShrinkWrappingViewport`, `SingleChildRenderObjectElement`, `SingleChildRenderObjectWidget`, `SingleChildScrollView`, `SizeChangedLayoutNotifier`, `SizedBox`, `SizedOverflowBox`, `SizeTransition`, `SlideTransition`, `SliverAnimatedGrid`, `SliverAnimatedGridState`, `SliverAnimatedList`, `SliverAnimatedListState`, `SliverAnimatedOpacity`, `SliverChildBuilderDelegate`, `SliverChildDelegate`, `SliverChildListDelegate`, `SliverConstrainedCrossAxis`, `SliverCrossAxisGroup`, `SliverEnsureSemantics`, `SliverFadeTransition`, `SliverFillRemaining`, `SliverFillViewport`, `SliverFixedExtentList`, `SliverFloatingHeader`, `SliverGrid`, `SliverIgnorePointer`, `SliverLayoutBuilder`, `SliverList`, `SliverMainAxisGroup`, `SliverMultiBoxAdaptorElement`, `SliverMultiBoxAdaptorWidget`, `SliverOffstage`, `SliverOpacity`, `SliverOverlapAbsorber`, `SliverOverlapAbsorberHandle`, `SliverOverlapInjector`, `SliverPadding`, `SliverPersistentHeader`, `SliverPersistentHeaderDelegate`, `SliverPrototypeExtentList`, `SliverReorderableList`, `SliverReorderableListState`, `SliverResizingHeader`, `SliverSafeArea`, `SliverSemantics`, `SliverToBoxAdapter`, `SliverVariedExtentList`, `SliverVisibility`, `SliverWithKeepAliveWidget`, `SlottedMultiChildRenderObjectWidget`, `SlottedRenderObjectElement`, `SnapshotController`, `SnapshotPainter`, `SnapshotWidget`, `Spacer`, `Stack`, `StadiumBorder`, `StarBorder`, `State`, `StatefulBuilder`, `StatefulElement`, `StatefulWidget`, `StatelessElement`, `StatelessWidget`, `StatusTransitionWidget`, `StreamBuilder`, `StreamBuilderBase`, `StretchEffect`

### T (20)
`Table`, `TableBorder`, `TableCell`, `TapRegion`, `TapRegionRegistry`, `TapRegionSurface`, `TextBox`, `TextFieldTapRegion`, `TextSelectionControls`, `TickerMode`, `Title`, `Transform`, `TreeSliver`, `TreeSliverController`, `TreeSliverNode`, `TweenAnimationBuilder`, `TwoDimensionalScrollable`, `TwoDimensionalScrollableState`, `TwoDimensionalScrollView`, `TwoDimensionalViewport`

### U (4)
`UiKitView`, `UnconstrainedBox`, `UniqueWidget`, `UnmanagedRestorationScope`

### V (4)
`ValueListenableBuilder`, `View`, `ViewAnchor`, `Viewport`

### W (18)
`Widget`, `WidgetInspector`, `WidgetOrderTraversalPolicy`, `WidgetsApp`, `WidgetsBindingObserver`, `WidgetsFlutterBinding`, `WidgetSpan`, `WidgetStateBorderSide`, `WidgetStateColor`, `WidgetStateMapper`, `WidgetStateMouseCursor`, `WidgetStateOutlinedBorder`, `WidgetStateProperty`, `WidgetStatePropertyAll`, `WidgetStatesController`, `WidgetStateTextStyle`, `WidgetToRenderBoxAdapter`, `Wrap`
