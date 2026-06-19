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
];
