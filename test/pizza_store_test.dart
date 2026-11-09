import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/main.dart';

void main() {
  testWidgets('menu lists the three items', (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaApp());

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('tapping a card opens its detail screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaApp());

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    // The detail screen shows the name twice: in the AppBar and the body.
    expect(find.text('Vegetable Pizza'), findsNWidgets(2));
    expect(find.text('Fresh vegetables on a crisp, golden crust.'),
        findsOneWidget);
    // The menu is no longer visible.
    expect(find.text('Pizza Store Menu'), findsNothing);
  });

  testWidgets('back button returns to the menu', (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaApp());

    await tester.tap(find.text('Cheese Pizza'));
    await tester.pumpAndSettle();
    expect(find.text('Pizza Store Menu'), findsNothing);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('Pizza Store Menu'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });
}