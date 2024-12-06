import 'package:bdd_widget_test/data_table.dart' as bdd;
import 'package:flutter_test/flutter_test.dart';

import 'i_see_text.dart';

/// Usage: i see the following difficulty levels:
Future<void> iSeeTheFollowingDifficultyLevels(
    WidgetTester tester, bdd.DataTable dataTable) async {
  final List<List<dynamic>> dataLists = dataTable.asLists();
  if (dataLists.isEmpty || dataLists[0].length < 3) {
    throw Exception('DataTable does not contain the expected structure');
  }
  for (final text in dataLists[0]) {
    await iSeeText(tester, text.toString());
  }
}
