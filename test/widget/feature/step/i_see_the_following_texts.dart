import 'package:bdd_widget_test/data_table.dart' as bdd;
import 'package:flutter_test/flutter_test.dart';

import 'i_see_text.dart';

/// Usage: i see the following texts:
Future<void> iSeeTheFollowingTexts(
    WidgetTester tester, bdd.DataTable dataTable) async {
  final List<List<dynamic>> dataLists = dataTable.asLists();
  await iSeeText(tester, dataLists[0][0]);
  await iSeeText(tester, dataLists[0][1]);
  await iSeeText(tester, dataLists[0][2]);
}
