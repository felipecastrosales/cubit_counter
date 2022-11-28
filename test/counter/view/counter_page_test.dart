import 'package:cubit_counter/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterPage should renders', () {
    testWidgets('CounterView', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CounterPage(),
        ),
      );
      expect(
        find.byType(CounterView),
        findsOneWidget,
      );
    });
  });
}
