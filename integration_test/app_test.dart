import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:cubit_counter/main.dart' as app;

void main() {
  group('CounterApp', () {
    testWidgets('renders correct AppBar text', (tester) async {
      await tester.pumpApp();
      expect(find.text('Counter Cubit'), findsOneWidget);
    });

    testWidgets('renders correct initial count', (tester) async {
      await tester.pumpApp();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('tapping increment button updates the count', (tester) async {
      await tester.pumpApp();
      await tester.incrementCounter();
      expect(find.text('1'), findsOneWidget);
      await tester.incrementCounter();
      expect(find.text('2'), findsOneWidget);
      await tester.incrementCounter();
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('tapping decrement button updates the count', (tester) async {
      await tester.pumpApp();
      await tester.decrementCounter();
      expect(find.text('-1'), findsOneWidget);
      await tester.decrementCounter();
      expect(find.text('-2'), findsOneWidget);
      await tester.decrementCounter();
      expect(find.text('-3'), findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();
    await pumpAndSettle();
  }

  Future<void> incrementCounter() async {
    await tap(
      find.byKey(const Key('counter_cubit_increment')),
    );
    await pump();
  }

  Future<void> decrementCounter() async {
    await tap(
      find.byKey(const Key('counter_cubit_decrement')),
    );
    await pump();
  }
}
