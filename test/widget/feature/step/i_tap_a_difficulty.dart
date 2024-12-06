import 'package:flutter_test/flutter_test.dart';

/// Usage: i tap a difficulty
Future<void> iTapADifficulty(WidgetTester tester, String difficulty) async {
  await tester.tap(find.text(difficulty));
  await tester.pumpAndSettle();
}
