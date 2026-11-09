import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/order.dart';
import 'package:lab_04/order_summary.dart';

void main() {
  testWidgets('order summary shows correct text and total',
      (WidgetTester tester) async {
    const order = Order(
      itemName: 'Cheese Pizza',
      quantity: 2,
      unitPrice: 12.50,
    );

    await tester.pumpWidget(
      const MaterialApp(home: OrderSummaryScreen(order: order)),
    );

    expect(find.text('Item: Cheese Pizza'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('Total: RM 25.00'), findsOneWidget);
  });

  testWidgets('back button returns to the previous screen',
      (WidgetTester tester) async {
    const order = Order(
      itemName: 'Cheese Pizza',
      quantity: 2,
      unitPrice: 12.50,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const OrderSummaryScreen(order: order),
                ),
              ),
              child: const Text('Open summary'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open summary'));
    await tester.pumpAndSettle();
    expect(find.text('Order Summary'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('Order Summary'), findsNothing);
    expect(find.text('Open summary'), findsOneWidget);
  });
}