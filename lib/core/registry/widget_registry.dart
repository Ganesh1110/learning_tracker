import 'package:learning_tracker/core/models/widget_info.dart';
import 'package:learning_tracker/core/models/widget_category.dart';
import 'package:learning_tracker/demos/layout/absorb_pointer_demo.dart';
import 'package:learning_tracker/explanations/layout/absorb_pointer_explanation.dart';
import 'package:learning_tracker/demos/layout/abstract_layout_builder_demo.dart';
import 'package:learning_tracker/explanations/layout/abstract_layout_builder_explanation.dart';
import 'package:learning_tracker/demos/painting/accumulator_demo.dart';
import 'package:learning_tracker/explanations/painting/accumulator_explanation.dart';
import 'package:learning_tracker/demos/interaction/action_demo.dart';
import 'package:learning_tracker/explanations/interaction/action_explanation.dart';
import 'package:learning_tracker/demos/interaction/action_dispatcher_demo.dart';
import 'package:learning_tracker/explanations/interaction/action_dispatcher_explanation.dart';
import 'package:learning_tracker/demos/interaction/action_listener_demo.dart';
import 'package:learning_tracker/explanations/interaction/action_listener_explanation.dart';
import 'package:learning_tracker/demos/interaction/actions_demo.dart';
import 'package:learning_tracker/explanations/interaction/actions_explanation.dart';
import 'package:learning_tracker/demos/interaction/activate_action_demo.dart';
import 'package:learning_tracker/explanations/interaction/activate_action_explanation.dart';
import 'package:learning_tracker/demos/interaction/activate_intent_demo.dart';
import 'package:learning_tracker/explanations/interaction/activate_intent_explanation.dart';
import 'package:learning_tracker/demos/layout/align_demo.dart';
import 'package:learning_tracker/explanations/layout/align_explanation.dart';
import 'package:learning_tracker/demos/painting/alignment_demo.dart';
import 'package:learning_tracker/explanations/painting/alignment_explanation.dart';
import 'package:learning_tracker/demos/painting/alignment_directional_demo.dart';
import 'package:learning_tracker/explanations/painting/alignment_directional_explanation.dart';
import 'package:learning_tracker/demos/painting/alignment_geometry_demo.dart';
import 'package:learning_tracker/explanations/painting/alignment_geometry_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_align_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_align_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_builder_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_builder_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_container_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_container_explanation.dart';
import 'package:learning_tracker/demos/animation/alignment_geometry_tween_demo.dart';
import 'package:learning_tracker/explanations/animation/alignment_geometry_tween_explanation.dart';
import 'package:learning_tracker/demos/animation/alignment_tween_demo.dart';
import 'package:learning_tracker/explanations/animation/alignment_tween_explanation.dart';
import 'package:learning_tracker/demos/animation/align_transition_demo.dart';
import 'package:learning_tracker/explanations/animation/align_transition_explanation.dart';
import 'package:learning_tracker/demos/scrolling/always_scrollable_physics_demo.dart';
import 'package:learning_tracker/explanations/scrolling/always_scrollable_physics_explanation.dart';
import 'package:learning_tracker/demos/animation/always_stopped_animation_demo.dart';
import 'package:learning_tracker/explanations/animation/always_stopped_animation_explanation.dart';
import 'package:learning_tracker/demos/layout/android_view_demo.dart';
import 'package:learning_tracker/explanations/layout/android_view_explanation.dart';
import 'package:learning_tracker/demos/layout/android_view_surface_demo.dart';
import 'package:learning_tracker/explanations/layout/android_view_surface_explanation.dart';
import 'package:learning_tracker/demos/animation/animatable_demo.dart';
import 'package:learning_tracker/explanations/animation/animatable_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_cross_fade_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_cross_fade_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_default_text_style_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_default_text_style_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_fractionally_sized_box_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_fractionally_sized_box_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_grid_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_grid_explanation.dart';
import 'package:learning_tracker/explanations/animation/animated_grid_state_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_list_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_list_explanation.dart';

