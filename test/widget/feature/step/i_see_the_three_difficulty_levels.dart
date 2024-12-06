import 'package:flutter_test/flutter_test.dart';

import 'i_see_text.dart';

/// Usage: i see the three difficulty levels
Future<void> iSeeTheThreeDifficultyLevels(WidgetTester tester) async {
  await iSeeText(tester, 'Easy');
  await iSeeText(tester, 'Medium');
  await iSeeText(tester, 'Hard');
}
