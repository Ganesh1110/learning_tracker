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
}

