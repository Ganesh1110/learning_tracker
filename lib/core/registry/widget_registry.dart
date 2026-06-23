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
import 'package:learning_tracker/demos/animation/animated_modal_barrier_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_modal_barrier_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_size_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_size_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_slide_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_slide_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_switcher_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_switcher_explanation.dart';
import 'package:learning_tracker/demos/animation/animated_widget_demo.dart';
import 'package:learning_tracker/explanations/animation/animated_widget_explanation.dart';
import 'package:learning_tracker/demos/layout/aspect_ratio_demo.dart';
import 'package:learning_tracker/explanations/layout/aspect_ratio_explanation.dart';
import 'package:learning_tracker/demos/input/autofill_group_demo.dart';
import 'package:learning_tracker/explanations/input/autofill_group_explanation.dart';
import 'package:learning_tracker/demos/interaction/back_button_listener_demo.dart';
import 'package:learning_tracker/explanations/interaction/back_button_listener_explanation.dart';
import 'package:learning_tracker/demos/painting/backdrop_filter_demo.dart';
import 'package:learning_tracker/explanations/painting/backdrop_filter_explanation.dart';
import 'package:learning_tracker/demos/painting/banner_demo.dart';
import 'package:learning_tracker/explanations/painting/banner_explanation.dart';
import 'package:learning_tracker/demos/layout/baseline_demo.dart';
import 'package:learning_tracker/explanations/layout/baseline_explanation.dart';
import 'package:learning_tracker/demos/interaction/block_semantics_demo.dart';
import 'package:learning_tracker/explanations/interaction/block_semantics_explanation.dart';
import 'package:learning_tracker/demos/scrolling/box_scroll_view_demo.dart';
import 'package:learning_tracker/explanations/scrolling/box_scroll_view_explanation.dart';
import 'package:learning_tracker/demos/layout/builder_demo.dart';
import 'package:learning_tracker/explanations/layout/builder_explanation.dart';
import 'package:learning_tracker/demos/interaction/callback_shortcuts_demo.dart';
import 'package:learning_tracker/explanations/interaction/callback_shortcuts_explanation.dart';
import 'package:learning_tracker/demos/layout/center_demo.dart';
import 'package:learning_tracker/explanations/layout/center_explanation.dart';
import 'package:learning_tracker/demos/painting/clip_oval_demo.dart';
import 'package:learning_tracker/explanations/painting/clip_oval_explanation.dart';
import 'package:learning_tracker/demos/painting/clip_path_demo.dart';
import 'package:learning_tracker/explanations/painting/clip_path_explanation.dart';
import 'package:learning_tracker/demos/painting/clip_rect_demo.dart';
import 'package:learning_tracker/explanations/painting/clip_rect_explanation.dart';
import 'package:learning_tracker/demos/painting/clip_rrect_demo.dart';
import 'package:learning_tracker/explanations/painting/clip_rrect_explanation.dart';
import 'package:learning_tracker/demos/painting/clip_r_superellipse_demo.dart';
import 'package:learning_tracker/explanations/painting/clip_r_superellipse_explanation.dart';
import 'package:learning_tracker/demos/painting/colored_box_demo.dart';
import 'package:learning_tracker/explanations/painting/colored_box_explanation.dart';
import 'package:learning_tracker/demos/layout/column_demo.dart';
import 'package:learning_tracker/explanations/layout/column_explanation.dart';
import 'package:learning_tracker/demos/layout/composited_transform_target_demo.dart';
import 'package:learning_tracker/explanations/layout/composited_transform_target_explanation.dart';
import 'package:learning_tracker/explanations/layout/composited_transform_follower_explanation.dart';
import 'package:learning_tracker/demos/layout/constrained_box_demo.dart';
import 'package:learning_tracker/explanations/layout/constrained_box_explanation.dart';
import 'package:learning_tracker/demos/layout/constrained_layout_builder_demo.dart';
import 'package:learning_tracker/explanations/layout/constrained_layout_builder_explanation.dart';
import 'package:learning_tracker/demos/layout/constraints_transform_box_demo.dart';
import 'package:learning_tracker/explanations/layout/constraints_transform_box_explanation.dart';
import 'package:learning_tracker/demos/layout/container_demo.dart';
import 'package:learning_tracker/explanations/layout/container_explanation.dart';
import 'package:learning_tracker/demos/layout/custom_multi_child_layout_demo.dart';
import 'package:learning_tracker/explanations/layout/custom_multi_child_layout_explanation.dart';
import 'package:learning_tracker/demos/painting/custom_paint_demo.dart';
import 'package:learning_tracker/explanations/painting/custom_paint_explanation.dart';
import 'package:learning_tracker/explanations/painting/custom_painter_explanation.dart';
import 'package:learning_tracker/demos/scrolling/custom_scroll_view_demo.dart';
import 'package:learning_tracker/explanations/scrolling/custom_scroll_view_explanation.dart';
import 'package:learning_tracker/demos/layout/custom_single_child_layout_demo.dart';
import 'package:learning_tracker/explanations/layout/custom_single_child_layout_explanation.dart';
import 'package:learning_tracker/demos/painting/decorated_box_demo.dart';
import 'package:learning_tracker/explanations/painting/decorated_box_explanation.dart';
import 'package:learning_tracker/demos/animation/decorated_box_transition_demo.dart';
import 'package:learning_tracker/explanations/animation/decorated_box_transition_explanation.dart';
import 'package:learning_tracker/demos/layout/decorated_sliver_demo.dart';
import 'package:learning_tracker/explanations/layout/decorated_sliver_explanation.dart';
import 'package:learning_tracker/demos/other/default_asset_bundle_demo.dart';
import 'package:learning_tracker/explanations/other/default_asset_bundle_explanation.dart';
import 'package:learning_tracker/demos/painting/default_selection_style_demo.dart';
import 'package:learning_tracker/explanations/painting/default_selection_style_explanation.dart';
import 'package:learning_tracker/demos/interaction/default_text_editing_shortcuts_demo.dart';
import 'package:learning_tracker/explanations/interaction/default_text_editing_shortcuts_explanation.dart';
import 'package:learning_tracker/demos/text/default_text_height_behavior_demo.dart';
import 'package:learning_tracker/explanations/text/default_text_height_behavior_explanation.dart';
import 'package:learning_tracker/demos/text/default_text_style_demo.dart';
import 'package:learning_tracker/explanations/text/default_text_style_explanation.dart';
import 'package:learning_tracker/demos/animation/default_text_style_transition_demo.dart';
import 'package:learning_tracker/explanations/animation/default_text_style_transition_explanation.dart';
import 'package:learning_tracker/demos/text/default_widgets_localizations_demo.dart';
import 'package:learning_tracker/explanations/text/default_widgets_localizations_explanation.dart';
import 'package:learning_tracker/demos/layout/directionality_demo.dart';
import 'package:learning_tracker/explanations/layout/directionality_explanation.dart';
import 'package:learning_tracker/demos/interaction/dismissible_demo.dart';
import 'package:learning_tracker/explanations/interaction/dismissible_explanation.dart';
import 'package:learning_tracker/demos/interaction/draggable_demo.dart';
import 'package:learning_tracker/explanations/interaction/draggable_explanation.dart';
import 'package:learning_tracker/demos/interaction/drag_target_demo.dart';
import 'package:learning_tracker/explanations/interaction/drag_target_explanation.dart';
import 'package:learning_tracker/demos/scrolling/draggable_scrollable_sheet_demo.dart';
import 'package:learning_tracker/explanations/scrolling/draggable_scrollable_sheet_explanation.dart';
import 'package:learning_tracker/demos/layout/error_widget_demo.dart';
import 'package:learning_tracker/explanations/layout/error_widget_explanation.dart';
import 'package:learning_tracker/demos/interaction/exclude_semantics_demo.dart';
import 'package:learning_tracker/explanations/interaction/exclude_semantics_explanation.dart';
import 'package:learning_tracker/demos/layout/expanded_demo.dart';
import 'package:learning_tracker/explanations/layout/expanded_explanation.dart';
import 'package:learning_tracker/demos/animation/fade_transition_demo.dart';
import 'package:learning_tracker/explanations/animation/fade_transition_explanation.dart';
import 'package:learning_tracker/demos/layout/fitted_box_demo.dart';
import 'package:learning_tracker/explanations/layout/fitted_box_explanation.dart';
import 'package:learning_tracker/demos/layout/flexible_demo.dart';
import 'package:learning_tracker/explanations/layout/flexible_explanation.dart';
import 'package:learning_tracker/demos/layout/flow_demo.dart';
import 'package:learning_tracker/explanations/layout/flow_explanation.dart';
import 'package:learning_tracker/demos/painting/flutter_logo_demo.dart';
import 'package:learning_tracker/explanations/painting/flutter_logo_explanation.dart';
import 'package:learning_tracker/demos/interaction/focus_demo.dart';
import 'package:learning_tracker/explanations/interaction/focus_explanation.dart';
import 'package:learning_tracker/demos/interaction/focusable_action_detector_demo.dart';
import 'package:learning_tracker/explanations/interaction/focusable_action_detector_explanation.dart';
import 'package:learning_tracker/demos/interaction/focus_traversal_group_demo.dart';
import 'package:learning_tracker/explanations/interaction/focus_traversal_group_explanation.dart';
import 'package:learning_tracker/demos/input/form_demo.dart';
import 'package:learning_tracker/explanations/input/form_explanation.dart';
import 'package:learning_tracker/demos/input/form_field_demo.dart';
import 'package:learning_tracker/explanations/input/form_field_explanation.dart';
import 'package:learning_tracker/demos/layout/fractionally_sized_box_demo.dart';
import 'package:learning_tracker/explanations/layout/fractionally_sized_box_explanation.dart';
import 'package:learning_tracker/demos/async/future_builder_demo.dart';
import 'package:learning_tracker/explanations/async/future_builder_explanation.dart';
import 'package:learning_tracker/demos/interaction/gesture_detector_demo.dart';
import 'package:learning_tracker/explanations/interaction/gesture_detector_explanation.dart';
import 'package:learning_tracker/demos/scrolling/grid_view_demo.dart';
import 'package:learning_tracker/explanations/scrolling/grid_view_explanation.dart';
import 'package:learning_tracker/demos/animation/hero_demo.dart';
import 'package:learning_tracker/explanations/animation/hero_explanation.dart';
import 'package:learning_tracker/demos/painting/icon_demo.dart';
import 'package:learning_tracker/explanations/painting/icon_explanation.dart';
import 'package:learning_tracker/demos/interaction/ignore_pointer_demo.dart';
import 'package:learning_tracker/explanations/interaction/ignore_pointer_explanation.dart';
import 'package:learning_tracker/demos/painting/image_demo.dart';
import 'package:learning_tracker/explanations/painting/image_explanation.dart';
import 'package:learning_tracker/demos/interaction/interactive_viewer_demo.dart';
import 'package:learning_tracker/explanations/interaction/interactive_viewer_explanation.dart';
import 'package:learning_tracker/demos/layout/intrinsic_height_demo.dart';
import 'package:learning_tracker/explanations/layout/intrinsic_height_explanation.dart';
import 'package:learning_tracker/demos/layout/intrinsic_width_demo.dart';
import 'package:learning_tracker/explanations/layout/intrinsic_width_explanation.dart';
import 'package:learning_tracker/demos/interaction/keyboard_listener_demo.dart';
import 'package:learning_tracker/explanations/interaction/keyboard_listener_explanation.dart';
import 'package:learning_tracker/demos/layout/layout_builder_demo.dart';
import 'package:learning_tracker/explanations/layout/layout_builder_explanation.dart';
import 'package:learning_tracker/demos/layout/limited_box_demo.dart';
import 'package:learning_tracker/explanations/layout/limited_box_explanation.dart';
import 'package:learning_tracker/demos/layout/list_body_demo.dart';
import 'package:learning_tracker/explanations/layout/list_body_explanation.dart';
import 'package:learning_tracker/demos/other/listenable_builder_demo.dart';
import 'package:learning_tracker/explanations/other/listenable_builder_explanation.dart';
import 'package:learning_tracker/demos/interaction/listener_demo.dart';
import 'package:learning_tracker/explanations/interaction/listener_explanation.dart';
import 'package:learning_tracker/demos/scrolling/list_view_demo.dart';
import 'package:learning_tracker/explanations/scrolling/list_view_explanation.dart';
import 'package:learning_tracker/demos/scrolling/list_wheel_scroll_view_demo.dart';
import 'package:learning_tracker/explanations/scrolling/list_wheel_scroll_view_explanation.dart';
import 'package:learning_tracker/demos/interaction/mouse_region_demo.dart';
import 'package:learning_tracker/explanations/interaction/mouse_region_explanation.dart';
import 'package:learning_tracker/demos/layout/navigation_toolbar_demo.dart';
import 'package:learning_tracker/demos/interaction/navigator_demo.dart';
import 'package:learning_tracker/demos/scrolling/nested_scroll_view_demo.dart';
import 'package:learning_tracker/demos/interaction/notification_listener_demo.dart';
import 'package:learning_tracker/demos/layout/offstage_demo.dart';
import 'package:learning_tracker/demos/painting/opacity_demo.dart';
import 'package:learning_tracker/demos/layout/orientation_builder_demo.dart';
import 'package:learning_tracker/demos/layout/overflow_bar_demo.dart';
import 'package:learning_tracker/demos/layout/overflow_box_demo.dart';
import 'package:learning_tracker/demos/scrolling/page_view_demo.dart';
import 'package:learning_tracker/demos/layout/padding_demo.dart';
import 'package:learning_tracker/demos/painting/physical_model_demo.dart';
import 'package:learning_tracker/demos/painting/physical_shape_demo.dart';
import 'package:learning_tracker/demos/layout/placeholder_demo.dart';
import 'package:learning_tracker/demos/layout/positioned_demo.dart';
import 'package:learning_tracker/demos/layout/positioned_directional_demo.dart';
import 'package:learning_tracker/demos/animation/positioned_transition_demo.dart';
import 'package:learning_tracker/demos/layout/preferred_size_demo.dart';
import 'package:learning_tracker/demos/painting/raw_image_demo.dart';
import 'package:learning_tracker/demos/animation/relative_positioned_transition_demo.dart';
import 'package:learning_tracker/demos/painting/repaint_boundary_demo.dart';
import 'package:learning_tracker/demos/layout/rotated_box_demo.dart';
import 'package:learning_tracker/demos/animation/rotation_transition_demo.dart';
import 'package:learning_tracker/demos/layout/row_demo.dart';

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
  WidgetInfo(
    name: 'AnimatedModalBarrier',
    category: WidgetCategory.animation,
    description:
        'A widget that prevents the user from interacting with widgets behind itself, and can be configured with an animated color value.',
    rnEquivalent: animatedModalBarrierRnEquivalent,
    demoBuilder: (_) => const AnimatedModalBarrierDemo(),
    dartCode: '''AnimatedModalBarrier(
  color: _colorAnimation, // Animation<Color?>
  dismissible: true,
  onDismiss: () => print('Dismissed'),
)''',
  ),
  WidgetInfo(
    name: 'AnimatedSize',
    category: WidgetCategory.animation,
    description:
        'Animated widget that automatically transitions its size over a given duration whenever the given child\'s size changes.',
    rnEquivalent: animatedSizeRnEquivalent,
    demoBuilder: (_) => const AnimatedSizeDemo(),
    dartCode: '''AnimatedSize(
  duration: const Duration(milliseconds: 400),
  curve: Curves.easeInOut,
  child: MyDynamicSizeWidget(),
)''',
  ),
  WidgetInfo(
    name: 'AnimatedSlide',
    category: WidgetCategory.animation,
    description:
        'Widget which automatically transitions the child\'s offset relative to its normal position whenever the given offset changes.',
    rnEquivalent: animatedSlideRnEquivalent,
    demoBuilder: (_) => const AnimatedSlideDemo(),
    dartCode: '''AnimatedSlide(
  offset: Offset(xValue, yValue), // fractional offsets
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeInOut,
  child: MyWidget(),
)''',
  ),
  WidgetInfo(
    name: 'AnimatedSwitcher',
    category: WidgetCategory.animation,
    description:
        'A widget that by default does a cross-fade between a new widget and the widget previously set on the AnimatedSwitcher as a child.',
    rnEquivalent: animatedSwitcherRnEquivalent,
    demoBuilder: (_) => const AnimatedSwitcherDemo(),
    dartCode: '''AnimatedSwitcher(
  duration: const Duration(milliseconds: 500),
  transitionBuilder: (Widget child, Animation<double> animation) {
    return FadeTransition(opacity: animation, child: child);
  },
  child: MyCurrentChildWidget(key: ValueKey(_state)), // Unique key required
)''',
  ),
  WidgetInfo(
    name: 'AnimatedWidget',
    category: WidgetCategory.animation,
    description:
        'A widget that rebuilds when the given Listenable changes value, isolating rebuild scope to optimize performance.',
    rnEquivalent: animatedWidgetRnEquivalent,
    demoBuilder: (_) => const AnimatedWidgetDemo(),
    dartCode: '''class PulsingHeart extends AnimatedWidget {
  const PulsingHeart({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final progress = listenable as Animation<double>;
    return Transform.scale(
      scale: 0.8 + (progress.value * 0.4),
      child: const Icon(Icons.favorite, color: Colors.red),
    );
  }
}''',
  ),
  WidgetInfo(
    name: 'AspectRatio',
    category: WidgetCategory.layout,
    description:
        'A widget that attempts to size the child to a specific aspect ratio, enforcing the ratio constraints within its parent.',
    rnEquivalent: aspectRatioRnEquivalent,
    demoBuilder: (_) => const AspectRatioDemo(),
    dartCode: '''AspectRatio(
  aspectRatio: 16 / 9,
  child: Container(
    color: Colors.blue,
    child: Center(child: Text('16:9 Aspect Ratio')),
  ),
)''',
  ),
  WidgetInfo(
    name: 'AutofillGroup',
    category: WidgetCategory.input,
    description:
        'An input group widget that binds text fields under a single autofill context scope for password managers and credential auto-fill engines.',
    rnEquivalent: autofillGroupRnEquivalent,
    demoBuilder: (_) => const AutofillGroupDemo(),
    dartCode: '''AutofillGroup(
  child: Column(
    children: [
      TextFormField(
        autofillHints: const [AutofillHints.username],
        decoration: const InputDecoration(labelText: 'Username'),
      ),
      TextFormField(
        autofillHints: const [AutofillHints.password],
        obscureText: true,
        decoration: const InputDecoration(labelText: 'Password'),
      ),
    ],
  ),
)''',
  ),
  WidgetInfo(
    name: 'BackButtonListener',
    category: WidgetCategory.interaction,
    description:
        'A navigation utility widget that registers a callback to listen to and intercept system/hardware back gestures.',
    rnEquivalent: backButtonListenerRnEquivalent,
    demoBuilder: (_) => const BackButtonListenerDemo(),
    dartCode: '''BackButtonListener(
  onBackButtonPressed: () async {
    final bool shouldPreventPop = await checkUnsavedChanges();
    return shouldPreventPop; // Return true to consume the press and prevent exit
  },
  child: MyFormScreen(),
)''',
  ),
  WidgetInfo(
    name: 'BackdropFilter',
    category: WidgetCategory.painting,
    description:
        'A painting widget that applies a blur, color filter, or matrix effect to the already painted pixels behind itself.',
    rnEquivalent: backdropFilterRnEquivalent,
    demoBuilder: (_) => const BackdropFilterDemo(),
    dartCode: '''ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Stack(
    children: [
      Image.network('url'),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.black.withOpacity(0.2),
          child: Text('Frosted Overlay'),
        ),
      ),
    ],
  ),
)''',
  ),
  WidgetInfo(
    name: 'Banner',
    category: WidgetCategory.painting,
    description:
        'A decorative widget that overlays a tilted diagonal badge banner in one of the corners of its child.',
    rnEquivalent: bannerRnEquivalent,
    demoBuilder: (_) => const BannerDemo(),
    dartCode: '''Banner(
  message: 'SALE',
  location: BannerLocation.topEnd,
  color: Colors.red,
  child: ProductCard(),
)''',
  ),
  WidgetInfo(
    name: 'Baseline',
    category: WidgetCategory.layout,
    description:
        'A layout widget that shifts its child vertically so that the child\'s baseline aligns with a specified distance from the top of this widget.',
    rnEquivalent: baselineRnEquivalent,
    demoBuilder: (_) => const BaselineDemo(),
    dartCode: '''Baseline(
  baseline: 50.0,
  baselineType: TextBaseline.alphabetic,
  child: Text('Aligned Text'),
)''',
  ),
  WidgetInfo(
    name: 'BlockSemantics',
    category: WidgetCategory.interaction,
    description:
        'An accessibility helper widget that drops the semantic nodes of any widgets painted behind it in the tree, preventing screen reader focus leaks.',
    rnEquivalent: blockSemanticsRnEquivalent,
    demoBuilder: (_) => const BlockSemanticsDemo(),
    dartCode: '''BlockSemantics(
  blocking: true,
  child: MyModalDialogOverlay(),
)''',
  ),
  WidgetInfo(
    name: 'BoxScrollView',
    category: WidgetCategory.scrolling,
    description:
        'An abstract base ScrollView subclass for scrollable widgets that deal with a single child box model viewport layout (such as ListView and GridView).',
    rnEquivalent: boxScrollViewRnEquivalent,
    demoBuilder: (_) => const BoxScrollViewDemo(),
    dartCode: '''// Custom class subclassing BoxScrollView
class CustomScrollView extends BoxScrollView {
  const CustomScrollView({super.key});

  @override
  Widget buildChildLayout(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Card(child: Text('Item 1')),
      ]),
    );
  }
}''',
  ),
  WidgetInfo(
    name: 'Builder',
    category: WidgetCategory.layout,
    description:
        'A stateless utility widget that executes its builder callback closure to build its child, exposing a nested BuildContext descendant scope.',
    rnEquivalent: builderRnEquivalent,
    demoBuilder: (_) => const BuilderDemo(),
    dartCode: '''Builder(
  builder: (BuildContext context) {
    // This context is nested below the parent widget.
    // Scaffold.of(context) will now resolve successfully!
    return ElevatedButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      child: const Text('Open Drawer'),
    );
  },
)''',
  ),
  WidgetInfo(
    name: 'CallbackShortcuts',
    category: WidgetCategory.interaction,
    description:
        'An interaction helper widget that binds raw physical keyboard keys and shortcuts combinations directly to execution callbacks.',
    rnEquivalent: callbackShortcutsRnEquivalent,
    demoBuilder: (_) => const CallbackShortcutsDemo(),
    dartCode: '''CallbackShortcuts(
  bindings: <ShortcutActivator, VoidCallback>{
    const SingleActivator(LogicalKeyboardKey.keyI): () => increment(),
    const SingleActivator(LogicalKeyboardKey.keyD): () => decrement(),
  },
  child: Focus(
    child: MyCounterWidget(),
  ),
)''',
  ),
  WidgetInfo(
    name: 'Center',
    category: WidgetCategory.layout,
    description:
        'A widget that centers its child within itself, optionally sizing itself based on the child\'s dimensions using factor multipliers.',
    rnEquivalent: centerRnEquivalent,
    demoBuilder: (_) => const CenterDemo(),
    dartCode: '''Center(
  widthFactor: 1.5,
  heightFactor: 1.5,
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
  ),
)''',
  ),
  WidgetInfo(
    name: 'ClipOval',
    category: WidgetCategory.painting,
    description:
        'A widget that clips its child using an oval shape, fitting the boundary box of the child widget or a custom clipper.',
    rnEquivalent: clipOvalRnEquivalent,
    demoBuilder: (_) => const ClipOvalDemo(),
    dartCode: '''ClipOval(
  child: Image.network(
    'https://example.com/avatar.png',
    width: 100,
    height: 100,
    fit: BoxFit.cover,
  ),
)''',
  ),
  WidgetInfo(
    name: 'ClipPath',
    category: WidgetCategory.painting,
    description:
        'A widget that clips its child using a custom programmatic geometric Path computed dynamically or via a custom clipper.',
    rnEquivalent: clipPathRnEquivalent,
    demoBuilder: (_) => const ClipPathDemo(),
    dartCode: '''ClipPath(
  clipper: TriangleClipper(),
  child: Container(
    width: 200,
    height: 200,
    color: Colors.orange,
  ),
)''',
  ),
  WidgetInfo(
    name: 'ClipRect',
    category: WidgetCategory.painting,
    description:
        'A widget that clips its child using a rectangular boundary, preventing the child\'s paint output from bleeding outside its layout bounds.',
    rnEquivalent: clipRectRnEquivalent,
    demoBuilder: (_) => const ClipRectDemo(),
    dartCode: '''ClipRect(
  child: Align(
    alignment: Alignment.topLeft,
    widthFactor: 0.5,
    heightFactor: 0.5,
    child: Image.network('https://example.com/photo.jpg'),
  ),
)''',
  ),
  WidgetInfo(
    name: 'ClipRRect',
    category: WidgetCategory.painting,
    description:
        'A widget that clips its child using a rounded rectangle, providing clipping support for asymmetric corner radii and anti-aliasing.',
    rnEquivalent: clipRrectRnEquivalent,
    demoBuilder: (_) => const ClipRRectDemo(),
    dartCode: '''ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Image.network(
    'https://example.com/image.png',
    width: 200,
    height: 150,
    fit: BoxFit.cover,
  ),
)''',
  ),
  WidgetInfo(
    name: 'ClipRSuperellipse',
    category: WidgetCategory.painting,
    description:
        'A widget that clips its child using a rounded superellipse (squircle) to produce continuous smooth corners.',
    rnEquivalent: clipRSuperellipseRnEquivalent,
    demoBuilder: (_) => const ClipRSuperellipseDemo(),
    dartCode: '''ClipRSuperellipse(
  borderRadius: BorderRadius.circular(32),
  child: Container(
    width: 150,
    height: 150,
    color: Colors.blue,
  ),
)''',
  ),
  WidgetInfo(
    name: 'ColoredBox',
    category: WidgetCategory.painting,
    description:
        'A lightweight render tree widget that paints a solid background color behind its child without allocating a full BoxDecoration.',
    rnEquivalent: coloredBoxRnEquivalent,
    demoBuilder: (_) => const ColoredBoxDemo(),
    dartCode: '''ColoredBox(
  color: Colors.blue,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Content'),
  ),
)''',
  ),
  WidgetInfo(
    name: 'Column',
    category: WidgetCategory.layout,
    description:
        'A layout widget that displays its children in a vertical array, offering fine-grained main-axis and cross-axis alignment features.',
    rnEquivalent: columnRnEquivalent,
    demoBuilder: (_) => const ColumnDemo(),
    dartCode: '''Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)''',
  ),
  WidgetInfo(
    name: 'CompositedTransformTarget',
    category: WidgetCategory.layout,
    description:
        'A structural layout widget that establishes a transform anchor (target) to link a floating CompositedTransformFollower overlay.',
    rnEquivalent: compositedTransformTargetRnEquivalent,
    demoBuilder: (_) => const CompositedTransformTargetDemo(),
    dartCode: '''CompositedTransformTarget(
  link: myLayerLink,
  child: MyAnchorButton(),
)''',
  ),
  WidgetInfo(
    name: 'CompositedTransformFollower',
    category: WidgetCategory.layout,
    description:
        'A transform follower overlay widget that links to and tracks a CompositedTransformTarget dynamically using compositor layers.',
    rnEquivalent: compositedTransformFollowerRnEquivalent,
    demoBuilder: (_) => const CompositedTransformTargetDemo(),
    dartCode: '''CompositedTransformFollower(
  link: myLayerLink,
  targetAnchor: Alignment.bottomLeft,
  followerAnchor: Alignment.topLeft,
  child: MyFloatingTooltip(),
)''',
  ),
  WidgetInfo(
    name: 'ConstrainedBox',
    category: WidgetCategory.layout,
    description:
        'A layout widget that imposes additional, explicit BoxConstraints sizing limits on its child.',
    rnEquivalent: constrainedBoxRnEquivalent,
    demoBuilder: (_) => const ConstrainedBoxDemo(),
    dartCode: '''ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 80,
    maxWidth: 180,
    minHeight: 80,
    maxHeight: 180,
  ),
  child: MyChildWidget(),
)''',
  ),
  WidgetInfo(
    name: 'ConstrainedLayoutBuilder',
    category: WidgetCategory.layout,
    description:
        'An abstract base class for widgets (like LayoutBuilder) that defer their build phase until layout, providing size constraints dynamically.',
    rnEquivalent: constrainedLayoutBuilderRnEquivalent,
    demoBuilder: (_) => const ConstrainedLayoutBuilderDemo(),
    dartCode: '''// Custom layout builder inheriting LayoutBuilder
class LoggingLayoutBuilder extends LayoutBuilder {
  const LoggingLayoutBuilder({super.key, required super.builder});
}''',
  ),
  WidgetInfo(
    name: 'ConstraintsTransformBox',
    category: WidgetCategory.layout,
    description:
        'A layout widget that applies a transformation to its parent constraints before passing them to its child (e.g. unconstrained width/height).',
    rnEquivalent: constraintsTransformBoxRnEquivalent,
    demoBuilder: (_) => const ConstraintsTransformBoxDemo(),
    dartCode: '''ConstraintsTransformBox(
  constraintsTransform: ConstraintsTransformBox.unconstrained,
  child: MyOversizedWidget(),
)''',
  ),
  WidgetInfo(
    name: 'Container',
    category: WidgetCategory.layout,
    description:
        'A popular convenience widget combining common layout constraints, sizing padding, margin, styling decorations, transforms, and alignments.',
    rnEquivalent: containerRnEquivalent,
    demoBuilder: (_) => const ContainerDemo(),
    dartCode: '''Container(
  margin: EdgeInsets.all(16),
  padding: EdgeInsets.all(16),
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Icon(Icons.home),
)''',
  ),
  WidgetInfo(
    name: 'CustomMultiChildLayout',
    category: WidgetCategory.layout,
    description:
        'A layout widget that defers the sizing and positioning of multiple children to a custom layout delegate programmatically.',
    rnEquivalent: customMultiChildLayoutRnEquivalent,
    demoBuilder: (_) => const CustomMultiChildLayoutDemo(),
    dartCode: '''CustomMultiChildLayout(
  delegate: MyCustomLayoutDelegate(),
  children: [
    LayoutId(id: 'avatar', child: Avatar()),
    LayoutId(id: 'badge', child: Badge()),
  ],
)''',
  ),
  WidgetInfo(
    name: 'CustomPaint',
    category: WidgetCategory.painting,
    description:
        'A painting widget that provides a canvas on which to draw custom programmatic vector graphics and shapes.',
    rnEquivalent: customPaintRnEquivalent,
    demoBuilder: (_) => const CustomPaintDemo(),
    dartCode: '''CustomPaint(
  painter: MyCustomPainter(),
  child: Center(child: Text('Canvas Content')),
)''',
  ),
  WidgetInfo(
    name: 'CustomPainter',
    category: WidgetCategory.painting,
    description:
        'The abstract painter interface used by CustomPaint to define layout canvas drawing commands and repaint limits.',
    rnEquivalent: customPainterRnEquivalent,
    demoBuilder: (_) => const CustomPaintDemo(),
    dartCode: '''class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, 10.0, Paint()..color = Colors.blue);
  }
  @override
  bool shouldRepaint(covariant MyPainter oldDelegate) => false;
}''',
  ),
  WidgetInfo(
    name: 'CustomScrollView',
    category: WidgetCategory.scrolling,
    description:
        'A viewport scroll container coordinating multiple custom scrolling behaviors using sliver elements (app bars, grids, lists).',
    rnEquivalent: customScrollViewRnEquivalent,
    demoBuilder: (_) => const CustomScrollViewDemo(),
    dartCode: '''CustomScrollView(
  slivers: [
    SliverAppBar(title: Text('Sliver Header')),
    SliverList(delegate: SliverChildBuilderDelegate(...)),
  ],
)''',
  ),
  WidgetInfo(
    name: 'CustomSingleChildLayout',
    category: WidgetCategory.layout,
    description:
        'A layout widget that defers the sizing and positioning of its single child to a custom positioning delegate.',
    rnEquivalent: customSingleChildLayoutRnEquivalent,
    demoBuilder: (_) => const CustomSingleChildLayoutDemo(),
    dartCode: '''CustomSingleChildLayout(
  delegate: MySingleChildLayoutDelegate(),
  child: MyTargetWidget(),
)''',
  ),
  WidgetInfo(
    name: 'DecoratedBox',
    category: WidgetCategory.painting,
    description:
        'A painting widget that draws a decoration (border, gradient, shadow) either behind or in front of its child.',
    rnEquivalent: decoratedBoxRnEquivalent,
    demoBuilder: (_) => const DecoratedBoxDemo(),
    dartCode: '''DecoratedBox(
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Content'),
  ),
)''',
  ),
  WidgetInfo(
    name: 'DecoratedBoxTransition',
    category: WidgetCategory.animation,
    description:
        'An animation transition widget that morphs a BoxDecoration dynamically using an AnimationController.',
    rnEquivalent: decoratedBoxTransitionRnEquivalent,
    demoBuilder: (_) => const DecoratedBoxTransitionDemo(),
    dartCode: '''DecoratedBoxTransition(
  decoration: myDecorationAnimation,
  child: MyContentWidget(),
)''',
  ),
  WidgetInfo(
    name: 'DecoratedSliver',
    category: WidgetCategory.layout,
    description:
        'A layout sliver widget that wraps a sliver child with a background or foreground decoration in scroll viewports.',
    rnEquivalent: decoratedSliverRnEquivalent,
    demoBuilder: (_) => const DecoratedSliverDemo(),
    dartCode: '''DecoratedSliver(
  decoration: BoxDecoration(color: Colors.grey),
  sliver: SliverList(...),
)''',
  ),
  WidgetInfo(
    name: 'DefaultAssetBundle',
    category: WidgetCategory.layout,
    description:
        'A configuration widget that defines the scoped AssetBundle resolved by context-based asset loaders in its subtree.',
    rnEquivalent: defaultAssetBundleRnEquivalent,
    demoBuilder: (_) => const DefaultAssetBundleDemo(),
    dartCode: '''DefaultAssetBundle(
  bundle: MyCustomAssetBundle(),
  child: MyAssetUserWidget(),
)''',
  ),
  WidgetInfo(
    name: 'DefaultSelectionStyle',
    category: WidgetCategory.painting,
    description:
        'An inherited selection style widget defining highlight and cursor colors for all selectable text descendants.',
    rnEquivalent: defaultSelectionStyleRnEquivalent,
    demoBuilder: (_) => const DefaultSelectionStyleDemo(),
    dartCode: '''DefaultSelectionStyle(
  selectionColor: Colors.blue.withOpacity(0.3),
  cursorColor: Colors.blue,
  child: SelectableText('Selectable Content'),
)''',
  ),
  WidgetInfo(
    name: 'DefaultTextEditingShortcuts',
    category: WidgetCategory.interaction,
    description:
        'An editing keyboard shortcuts widget defining OS-level key combinations for text editing behaviors.',
    rnEquivalent: defaultTextEditingShortcutsRnEquivalent,
    demoBuilder: (_) => const DefaultTextEditingShortcutsDemo(),
    dartCode: '''DefaultTextEditingShortcuts(
  child: TextField(),
)''',
  ),
  WidgetInfo(
    name: 'DefaultTextHeightBehavior',
    category: WidgetCategory.text,
    description:
        'An inherited widget that specifies the default text height behavior for descendant Text and EditableText widgets.',
    rnEquivalent: defaultTextHeightBehaviorRnEquivalent,
    demoBuilder: (_) => const DefaultTextHeightBehaviorDemo(),
    dartCode: '''DefaultTextHeightBehavior(
  textHeightBehavior: TextHeightBehavior(
    applyHeightToFirstAscent: true,
    applyHeightToLastDescent: true,
    leadingDistribution: TextLeadingDistribution.proportional,
  ),
  child: Text('Demo Text'),
)''',
  ),
  WidgetInfo(
    name: 'DefaultTextStyle',
    category: WidgetCategory.text,
    description:
        'An inherited widget that specifies the default text style to apply to descendant Text widgets without explicit styles.',
    rnEquivalent: defaultTextStyleRnEquivalent,
    demoBuilder: (_) => const DefaultTextStyleDemo(),
    dartCode: '''DefaultTextStyle(
  style: TextStyle(fontSize: 20.0, color: Colors.blue),
  child: Column(
    children: [
      Text('Inherited Style Text'),
    ],
  ),
)''',
  ),
  WidgetInfo(
    name: 'DefaultTextStyleTransition',
    category: WidgetCategory.animation,
    description:
        'An animated transition widget that interpolates a DefaultTextStyle using an Animation<TextStyle>.',
    rnEquivalent: defaultTextStyleTransitionRnEquivalent,
    demoBuilder: (_) => const DefaultTextStyleTransitionDemo(),
    dartCode: '''DefaultTextStyleTransition(
  style: myTextStyleAnimation, // Animation<TextStyle>
  child: Text('Morphing Text'),
)''',
  ),
  WidgetInfo(
    name: 'DefaultWidgetsLocalizations',
    category: WidgetCategory.text,
    description:
        'A default implementation of WidgetsLocalizations that supports basic text directionality and localization properties.',
    rnEquivalent: defaultWidgetsLocalizationsRnEquivalent,
    demoBuilder: (_) => const DefaultWidgetsLocalizationsDemo(),
    dartCode: '''// Used in MaterialApp delegates:
MaterialApp(
  localizationsDelegates: const [
    DefaultWidgetsLocalizations.delegate,
  ],
)''',
  ),
  WidgetInfo(
    name: 'Directionality',
    category: WidgetCategory.layout,
    description:
        'An inherited widget that determines the ambient text directionality (LTR or RTL) for descendant widgets.',
    rnEquivalent: directionalityRnEquivalent,
    demoBuilder: (_) => const DirectionalityDemo(),
    dartCode: '''Directionality(
  textDirection: TextDirection.rtl,
  child: Row(
    children: [
      Icon(Icons.arrow_back),
      Text('Right to Left Layout'),
    ],
  ),
)''',
  ),
  WidgetInfo(
    name: 'Dismissible',
    category: WidgetCategory.interaction,
    description:
        'A widget that can be dismissed by swiping in the indicated direction, typically used for swipe-to-delete lists.',
    rnEquivalent: dismissibleRnEquivalent,
    demoBuilder: (_) => const DismissibleDemo(),
    dartCode: '''Dismissible(
  key: Key(item.id),
  onDismissed: (direction) {
    removeItem(item);
  },
  background: Container(color: Colors.red),
  child: ListTile(title: Text('Swipe to delete')),
)''',
  ),
  WidgetInfo(
    name: 'Draggable',
    category: WidgetCategory.interaction,
    description:
        'A widget that can be dragged from a starting position to a DragTarget, carrying a data payload.',
    rnEquivalent: draggableRnEquivalent,
    demoBuilder: (_) => const DraggableDemo(),
    dartCode: '''Draggable<String>(
  data: 'cargo_item',
  feedback: Material(
    child: Text('Dragging...'),
  ),
  child: Text('Drag Me'),
)''',
  ),
  WidgetInfo(
    name: 'DragTarget',
    category: WidgetCategory.interaction,
    description:
        'A target widget that receives data dropped from a Draggable widget, enabling custom drag-and-drop features.',
    rnEquivalent: dragTargetRnEquivalent,
    demoBuilder: (_) => const DragTargetDemo(),
    dartCode: '''DragTarget<String>(
  onAcceptWithDetails: (details) {
    print('Dropped \${details.data}');
  },
  builder: (context, candidateData, rejectedData) {
    return Container(child: Text('Drop Zone'));
  },
)''',
  ),
  WidgetInfo(
    name: 'DraggableScrollableSheet',
    category: WidgetCategory.scrolling,
    description:
        'A container bottom-sheet that drags from the bottom of the screen and expands into a scrollable view.',
    rnEquivalent: draggableScrollableSheetRnEquivalent,
    demoBuilder: (_) => const DraggableScrollableSheetDemo(),
    dartCode: '''DraggableScrollableSheet(
  initialChildSize: 0.4,
  minChildSize: 0.2,
  maxChildSize: 0.9,
  builder: (context, scrollController) {
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) => Text('Item \$index'),
    );
  },
)''',
  ),
  WidgetInfo(
    name: 'ErrorWidget',
    category: WidgetCategory.layout,
    description:
        'A fallback rendering widget that is displayed when a widget fails to build due to a runtime exception.',
    rnEquivalent: errorWidgetRnEquivalent,
    demoBuilder: (_) => const ErrorWidgetDemo(),
    dartCode: '''ErrorWidget.withDetails(
  message: 'Crash details',
  error: FlutterError('Exception'),
)''',
  ),
  WidgetInfo(
    name: 'ExcludeSemantics',
    category: WidgetCategory.interaction,
    description:
        'A widget that drops all accessibility semantics of its descendant widget tree.',
    rnEquivalent: excludeSemanticsRnEquivalent,
    demoBuilder: (_) => const ExcludeSemanticsDemo(),
    dartCode: '''ExcludeSemantics(
  excluding: true,
  child: Icon(Icons.star, semanticLabel: 'Decorative'),
)''',
  ),
  WidgetInfo(
    name: 'Expanded',
    category: WidgetCategory.layout,
    description:
        'A widget that expands a child of a Row, Column, or Flex to fill all remaining available main-axis space.',
    rnEquivalent: expandedRnEquivalent,
    demoBuilder: (_) => const ExpandedDemo(),
    dartCode: '''Row(
  children: [
    Container(width: 50),
    Expanded(
      child: Container(color: Colors.blue),
    ),
  ],
)''',
  ),
  WidgetInfo(
    name: 'FadeTransition',
    category: WidgetCategory.animation,
    description:
        'An explicit transition widget that animates the opacity of a child widget using an Animation<double>.',
    rnEquivalent: fadeTransitionRnEquivalent,
    demoBuilder: (_) => const FadeTransitionDemo(),
    dartCode: '''FadeTransition(
  opacity: myOpacityAnimation, // Animation<double>
  child: MyContentWidget(),
)''',
  ),
  WidgetInfo(
    name: 'FittedBox',
    category: WidgetCategory.layout,
    description:
        'A layout widget that scales and positions its child within itself according to a specified BoxFit style.',
    rnEquivalent: fittedBoxRnEquivalent,
    demoBuilder: (_) => const FittedBoxDemo(),
    dartCode: '''FittedBox(
  fit: BoxFit.contain,
  child: Image.asset('logo.png'),
)''',
  ),
  WidgetInfo(
    name: 'Flexible',
    category: WidgetCategory.layout,
    description:
        'A widget that controls how a child of a Row, Column, or Flex flexes, with loose or tight layout constraints.',
    rnEquivalent: flexibleRnEquivalent,
    demoBuilder: (_) => const FlexibleDemo(),
    dartCode: '''Row(
  children: [
    Flexible(
      fit: FlexFit.loose,
      child: Container(width: 100, color: Colors.blue),
    ),
  ],
)''',
  ),
  WidgetInfo(
    name: 'Flow',
    category: WidgetCategory.layout,
    description:
        'A high-performance paint-phase layout widget that positions children dynamically using a custom FlowDelegate.',
    rnEquivalent: flowRnEquivalent,
    demoBuilder: (_) => const FlowDemo(),
    dartCode: '''Flow(
  delegate: MyRadialMenuDelegate(animation: controller),
  children: [
    IconButton(icon: Icon(Icons.share)),
  ],
)''',
  ),
  WidgetInfo(
    name: 'FlutterLogo',
    category: WidgetCategory.painting,
    description:
        'A paint widget that programmatically draws the official Flutter brand logo in various layout styles.',
    rnEquivalent: flutterLogoRnEquivalent,
    demoBuilder: (_) => const FlutterLogoDemo(),
    dartCode: '''FlutterLogo(
  size: 100.0,
  style: FlutterLogoStyle.horizontal,
)''',
  ),
  WidgetInfo(
    name: 'Focus',
    category: WidgetCategory.interaction,
    description:
        'A utility widget that manages a FocusNode to track and handle spatial keyboard/touch focus changes.',
    rnEquivalent: focusRnEquivalent,
    demoBuilder: (_) => const FocusDemo(),
    dartCode: '''Focus(
  onFocusChange: (hasFocus) {
    print('Focused: \$hasFocus');
  },
  child: MyFocusableWidget(),
)''',
  ),
  WidgetInfo(
    name: 'FocusableActionDetector',
    category: WidgetCategory.interaction,
    description:
        'A wrapper widget that combines focus control, hover states, action mappings, and keyboard shortcut triggers.',
    rnEquivalent: focusableActionDetectorRnEquivalent,
    demoBuilder: (_) => const FocusableActionDetectorDemo(),
    dartCode: '''FocusableActionDetector(
  shortcuts: {
    SingleActivator(LogicalKeyboardKey.enter): selectIntent,
  },
  actions: {
    selectIntent: CallbackAction(onInvoke: (intent) => doSelect()),
  },
  child: MyButtonWidget(),
)''',
  ),
  WidgetInfo(
    name: 'FocusTraversalGroup',
    category: WidgetCategory.interaction,
    description:
        'An inherited widget defining keyboard navigation focus traversal policies (like tab order) for a group of descendant focus nodes.',
    rnEquivalent: focusTraversalGroupRnEquivalent,
    demoBuilder: (_) => const FocusTraversalGroupDemo(),
    dartCode: '''FocusTraversalGroup(
  policy: OrderedTraversalPolicy(),
  child: Column(
    children: [
      FocusTraversalOrder(
        order: NumericFocusOrder(1.0),
        child: MyInputWidget(),
      ),
    ],
  ),
)''',
  ),
  WidgetInfo(
    name: 'Form',
    category: WidgetCategory.input,
    description:
        'An optional container widget to manage, validate, save, and reset multiple child FormField inputs together.',
    rnEquivalent: formRnEquivalent,
    demoBuilder: (_) => const FormDemo(),
    dartCode: '''Form(
  key: _formKey, // GlobalKey<FormState>
  child: Column(
    children: [
      TextFormField(validator: (val) => val!.isEmpty ? 'Error' : null),
    ],
  ),
)''',
  ),
  WidgetInfo(
    name: 'FormField',
    category: WidgetCategory.input,
    description:
        'A wrapper widget holding a single input control state, managing errors, values, and validation callbacks under a parent Form.',
    rnEquivalent: formFieldRnEquivalent,
    demoBuilder: (_) => const FormFieldDemo(),
    dartCode: '''FormField<int>(
  initialValue: 0,
  validator: (val) => val == 0 ? 'Invalid' : null,
  builder: (state) {
    return MyCustomInput(
      value: state.value,
      onChanged: (newVal) => state.didChange(newVal),
      errorText: state.errorText,
    );
  },
)''',
  ),
  WidgetInfo(
    name: 'FractionallySizedBox',
    category: WidgetCategory.layout,
    description:
        'A layout widget that sizes its child to a fractional percentage of the available parent box constraints.',
    rnEquivalent: fractionallySizedBoxRnEquivalent,
    demoBuilder: (_) => const FractionallySizedBoxDemo(),
    dartCode: '''FractionallySizedBox(
  widthFactor: 0.8, // 80% width
  heightFactor: 0.5, // 50% height
  alignment: Alignment.center,
  child: Container(color: Colors.blue),
)''',
  ),
  WidgetInfo(
    name: 'FutureBuilder',
    category: WidgetCategory.async,
    description:
        'An async layout helper widget that automatically registers build callbacks responding to Future promise resolution states.',
    rnEquivalent: futureBuilderRnEquivalent,
    demoBuilder: (_) => const FutureBuilderDemo(),
    dartCode: '''FutureBuilder<String>(
  future: fetchProfileData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasData) {
      return Text('Loaded: \${snapshot.data}');
    }
    return Text('Error');
  },
)''',
  ),
  WidgetInfo(
    name: 'GestureDetector',
    category: WidgetCategory.interaction,
    description:
        'A widget that detects gestures (taps, drags, scales) by listening to pointer events.',
    rnEquivalent: gestureDetectorRnEquivalent,
    demoBuilder: (_) => const GestureDetectorDemo(),
    dartCode: '''GestureDetector(
  onTap: () => print('Tapped!'),
  onDoubleTap: () => print('Double tapped!'),
  onLongPress: () => print('Long pressed!'),
  onPanUpdate: (details) => print('Dragging: \${details.localPosition}'),
  child: Container(
    color: Colors.blue,
    child: Text('Interact with me'),
  ),
)''',
  ),
  WidgetInfo(
    name: 'GridView',
    category: WidgetCategory.scrolling,
    description:
        'A scrollable, 2D array of widgets.',
    rnEquivalent: gridViewRnEquivalent,
    demoBuilder: (_) => const GridViewDemo(),
    dartCode: '''GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  ),
  itemCount: 20,
  itemBuilder: (context, index) => Card(
    child: Center(child: Text('Item \$index')),
  ),
)''',
  ),
  WidgetInfo(
    name: 'Hero',
    category: WidgetCategory.animation,
    description:
        'A widget that marks its child as being a candidate for hero animations (shared element transitions) across route transitions.',
    rnEquivalent: heroRnEquivalent,
    demoBuilder: (_) => const HeroDemo(),
    dartCode: '''// Screen A
Hero(
  tag: 'hero-tag-id',
  child: Image.asset('avatar.png'),
)

// Screen B
Hero(
  tag: 'hero-tag-id',
  child: Image.asset('avatar.png'),
)''',
  ),
  WidgetInfo(
    name: 'Icon',
    category: WidgetCategory.painting,
    description:
        'A graphical icon widget drawn from a glyph in a font described in an IconData.',
    rnEquivalent: iconRnEquivalent,
    demoBuilder: (_) => const IconDemo(),
    dartCode: '''Icon(
  Icons.favorite,
  color: Colors.pink,
  size: 24.0,
  semanticLabel: 'Heart icon',
)''',
  ),
  WidgetInfo(
    name: 'IgnorePointer',
    category: WidgetCategory.interaction,
    description:
        'A widget that is invisible during hit testing, causing its subtree to ignore pointer events.',
    rnEquivalent: ignorePointerRnEquivalent,
    demoBuilder: (_) => const IgnorePointerDemo(),
    dartCode: '''IgnorePointer(
  ignoring: true, // ignore pointer events
  child: ElevatedButton(
    onPressed: () => print('Cannot click me'),
    child: Text('Button'),
  ),
)''',
  ),
  WidgetInfo(
    name: 'Image',
    category: WidgetCategory.painting,
    description:
        'A widget that displays an image, supporting various sources like network URLs, assets, files, or memory.',
    rnEquivalent: imageRnEquivalent,
    demoBuilder: (_) => const ImageDemo(),
    dartCode: '''Image.network(
  'https://example.com/image.png',
  fit: BoxFit.cover,
  loadingBuilder: (context, child, progress) {
    return progress == null ? child : CircularProgressIndicator();
  },
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.broken_image);
  },
)''',
  ),
  WidgetInfo(
    name: 'InteractiveViewer',
    category: WidgetCategory.interaction,
    description:
        'A widget that enables pan and zoom interactions on its child.',
    rnEquivalent: interactiveViewerRnEquivalent,
    demoBuilder: (_) => const InteractiveViewerDemo(),
    dartCode: '''InteractiveViewer(
  panEnabled: true,
  scaleEnabled: true,
  minScale: 0.5,
  maxScale: 4.0,
  child: Image.asset('map.png'),
)''',
  ),
  WidgetInfo(
    name: 'IntrinsicHeight',
    category: WidgetCategory.layout,
    description:
        'A widget that sizes its child to the child\'s intrinsic height, aligning sibling widgets vertically.',
    rnEquivalent: intrinsicHeightRnEquivalent,
    demoBuilder: (_) => const IntrinsicHeightDemo(),
    dartCode: '''IntrinsicHeight(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Column1(),
      VerticalDivider(),
      Column2(),
    ],
  ),
)''',
  ),
  WidgetInfo(
    name: 'IntrinsicWidth',
    category: WidgetCategory.layout,
    description:
        'A widget that sizes its child to the child\'s intrinsic width, aligning sibling widgets horizontally.',
    rnEquivalent: intrinsicWidthRnEquivalent,
    demoBuilder: (_) => const IntrinsicWidthDemo(),
    dartCode: '''IntrinsicWidth(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Button1(),
      Button2(),
    ],
  ),
)''',
  ),
  WidgetInfo(
    name: 'KeyboardListener',
    category: WidgetCategory.interaction,
    description:
        'A widget that calls a callback whenever the user presses or releases a key on a keyboard.',
    rnEquivalent: keyboardListenerRnEquivalent,
    demoBuilder: (_) => const KeyboardListenerDemo(),
    dartCode: '''KeyboardListener(
  focusNode: myFocusNode,
  onKeyEvent: (KeyEvent event) {
    print('Key: \${event.logicalKey.keyLabel}');
  },
  child: MyFocusableWidget(),
)''',
  ),
  WidgetInfo(
    name: 'LayoutBuilder',
    category: WidgetCategory.layout,
    description:
        'Builds a widget tree that can depend on the parent widget\'s size constraints.',
    rnEquivalent: layoutBuilderRnEquivalent,
    demoBuilder: (_) => const LayoutBuilderDemo(),
    dartCode: '''LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return WideLayout();
    }
    return NarrowLayout();
  },
)''',
  ),
  WidgetInfo(
    name: 'LimitedBox',
    category: WidgetCategory.layout,
    description:
        'A box that limits its size only when its extra dimensions are unconstrained by parent constraints.',
    rnEquivalent: limitedBoxRnEquivalent,
    demoBuilder: (_) => const LimitedBoxDemo(),
    dartCode: '''LimitedBox(
  maxHeight: 100.0,
  child: Container(color: Colors.blue),
)''',
  ),
  WidgetInfo(
    name: 'ListBody',
    category: WidgetCategory.layout,
    description:
        'A widget that lays out its children sequentially along a given axis, forcing them to match the parent\'s cross-axis dimensions.',
    rnEquivalent: listBodyRnEquivalent,
    demoBuilder: (_) => const ListBodyDemo(),
    dartCode: '''ListBody(
  mainAxis: Axis.vertical,
  children: [
    Container(color: Colors.red, height: 50),
    Container(color: Colors.blue, height: 100),
  ],
)''',
  ),
  WidgetInfo(
    name: 'ListenableBuilder',
    category: WidgetCategory.animation,
    description:
        'A widget that rebuilds only its builder subtree when a Listenable (like a ChangeNotifier) notifies its listeners.',
    rnEquivalent: listenableBuilderRnEquivalent,
    demoBuilder: (_) => const ListenableBuilderDemo(),
    dartCode: '''ListenableBuilder(
  listenable: myCounterNotifier,
  builder: (context, child) {
    return Text('Count: \${myCounterNotifier.count}');
  },
)''',
  ),
  WidgetInfo(
    name: 'Listener',
    category: WidgetCategory.interaction,
    description:
        'A low-level interaction widget that calls pointer callbacks (down, move, up, cancel) directly from the OS.',
    rnEquivalent: listenerRnEquivalent,
    demoBuilder: (_) => const ListenerDemo(),
    dartCode: '''Listener(
  onPointerDown: (event) => print('Down at \${event.localPosition}'),
  onPointerMove: (event) => print('Move to \${event.localPosition}'),
  child: Container(color: Colors.grey),
)''',
  ),
  WidgetInfo(
    name: 'ListView',
    category: WidgetCategory.scrolling,
    description:
        'A scrollable, linear list of widgets, virtualizing rendering when built with builder constructors.',
    rnEquivalent: listViewRnEquivalent,
    demoBuilder: (_) => const ListViewDemo(),
    dartCode: '''ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) => ListTile(
    title: Text('Item \$index'),
  ),
)''',
  ),
  WidgetInfo(
    name: 'ListWheelScrollView',
    category: WidgetCategory.scrolling,
    description:
        'A scrollable container that places its children along a 3D cylindrical scroll wheel.',
    rnEquivalent: listWheelScrollViewRnEquivalent,
    demoBuilder: (_) => const ListWheelScrollViewDemo(),
    dartCode: '''ListWheelScrollView(
  itemExtent: 50.0,
  diameterRatio: 1.5,
  useMagnifier: true,
  magnification: 1.2,
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)''',
  ),
  WidgetInfo(
    name: 'MouseRegion',
    category: WidgetCategory.interaction,
    description:
        'A widget that tracks mouse pointer enter, hover, and exit events, and overrides hardware mouse cursors.',
    rnEquivalent: mouseRegionRnEquivalent,
    demoBuilder: (_) => const MouseRegionDemo(),
    dartCode: '''MouseRegion(
  cursor: SystemMouseCursors.click,
  onEnter: (event) => print('Entered region'),
  onExit: (event) => print('Exited region'),
  child: Container(color: Colors.blue),
)''',
  ),

  // ── Batch 14 ─────────────────────────────────────────────────────────

  WidgetInfo(
    name: 'NavigationToolbar',
    category: WidgetCategory.layout,
    description:
        'A low-level widget that lays out a leading, middle, and trailing widget '
        'in a horizontal bar — the internal backbone of AppBar.',
    rnEquivalent: 'In React Native, a similar three-slot header layout is achieved '
        'with a View + flexDirection:"row" or via headerLeft / headerTitle / '
        'headerRight in React Navigation.',
    demoBuilder: (_) => const NavigationToolbarDemo(),
    dartCode: '''NavigationToolbar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {},
  ),
  middle: Text('Title'),
  trailing: IconButton(
    icon: Icon(Icons.more_vert),
    onPressed: () {},
  ),
)''',
  ),

  WidgetInfo(
    name: 'Navigator',
    category: WidgetCategory.interaction,
    description:
        'Manages a stack of Route objects to implement screen transitions. '
        'push() adds a new screen; pop() removes the top route.',
    rnEquivalent: 'Equivalent to React Navigation\'s Stack.Navigator + '
        'navigation.navigate() / navigation.goBack(). Flutter\'s Navigator '
        'is built into the framework with no extra package required.',
    demoBuilder: (_) => const NavigatorDemo(),
    dartCode: '''Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => SecondScreen(),
  ),
);

// Back:
Navigator.pop(context);''',
  ),

  WidgetInfo(
    name: 'NestedScrollView',
    category: WidgetCategory.scrolling,
    description:
        'Coordinates a collapsing outer sliver list (e.g. SliverAppBar) '
        'with an independently scrolling inner body.',
    rnEquivalent: 'In React Native you animate a collapsing header manually using '
        'Animated + interpolated styles above a ScrollView/FlatList, or '
        'use libraries like react-native-collapsible.',
    demoBuilder: (_) => const NestedScrollViewDemo(),
    dartCode: '''NestedScrollView(
  headerSliverBuilder: (context, innerBoxIsScrolled) => [
    SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      forceElevated: innerBoxIsScrolled,
    ),
  ],
  body: ListView.builder(
    itemCount: 50,
    itemBuilder: (_, i) => ListTile(title: Text('Item \$i')),
  ),
)''',
  ),

  WidgetInfo(
    name: 'NotificationListener',
    category: WidgetCategory.interaction,
    description:
        'Intercepts Notification objects bubbling up the widget tree. '
        'Commonly used to observe ScrollNotification events from descendant scrollables.',
    rnEquivalent: 'Equivalent to the onScroll prop on ScrollView/FlatList. '
        'NotificationListener works through the widget tree rather than explicit '
        'prop wiring, and can intercept any Notification subclass.',
    demoBuilder: (_) => const NotificationListenerDemo(),
    dartCode: '''NotificationListener<ScrollNotification>(
  onNotification: (notification) {
    if (notification is ScrollUpdateNotification) {
      print(notification.metrics.pixels);
    }
    return false;
  },
  child: ListView.builder(
    itemCount: 100,
    itemBuilder: (_, i) => ListTile(title: Text('\$i')),
  ),
)''',
  ),

  WidgetInfo(
    name: 'Offstage',
    category: WidgetCategory.layout,
    description:
        'Keeps its child in the widget tree (preserving state and animations) '
        'but makes it invisible and non-interactive when offstage = true.',
    rnEquivalent: 'No direct equivalent in React Native. opacity: 0 keeps the '
        'subtree alive but still participates in layout and hit-testing. '
        'Offstage additionally removes size contribution and blocks interactions.',
    demoBuilder: (_) => const OffstageDemo(),
    dartCode: '''Offstage(
  offstage: true, // invisible but alive in tree
  child: Text('Hidden but stateful'),
)''',
  ),

  WidgetInfo(
    name: 'Opacity',
    category: WidgetCategory.painting,
    description:
        'Paints its child with a fractional opacity from 0.0 (transparent) '
        'to 1.0 (opaque). Applies uniformly to the entire subtree.',
    rnEquivalent: 'Every React Native View accepts an opacity style prop. '
        'Flutter\'s Opacity widget wraps any widget and controls transparency, '
        'identical to React Native\'s opacity style.',
    demoBuilder: (_) => const OpacityDemo(),
    dartCode: '''Opacity(
  opacity: 0.5,
  child: Text('Semi-transparent'),
)

// Animated variant:
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 300),
  child: Text('Fades in/out'),
)''',
  ),

  // ── Batch 15 ─────────────────────────────────────────────────────────

  WidgetInfo(
    name: 'OrientationBuilder',
    category: WidgetCategory.layout,
    description:
        'Rebuilds its subtree whenever the device orientation changes '
        'between Orientation.portrait and Orientation.landscape.',
    rnEquivalent: 'In React Native you use useWindowDimensions() and compare '
        'width vs height to derive orientation, then trigger re-renders manually. '
        'OrientationBuilder does this automatically.',
    demoBuilder: (_) => const OrientationBuilderDemo(),
    dartCode: '''OrientationBuilder(
  builder: (context, orientation) {
    return orientation == Orientation.landscape
        ? Row(children: [...])
        : Column(children: [...]);
  },
)''',
  ),

  WidgetInfo(
    name: 'OverflowBar',
    category: WidgetCategory.layout,
    description:
        'Lays out children in a row. When they overflow the available '
        'width it switches automatically to a column layout.',
    rnEquivalent: 'No direct equivalent. In React Native you use flexWrap: '
        '"wrap" on a View or compute onLayout to decide between row/column.',
    demoBuilder: (_) => const OverflowBarDemo(),
    dartCode: '''OverflowBar(
  spacing: 8,
  alignment: OverflowBarAlignment.end,
  children: [
    FilledButton(onPressed: () {}, child: Text('OK')),
    OutlinedButton(onPressed: () {}, child: Text('Cancel')),
  ],
)''',
  ),

  WidgetInfo(
    name: 'OverflowBox',
    category: WidgetCategory.layout,
    description:
        'Imposes its own max constraints on its child, allowing the child '
        'to paint outside the parent\'s boundaries.',
    rnEquivalent: 'No direct equivalent. React Native clips by default. '
        'Use overflow: "visible" on a View or absolute positioning to achieve '
        'a similar visual overflow effect.',
    demoBuilder: (_) => const OverflowBoxDemo(),
    dartCode: '''OverflowBox(
  maxWidth: 300,
  maxHeight: 200,
  child: Container(
    width: 300,
    height: 200,
    color: Colors.blue,
  ),
)''',
  ),

  WidgetInfo(
    name: 'PageView',
    category: WidgetCategory.scrolling,
    description:
        'A scrollable list that displays one full-screen page at a time, '
        'snapping to each page boundary. Supports horizontal and vertical scroll.',
    rnEquivalent: 'Equivalent to FlatList with horizontal + pagingEnabled, '
        'or a ScrollView with pagingEnabled={true}. Libraries like '
        'react-native-pager-view are popular dedicated equivalents.',
    demoBuilder: (_) => const PageViewDemo(),
    dartCode: '''PageView.builder(
  controller: PageController(),
  onPageChanged: (index) => print('Page: \$index'),
  itemCount: 5,
  itemBuilder: (context, index) => Center(
    child: Text('Page \${index + 1}'),
  ),
)''',
  ),

  WidgetInfo(
    name: 'Padding',
    category: WidgetCategory.layout,
    description:
        'Adds empty space around its child using an EdgeInsets value. '
        'The most lightweight way to inset a widget in Flutter.',
    rnEquivalent: 'Directly equivalent to the padding style prop on a '
        'React Native View. e.g. style={{ padding: 16 }} becomes '
        'Padding(padding: EdgeInsets.all(16), child: ...).',
    demoBuilder: (_) => const PaddingDemo(),
    dartCode: '''Padding(
  padding: EdgeInsets.all(16),
  child: Text('Padded text'),
)

// Or with per-side control:
Padding(
  padding: EdgeInsets.fromLTRB(8, 12, 8, 4),
  child: Text('Custom padding'),
)''',
  ),

  WidgetInfo(
    name: 'PhysicalModel',
    category: WidgetCategory.painting,
    description:
        'Clips its child to a shape and paints a material elevation shadow. '
        'The low-level building block behind Card, Material, and ElevatedButton.',
    rnEquivalent: 'The elevation + shadowColor props on React Native\'s View '
        '(Android) or custom shadow styles on iOS. Flutter\'s PhysicalModel '
        'provides cross-platform consistent shadows with precise control.',
    demoBuilder: (_) => const PhysicalModelDemo(),
    dartCode: '''PhysicalModel(
  elevation: 8,
  color: Colors.white,
  shadowColor: Colors.black,
  borderRadius: BorderRadius.circular(12),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Elevated card'),
  ),
)''',
  ),

  WidgetInfo(
    name: 'PhysicalShape',
    category: WidgetCategory.painting,
    description:
        'Paints a physical model shape (using a custom clipper) with an elevation-based shadow.',
    rnEquivalent: 'No direct equivalent for non-rectangular shadowed shapes. '
        'In React Native, you typically draw custom paths via SVG with filters '
        'or use canvas-based shadow APIs.',
    demoBuilder: (_) => const PhysicalShapeDemo(),
    dartCode: '''PhysicalShape(
  clipper: TriangleClipper(),
  elevation: 8.0,
  color: Colors.teal,
  shadowColor: Colors.black,
  child: SizedBox(
    width: 100,
    height: 100,
    child: Center(child: Text('Triangle')),
  ),
)''',
  ),
  WidgetInfo(
    name: 'Placeholder',
    category: WidgetCategory.layout,
    description:
        'A widget that draws a box with a diagonal X, useful during development '
        'to mark unfinished UI areas.',
    rnEquivalent: 'No built-in equivalent. React Native developers usually '
        'render placeholder Views with temporary background colors, text, or '
        'install skeleton placeholder libraries.',
    demoBuilder: (_) => const PlaceholderDemo(),
    dartCode: '''Placeholder(
  color: Colors.blueGrey,
  strokeWidth: 2.0,
  fallbackWidth: 100.0,
  fallbackHeight: 100.0,
)''',
  ),
  WidgetInfo(
    name: 'Positioned',
    category: WidgetCategory.layout,
    description:
        'Controls the position of a child inside a Stack widget.',
    rnEquivalent: 'React Native\'s style properties: { position: "absolute", '
        'top, bottom, left, right }. Unlike Flutter, any View in React Native '
        'can host absolute children without requiring a Stack parent.',
    demoBuilder: (_) => const PositionedDemo(),
    dartCode: '''Positioned(
  top: 10.0,
  left: 20.0,
  width: 100.0,
  height: 50.0,
  child: ColoredBox(color: Colors.purple),
)''',
  ),
  WidgetInfo(
    name: 'PositionedDirectional',
    category: WidgetCategory.layout,
    description:
        'A direction-aware version of Positioned that respects LTR and RTL layouts.',
    rnEquivalent: 'React Native style properties: start and end instead of '
        'left and right. These properties automatically mirror absolute placement '
        'based on device writing direction.',
    demoBuilder: (_) => const PositionedDirectionalDemo(),
    dartCode: '''PositionedDirectional(
  top: 10.0,
  start: 20.0,
  width: 100.0,
  height: 50.0,
  child: ColoredBox(color: Colors.orange),
)''',
  ),
  WidgetInfo(
    name: 'PositionedTransition',
    category: WidgetCategory.animation,
    description:
        'Animates the position of a child inside a Stack from a start rect to an end rect.',
    rnEquivalent: 'React Native\'s Animated / Reanimated absolute offset animations '
        '(interpolating top, left, width, height layout styles on an Animated.View).',
    demoBuilder: (_) => const PositionedTransitionDemo(),
    dartCode: '''PositionedTransition(
  rect: rectAnimation,
  child: Container(color: Colors.blue),
)''',
  ),
  WidgetInfo(
    name: 'PreferredSize',
    category: WidgetCategory.layout,
    description:
        'A widget with a preferred size that does not impose constraints on its child.',
    rnEquivalent: 'React Native layout does not use size contracts. '
        'Components specify height and width directly in stylesheets, '
        'and parent headers/tabs read dimensions dynamically.',
    demoBuilder: (_) => const PreferredSizeDemo(),
    dartCode: '''PreferredSize(
  preferredSize: Size.fromHeight(60.0),
  child: MyCustomAppBar(),
)''',
  ),

  WidgetInfo(
    name: 'RawImage',
    category: WidgetCategory.painting,
    description:
        'A low-level widget that displays a dart:ui.Image directly.',
    rnEquivalent: 'No direct equivalent. React Native developers must convert '
        'bitmaps to base64 URIs or write custom native drawing layers.',
    demoBuilder: (_) => const RawImageDemo(),
    dartCode: '''RawImage(
  image: uiImage,
  scale: 2.0,
  color: Colors.teal,
  colorBlendMode: BlendMode.modulate,
)''',
  ),
  WidgetInfo(
    name: 'RelativePositionedTransition',
    category: WidgetCategory.animation,
    description:
        'Animates a child\'s position within a Stack relative to a fixed reference size.',
    rnEquivalent: 'React Native style property animations mapped to left/top/width/height '
        'interpolations, utilizing measurements from parent onLayout callbacks.',
    demoBuilder: (_) => const RelativePositionedTransitionDemo(),
    dartCode: '''RelativePositionedTransition(
  rect: rectAnimation,
  size: Size(200, 150),
  child: MyBox(),
)''',
  ),
  WidgetInfo(
    name: 'RepaintBoundary',
    category: WidgetCategory.painting,
    description:
        'Isolates child painting to prevent parent updates from forcing a redraw.',
    rnEquivalent: 'Optimization props: renderToHardwareTextureAndroid (Android) '
        'and shouldRasterizeIOS (iOS) which cache views as bitmaps on the GPU.',
    demoBuilder: (_) => const RepaintBoundaryDemo(),
    dartCode: '''RepaintBoundary(
  child: MyComplexCanvasDrawing(),
)''',
  ),
  WidgetInfo(
    name: 'RotatedBox',
    category: WidgetCategory.layout,
    description:
        'Rotates its child by a number of quarter turns, updating layout constraints.',
    rnEquivalent: 'transform: [{ rotate: "90deg" }] styling in React Native. '
        'Note that React Native transforms do not modify parent layout bounds.',
    demoBuilder: (_) => const RotatedBoxDemo(),
    dartCode: '''RotatedBox(
  quarterTurns: 1,
  child: Text('Rotated by 90 degrees'),
)''',
  ),
  WidgetInfo(
    name: 'RotationTransition',
    category: WidgetCategory.animation,
    description:
        'Animates the rotation of a child widget using an AnimationController.',
    rnEquivalent: 'React Native\'s style transforms: transform: [{ rotate: spinInterpolate }].',
    demoBuilder: (_) => const RotationTransitionDemo(),
    dartCode: '''RotationTransition(
  turns: animationController,
  child: Icon(Icons.settings),
)''',
  ),
  WidgetInfo(
    name: 'Row',
    category: WidgetCategory.layout,
    description:
        'Lays out its children in a horizontal array (flexbox row equivalent).',
    rnEquivalent: '<View style={{ flexDirection: "row" }} /> along with '
        'justifyContent and alignItems style configurations.',
    demoBuilder: (_) => const RowDemo(),
    dartCode: '''Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Box1(),
    Box2(),
  ],
)''',
  ),
];


