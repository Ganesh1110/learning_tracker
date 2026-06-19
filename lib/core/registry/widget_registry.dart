import 'package:learning_tracker/core/models/widget_info.dart';
import 'package:learning_tracker/core/models/widget_category.dart';
import 'package:learning_tracker/demos/layout/absorb_pointer_demo.dart';
import 'package:learning_tracker/explanations/layout/absorb_pointer_explanation.dart';

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
];
