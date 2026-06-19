import 'package:flutter_test/flutter_test.dart';
import 'package:learning_tracker/app.dart';

void main() {
  testWidgets('App renders catalog screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Flutter Widgets for RN Devs'), findsOneWidget);
  });
}