final List<WidgetInfo> widgetRegistry = [
  WidgetInfo(
    name: 'AbsorbPointer',
    category: WidgetCategory.interaction,
    description:
        'A widget that absorbs pointers during hit testing, preventing its subtree from receiving pointer events.',
    rnEquivalent: absorbPointerRnEquivalent,
    demoBuilder: (_) => const AbsorbPointerDemo(),
    dartCode: '''AbsorbPointer(
  absorbing: true, // or false
  child: ElevatedButton(
    onPressed: () => print('Tapped!'),
    child: Text('Can't tap me'),
  ),
)''',
  ),
  WidgetInfo(
    name: 'AbstractLayoutBuilder',
    category: WidgetCategory.layout,
    description:
        'An abstract superclass for widgets that defer their building until the layout phase, providing constraint info to build a custom subtree (e.g. LayoutBuilder).',
    rnEquivalent: abstractLayoutBuilderRnEquivalent,
    demoBuilder: (_) => const AbstractLayoutBuilderDemo(),
    dartCode: '''LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth > 300) {
      return Row(children: [/* ... */]);
    } else {
      return Column(children: [/* ... */]);
    }
  },
)''',
  ),
  WidgetInfo(
    name: 'Accumulator',
    category: WidgetCategory.painting,
    description:
        'A mutable wrapper of an integer that can be passed by reference to track a value across a recursive stack.',
    rnEquivalent: accumulatorRnEquivalent,
    demoBuilder: (_) => const AccumulatorDemo(),
    dartCode: '''final accumulator = Accumulator(0); // initial value

void recursiveCount(Node node, Accumulator acc) {
  acc.increment(1);
  for (var child in node.children) {
    recursiveCount(child, acc);
  }
}

recursiveCount(rootNode, accumulator);
print('Visited: \${accumulator.value} nodes');''',
  ),
  WidgetInfo(
    name: 'Action<T extends Intent>',
    category: WidgetCategory.interaction,
    description:
        'The base class for defining an action or command to be performed in response to a specific user Intent, decoupling keys from functionality.',
    rnEquivalent: actionRnEquivalent,
    demoBuilder: (_) => const ActionDemo(),
    dartCode: '''// 1. Define Intent
class SaveIntent extends Intent {
  const SaveIntent();
}

// 2. Define Action
class SaveAction extends Action<SaveIntent> {
  @override
  Object? invoke(SaveIntent intent) {
    saveData();
    return null;
  }
}

// 3. Map in Shortcuts & Actions widget tree
Shortcuts(
  shortcuts: {
    const SingleActivator(LogicalKeyboardKey.keyS, control: true): const SaveIntent(),
  },
  child: Actions(
    actions: {
      SaveIntent: SaveAction(),
    },
    child: TextButton(
      onPressed: () => Actions.invoke(context, const SaveIntent()),
      child: const Text('Save'),
    ),
  ),
)''',
  ),
  WidgetInfo(
    name: 'ActionDispatcher',
    category: WidgetCategory.interaction,
    description:
        'An action dispatcher that manages action invocations, verifies if they are enabled, and executes them.',
    rnEquivalent: actionDispatcherRnEquivalent,
    demoBuilder: (_) => const ActionDispatcherDemo(),
    dartCode: '''class LoggingDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Invoking \${action.runtimeType}');
    return super.invokeAction(action, intent, context);
  }
}

// In your app root:
Actions(
  dispatcher: LoggingDispatcher(),
  actions: { ... },
  child: myApp,
)''',
  ),
  WidgetInfo(
    name: 'ActionListener',
    category: WidgetCategory.interaction,
    description:
        'A helper widget for making sure that listeners on an action are added and removed properly inside the widget lifecycle to prevent memory leaks.',
    rnEquivalent: actionListenerRnEquivalent,
    demoBuilder: (_) => const ActionListenerDemo(),
    dartCode: '''ActionListener(
  action: myAction,
  listener: (Action<Intent> action) {
    print('Action state changed: \${action.isEnabled}');
  },
  child: MyFocusedControl(),
)''',
  ),
  WidgetInfo(
    name: 'Actions',
    category: WidgetCategory.interaction,
    description:
        'A widget that maps Intents to Actions to be used by its descendants when invoking an Action.',
    rnEquivalent: actionsRnEquivalent,
    demoBuilder: (_) => const ActionsDemo(),
    dartCode: '''Actions(
  actions: <Type, Action<Intent>>{
    IncrementIntent: CounterAction(_increment),
    DecrementIntent: CounterAction(_decrement),
  },
  child: MyWidget(),
)''',
  ),
  WidgetInfo(
    name: 'ActivateAction',
    category: WidgetCategory.interaction,
    description:
        'An Action that activates the currently focused control.',
    rnEquivalent: activateActionRnEquivalent,
    demoBuilder: (_) => const ActivateActionDemo(),
    dartCode: '''Actions(
  actions: <Type, Action<Intent>>{
    ActivateIntent: ActivateAction(),
  },
  child: FocusableControl(),
)''',
  ),
  WidgetInfo(
    name: 'ActivateIntent',
    category: WidgetCategory.interaction,
    description:
        'An Intent that activates the currently focused control.',
    rnEquivalent: activateIntentRnEquivalent,
    demoBuilder: (_) => const ActivateIntentDemo(),
    dartCode: '''Shortcuts(
  shortcuts: {
    const SingleActivator(LogicalKeyboardKey.space): const ActivateIntent(),
  },
  child: Actions(
    actions: {
      ActivateIntent: ActivateAction(),
    },
    child: FocusableControl(),
  ),
)''',
  ),
  WidgetInfo(
    name: 'Align',
    category: WidgetCategory.layout,
    description:
        'A widget that aligns its child within itself and optionally sizes itself based on the child\'s size.',
    rnEquivalent: alignRnEquivalent,
    demoBuilder: (_) => const AlignDemo(),
    dartCode: '''Align(
  alignment: Alignment.topRight,
  child: Container(
    width: 50,
    height: 50,
    color: Colors.blue,
  ),
)''',
  ),
  WidgetInfo(
    name: 'AlignTransition',
    category: WidgetCategory.animation,
    description:
        'An explicit transition widget that animates the alignment of a child widget relative to its parent using an Animation<AlignmentGeometry>.',
    rnEquivalent: alignTransitionRnEquivalent,
    demoBuilder: (_) => const AlignTransitionDemo(),
    dartCode: '''AlignTransition(
  alignment: _alignmentAnimation, // Animation<AlignmentGeometry>
  child: const MyWidget(),
)''',
  ),
  WidgetInfo(
    name: 'Alignment',
    category: WidgetCategory.painting,
    description:
        'A point within a rectangle, defined by horizontal (x) and vertical (y) offsets between -1.0 and 1.0.',
    rnEquivalent: alignmentRnEquivalent,
    demoBuilder: (_) => const AlignmentDemo(),
    dartCode: '''Align(
  alignment: Alignment(-0.5, 0.8), // Custom x, y offsets
  child: MyWidget(),
)''',
  ),
  WidgetInfo(
    name: 'AlignmentDirectional',
    category: WidgetCategory.painting,
    description:
        'An offset that\'s expressed as a fraction of a Size, but whose horizontal component is dependent on the writing direction (LTR vs RTL).',
    rnEquivalent: alignmentDirectionalRnEquivalent,
    demoBuilder: (_) => const AlignmentDirectionalDemo(),
    dartCode: '''Align(
  alignment: AlignmentDirectional.topStart, // Automatically flips in RTL
  child: MyWidget(),
)''',
  ),
  WidgetInfo(
    name: 'AlignmentGeometry',
    category: WidgetCategory.painting,
    description:
        'Base class for Alignment and AlignmentDirectional that allows for text-direction aware resolution.',
    rnEquivalent: alignmentGeometryRnEquivalent,
    demoBuilder: (_) => const AlignmentGeometryDemo(),
    dartCode: '''// Accepts either Alignment or AlignmentDirectional
final AlignmentGeometry alignment = isRtl
    ? AlignmentDirectional.topStart
    : Alignment.topRight;

Align(
  alignment: alignment,
  child: MyWidget(),
)''',
  ),
  WidgetInfo(
    name: 'AlignmentGeometryTween',
    category: WidgetCategory.animation,
    description:
        'An interpolation tween between two AlignmentGeometry values, enabling smooth direction-aware layout transitions.',
    rnEquivalent: alignmentGeometryTweenRnEquivalent,
    demoBuilder: (_) => const AlignmentGeometryTweenDemo(),
    dartCode: '''AlignmentGeometryTween(
  begin: AlignmentDirectional.topStart,
  end: Alignment.bottomRight,
).animate(_controller);''',
  ),
  WidgetInfo(
    name: 'AlignmentTween',
    category: WidgetCategory.animation,
    description:
        'An interpolation tween between two absolute Alignment values, defining progress coordinates over a 2D Cartesian plane.',
    rnEquivalent: alignmentTweenRnEquivalent,
    demoBuilder: (_) => const AlignmentTweenDemo(),
    dartCode: '''AlignmentTween(
  begin: Alignment(-0.8, -0.8),
  end: Alignment(0.8, 0.8),
).animate(_controller);''',
  ),
  WidgetInfo(
    name: 'AlwaysScrollableScrollPhysics',
    category: WidgetCategory.scrolling,
    description:
        'Scroll physics that always allows scrolling gestures and bounces, even if the list content is shorter than its container viewport.',
    rnEquivalent: alwaysScrollableScrollPhysicsRnEquivalent,
    demoBuilder: (_) => const AlwaysScrollableScrollPhysicsDemo(),
    dartCode: '''ListView.builder(
  physics: const AlwaysScrollableScrollPhysics(),
  itemBuilder: (context, index) => ListTile(title: Text('Item \$index')),
)''',
  ),
  WidgetInfo(
    name: 'AlwaysStoppedAnimation',
    category: WidgetCategory.animation,
    description:
        'A subclass of Animation that remains locked at a static, constant value, avoiding full AnimationController lifecycles where Animation parameters are required.',
    rnEquivalent: alwaysStoppedAnimationRnEquivalent,
    demoBuilder: (_) => const AlwaysStoppedAnimationDemo(),
    dartCode: '''CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
)''',
  ),
  WidgetInfo(
    name: 'AndroidView',
    category: WidgetCategory.layout,
    description:
        'Embeds a native Android View inside the Flutter widget hierarchy using Virtual Display offscreen texture compositing.',
    rnEquivalent: androidViewRnEquivalent,
    demoBuilder: (_) => const AndroidViewDemo(),
    dartCode: '''AndroidView(
  viewType: 'my-native-button-view',
  creationParams: {'text': 'Click Me'},
  creationParamsCodec: const StandardMessageCodec(),
)''',
  ),
  WidgetInfo(
    name: 'AndroidViewSurface',
    category: WidgetCategory.layout,
    description:
        'Embeds a native Android view using Hybrid Composition, placing it directly inside the native view tree for full keyboard, accessibility, and overlay support.',
    rnEquivalent: androidViewSurfaceRnEquivalent,
    demoBuilder: (_) => const AndroidViewSurfaceDemo(),
    dartCode: '''PlatformViewLink(
  viewType: 'my-native-text-input',
  surfaceFactory: (context, controller) {
    return AndroidViewSurface(
      controller: controller as AndroidViewController,
      gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
      hitTestBehavior: PlatformViewHitTestBehavior.opaque,
    );
  },
  onCreatePlatformView: params.onCreatePlatformView,
)''',
  ),
  WidgetInfo(
    name: 'Animatable',
    category: WidgetCategory.animation,
    description:
        'An abstract base class for objects (like Tweens) that transform a double progress input into an output value of type T, supporting chained configurations.',
    rnEquivalent: animatableRnEquivalent,
    demoBuilder: (_) => const AnimatableDemo(),
    dartCode: '''final Animatable<double> sizeTween = Tween<double>(begin: 50.0, end: 120.0)
    .chain(CurveTween(curve: Curves.bounceOut));

double currentSize = sizeTween.evaluate(_controller);''',
  ),
  WidgetInfo(
    name: 'AnimatedCrossFade',
    category: WidgetCategory.animation,
    description:
        'A widget that cross-fades between two given children and animates its size between their sizes when the crossFadeState changes.',
    rnEquivalent: animatedCrossFadeRnEquivalent,
    demoBuilder: (_) => const AnimatedCrossFadeDemo(),
    dartCode: '''AnimatedCrossFade(
  crossFadeState: _expanded
      ? CrossFadeState.showSecond
      : CrossFadeState.showFirst,
  duration: const Duration(milliseconds: 600),
  firstCurve: Curves.easeIn,
  secondCurve: Curves.easeOut,
  sizeCurve: Curves.easeInOut,
  firstChild: const CompactCard(),
  secondChild: const ExpandedCard(),
)''',
  ),
  WidgetInfo(
    name: 'AnimatedDefaultTextStyle',
    category: WidgetCategory.animation,
    description:
        'Animated version of DefaultTextStyle that automatically transitions the default text style applied to all descendant Text widgets over a given duration.',
    rnEquivalent: animatedDefaultTextStyleRnEquivalent,
    demoBuilder: (_) => const AnimatedDefaultTextStyleDemo(),
    dartCode: '''AnimatedDefaultTextStyle(
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeInOut,
  style: TextStyle(
    fontSize: _fontSize,
    color: _color,
    fontWeight: _weight,
  ),
  child: const Text('Flutter Widgets'), // inherits the animated style
)''',
  ),
  WidgetInfo(
    name: 'AnimatedFractionallySizedBox',
    category: WidgetCategory.animation,
    description:
        'Animated version of FractionallySizedBox that automatically transitions its size fractions and alignment over a given duration whenever they change.',
    rnEquivalent: animatedFractionallySizedBoxRnEquivalent,
    demoBuilder: (_) => const AnimatedFractionallySizedBoxDemo(),
    dartCode: '''AnimatedFractionallySizedBox(
  duration: const Duration(milliseconds: 600),
  curve: Curves.easeInOut,
  widthFactor: _widthFactor,   // 0.0 to 1.0
  heightFactor: _heightFactor, // 0.0 to 1.0
  alignment: _alignment,
  child: MyWidget(),
)''',
  ),
  WidgetInfo(
    name: 'AnimatedGrid',
    category: WidgetCategory.animation,
    description:
        'A scrolling grid container that animates items when they are inserted into or removed from the grid via AnimatedGridState.',
    rnEquivalent: animatedGridRnEquivalent,
    demoBuilder: (_) => const AnimatedGridDemo(),
    dartCode: '''final GlobalKey<AnimatedGridState> _key = GlobalKey();

AnimatedGrid(
  key: _key,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  ),
  initialItemCount: _items.length,
  itemBuilder: (context, index, animation) {
    return ScaleTransition(
      scale: animation,
      child: GridTile(item: _items[index]),
    );
  },
)''',
  ),
  WidgetInfo(
    name: 'AnimatedGridState',
    category: WidgetCategory.animation,
    description:
        'The State for an AnimatedGrid, used to imperatively trigger animated item insertions and removals via insertItem() and removeItem().',
    rnEquivalent: animatedGridStateRnEquivalent,
    demoBuilder: (_) => const AnimatedGridDemo(),
    dartCode: '''// Insert an item at index:
_key.currentState!.insertItem(
  index,
  duration: const Duration(milliseconds: 400),
);

// Remove an item with exit animation:
_key.currentState!.removeItem(
  index,
  (context, animation) => ScaleTransition(
    scale: animation,
    child: tile,
  ),
  duration: const Duration(milliseconds: 300),
);''',
  ),
  WidgetInfo(
    name: 'AnimatedList',
    category: WidgetCategory.animation,
    description:
        'A scrolling list container that animates items with custom transitions when they are inserted or removed via AnimatedListState.',
    rnEquivalent: animatedListRnEquivalent,
    demoBuilder: (_) => const AnimatedListDemo(),
    dartCode: '''final GlobalKey<AnimatedListState> _key = GlobalKey();

AnimatedList(
  key: _key,
  initialItemCount: _items.length,
  itemBuilder: (context, index, animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: ListRow(item: _items[index]),
      ),
    );
  },
)''',
  ),
  WidgetInfo(
    name: 'AnimatedAlign',
    category: WidgetCategory.animation,
    description:
        'A widget that automatically transitions a child\'s position over a given duration whenever the given alignment changes.',
    rnEquivalent: animatedAlignRnEquivalent,
    demoBuilder: (_) => const AnimatedAlignDemo(),
    dartCode: '''AnimatedAlign(
  alignment: _alignment,
  curve: Curves.easeInOut,
  duration: const Duration(milliseconds: 500),
  child: const FlutterLogo(size: 50),
)''',
  ),
  WidgetInfo(
    name: 'AnimatedBuilder',
    category: WidgetCategory.animation,
    description:
        'A general-purpose widget for building animations by separating the animation controller logic from the widget rendering subtree.',
    rnEquivalent: animatedBuilderRnEquivalent,
    demoBuilder: (_) => const AnimatedBuilderDemo(),
    dartCode: '''AnimatedBuilder(
  animation: _controller,
  child: const StaticLogo(), // Cached subtree, not rebuilt
  builder: (BuildContext context, Widget? child) {
    return Transform.rotate(
      angle: _controller.value * 2.0 * math.pi,
      child: child,
    );
  },
)''',
  ),
  WidgetInfo(
    name: 'AnimatedContainer',
    category: WidgetCategory.animation,
    description:
        'A container widget that automatically animates changes to its size, padding, margin, color, border radius, and shadows.',
    rnEquivalent: animatedContainerRnEquivalent,
    demoBuilder: (_) => const AnimatedContainerDemo(),
    dartCode: '''AnimatedContainer(
  width: _width,
  height: _height,
  decoration: BoxDecoration(
    color: _color,
    borderRadius: BorderRadius.circular(_radius),
  ),
  duration: const Duration(milliseconds: 500),
  curve: Curves.fastOutSlowIn,
  child: const Center(child: Text('Animate me')),
)''',
  ),
];
