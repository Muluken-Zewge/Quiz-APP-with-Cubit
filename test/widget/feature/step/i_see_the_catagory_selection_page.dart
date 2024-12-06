import 'package:flutter_test/flutter_test.dart';

import 'i_see_text.dart';

/// Usage: i see the Catagory Selection page
Future<void> iSeeTheCatagorySelectionPage(WidgetTester tester) async {
  await iSeeText(tester, "Welcome to Baka's Quiz App");
  await iSeeText(tester, 'Choose a category');
  await iSeeText(tester, 'Arts & Literature');
  await iSeeText(tester, 'Film & TV');
  await iSeeText(tester, 'Food & Drink');
  await iSeeText(tester, 'General Knowledge');
  await iSeeText(tester, 'Geography');
  await iSeeText(tester, 'History');
  await iSeeText(tester, 'Music');
}
