import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_tracker/app.dart';
import 'package:learning_tracker/core/registry/widget_registry.dart';

void main() {
  testWidgets('App renders catalog screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Flutter Widgets for RN Devs'), findsOneWidget);
  });

  testWidgets('Batch 2 widget demos render successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final batch2Names = ['Center', 'ClipOval', 'ClipPath', 'ClipRect', 'ClipRRect'];
    
    for (final name in batch2Names) {
      final widgetInfo = widgetRegistry.firstWhere((w) => w.name == name);
      try {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: widgetInfo.demoBuilder(context),
                  );
                },
              ),
            ),
          ),
        );
        expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
      } catch (e) {
        fail('Widget demo for $name failed to render: $e');
      }
    }
  });

  testWidgets('Batch 3 widget demos render successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final batch3Names = [
      'ClipRSuperellipse',
      'ColoredBox',
      'Column',
      'CompositedTransformTarget',
      'CompositedTransformFollower',
    ];
    
    for (final name in batch3Names) {
      final widgetInfo = widgetRegistry.firstWhere((w) => w.name == name);
      try {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: widgetInfo.demoBuilder(context),
                  );
                },
              ),
            ),
          ),
        );
        expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
      } catch (e) {
        fail('Widget demo for $name failed to render: $e');
      }
    }
  });

  testWidgets('Batch 4: ConstrainedBox renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ConstrainedBox');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 4: ConstrainedLayoutBuilder renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ConstrainedLayoutBuilder');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 4: ConstraintsTransformBox renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ConstraintsTransformBox');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 4: Container renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Container');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 4: CustomMultiChildLayout renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'CustomMultiChildLayout');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 5: CustomPaint renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'CustomPaint');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 5: CustomPainter renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'CustomPainter');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 5: CustomScrollView renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'CustomScrollView');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 5: CustomSingleChildLayout renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'CustomSingleChildLayout');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 5: DecoratedBox renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DecoratedBox');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 6: DecoratedBoxTransition renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DecoratedBoxTransition');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 6: DecoratedSliver renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DecoratedSliver');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 6: DefaultAssetBundle renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DefaultAssetBundle');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 6: DefaultSelectionStyle renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DefaultSelectionStyle');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 6: DefaultTextEditingShortcuts renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DefaultTextEditingShortcuts');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 7: DefaultTextHeightBehavior renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DefaultTextHeightBehavior');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 7: DefaultTextStyle renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DefaultTextStyle');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 7: DefaultTextStyleTransition renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DefaultTextStyleTransition');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 7: DefaultWidgetsLocalizations renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DefaultWidgetsLocalizations');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 7: Directionality renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Directionality');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 7: Dismissible renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Dismissible');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 8: Draggable renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Draggable');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 8: DragTarget renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DragTarget');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 8: DraggableScrollableSheet renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'DraggableScrollableSheet');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 8: ErrorWidget renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ErrorWidget');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 8: ExcludeSemantics renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ExcludeSemantics');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 8: Expanded renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Expanded');
    // Note: Expanded must be placed inside a Flex container, like a Row or Column.
    // However, expanded_demo.dart is already wrapping its Row internally, so loading
    // it inside MaterialApp -> Scaffold -> SingleChildScrollView is completely fine.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 9: FadeTransition renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'FadeTransition');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 9: FittedBox renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'FittedBox');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 9: Flexible renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Flexible');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 9: Flow renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Flow');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 9: FlutterLogo renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'FlutterLogo');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 9: Focus renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Focus');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 10: FocusableActionDetector renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'FocusableActionDetector');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 10: FocusTraversalGroup renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'FocusTraversalGroup');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 10: Form renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Form');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 10: FormField renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'FormField');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 10: FractionallySizedBox renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'FractionallySizedBox');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 10: FutureBuilder renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'FutureBuilder');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
    // Complete the mock fetch future delay timer to clean up pending timers
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('Batch 11: GestureDetector renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'GestureDetector');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 11: GridView renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'GridView');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 11: Hero renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Hero');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 11: Icon renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Icon');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 11: IgnorePointer renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'IgnorePointer');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 11: Image renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Image');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 12: InteractiveViewer renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'InteractiveViewer');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 12: IntrinsicHeight renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'IntrinsicHeight');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 12: IntrinsicWidth renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'IntrinsicWidth');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 12: KeyboardListener renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'KeyboardListener');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 12: LayoutBuilder renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'LayoutBuilder');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 12: LimitedBox renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'LimitedBox');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 13: ListBody renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ListBody');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 13: ListenableBuilder renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ListenableBuilder');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 13: Listener renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'Listener');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 13: ListView renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ListView');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 13: ListWheelScrollView renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'ListWheelScrollView');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 13: MouseRegion renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo = widgetRegistry.firstWhere((w) => w.name == 'MouseRegion');
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(builder: (context) => SingleChildScrollView(child: widgetInfo.demoBuilder(context))))));
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  // ── Batch 14 ──────────────────────────────────────────────────────────────

  testWidgets('Batch 14: NavigationToolbar renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'NavigationToolbar');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 14: Navigator renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Navigator');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 14: NestedScrollView renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'NestedScrollView');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 14: NotificationListener renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'NotificationListener');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 14: Offstage renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Offstage');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 14: Opacity renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Opacity');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  // ── Batch 15 ──────────────────────────────────────────────────────────────

  testWidgets('Batch 15: OrientationBuilder renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'OrientationBuilder');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 15: OverflowBar renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'OverflowBar');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 15: OverflowBox renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'OverflowBox');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 15: PageView renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'PageView');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 15: Padding renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Padding');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 15: PhysicalModel renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'PhysicalModel');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  // ── Batch 16 ──────────────────────────────────────────────────────────────

  testWidgets('Batch 16: PhysicalShape renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'PhysicalShape');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 16: Placeholder renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Placeholder');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 16: Positioned renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Positioned');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 16: PositionedDirectional renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'PositionedDirectional');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 16: PositionedTransition renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'PositionedTransition');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 16: PreferredSize renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'PreferredSize');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  // ── Batch 17 ──────────────────────────────────────────────────────────────

  testWidgets('Batch 17: RawImage renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'RawImage');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 17: RelativePositionedTransition renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'RelativePositionedTransition');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 17: RepaintBoundary renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'RepaintBoundary');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 17: RotatedBox renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'RotatedBox');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 17: RotationTransition renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'RotationTransition');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 17: Row renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Row');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  // ── Batch 18 ──────────────────────────────────────────────────────────────

  testWidgets('Batch 18: SafeArea renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'SafeArea');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 18: ScaleTransition renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'ScaleTransition');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 18: Semantics renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Semantics');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 18: ShaderMask renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'ShaderMask');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 18: Shortcuts renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Shortcuts');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 18: SingleChildScrollView renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'SingleChildScrollView');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  // ── Batch 19 ──────────────────────────────────────────────────────────────

  testWidgets('Batch 19: SizedBox renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'SizedBox');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 19: SizedOverflowBox renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'SizedOverflowBox');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 19: SizeTransition renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'SizeTransition');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 19: SlideTransition renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'SlideTransition');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 19: SliverToBoxAdapter renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'SliverToBoxAdapter');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });

  testWidgets('Batch 19: Spacer renders successfully',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final widgetInfo =
        widgetRegistry.firstWhere((w) => w.name == 'Spacer');
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Builder(
                    builder: (context) => widgetInfo.demoBuilder(context))))));
    await tester.pump();
    expect(find.byWidgetPredicate((_) => true), findsAtLeast(1));
  });
}

