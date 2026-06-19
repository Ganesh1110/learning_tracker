import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_tracker/app.dart';
import 'package:learning_tracker/shared/widgets/widget_card.dart';

void main() {
  testWidgets('App renders catalog screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Flutter Widgets for RN Devs'), findsOneWidget);
  });

  testWidgets('Test AlwaysStoppedAnimation and Animatable flows without crashes', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // 1. Test AlwaysStoppedAnimation
    await tester.enterText(find.byType(TextField), 'AlwaysStoppedAnimation');
    await tester.pump();

    final alwaysStoppedCard = find.descendant(
      of: find.byType(WidgetCard),
      matching: find.text('AlwaysStoppedAnimation'),
    );
    expect(alwaysStoppedCard, findsOneWidget);
    await tester.tap(alwaysStoppedCard);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    // Verify detail page loaded
    expect(find.text('Fade Transition'), findsOneWidget);

    // Interact with Dropdown
    final colorDropdown = find.byType(DropdownButton<Color>);
    expect(colorDropdown, findsOneWidget);
    await tester.tap(colorDropdown);
    await tester.pumpAndSettle();
    
    // Tap the 'Pink' dropdown item (which has value Colors.pink)
    final pinkItem = find.text('Pink').last;
    await tester.tap(pinkItem);
    await tester.pumpAndSettle();

    // Interact with Slider
    final slider = find.byType(Slider);
    expect(slider, findsOneWidget);
    await tester.drag(slider, const Offset(50.0, 0.0));
    await tester.pump();

    // Navigate back to catalog
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    // 2. Test Animatable
    final searchField = find.byType(TextField);
    await tester.enterText(searchField, ''); // clear search
    await tester.pump();
    await tester.enterText(searchField, 'Animatable');
    await tester.pump();

    final animatableCard = find.descendant(
      of: find.byType(WidgetCard),
      matching: find.text('Animatable'),
    );
    expect(animatableCard, findsOneWidget);
    await tester.tap(animatableCard);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    // Verify detail page loaded
    expect(find.text('Tween Curve: '), findsOneWidget);

    // Interact with Curve Dropdown
    final curveDropdown = find.byType(DropdownButton<Curve>);
    expect(curveDropdown, findsOneWidget);
    await tester.tap(curveDropdown);
    await tester.pumpAndSettle();

    // Tap the 'Linear' curve item
    final linearItem = find.text('Linear').last;
    await tester.tap(linearItem);
    await tester.pumpAndSettle();

    // Interact with Play/Pause button
    final playPauseButton = find.byType(IconButton);
    expect(playPauseButton, findsOneWidget);
    await tester.tap(playPauseButton);
    await tester.pump();
  });
}

