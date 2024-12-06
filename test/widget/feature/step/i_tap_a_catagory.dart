import 'package:flutter_test/flutter_test.dart';

/// Usage: i tap a Catagory
Future<void> iTapACatagory(WidgetTester tester, String catagory) async {
  await tester.tap(find.text(catagory));
  await tester.pumpAndSettle();
}
