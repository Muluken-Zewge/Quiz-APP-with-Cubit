import 'package:flutter_test/flutter_test.dart';

/// Usage: i see {1} number
Future<void> iSeeNumber(WidgetTester tester, num number) async {
  expect(find.text('$number'), findsOneWidget);
}
