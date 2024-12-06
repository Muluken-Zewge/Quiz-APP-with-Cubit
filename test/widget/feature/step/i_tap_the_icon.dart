import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: i tap the {'+'} icon
Future<void> iTapTheIcon(WidgetTester tester, String icon) async {
  final iconData = switch (icon) {
    '+' => CupertinoIcons.add,
    '-' => CupertinoIcons.minus,
    _ => throw Exception('Unexpected icon')
  };
  await tester.tap(find.byIcon(iconData));
  await tester.pumpAndSettle();
}
