import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/difficulty_selection_page.dart';

/// Usage: i see select Difficulty screen
Future<void> iSeeSelectDifficultyScreen(WidgetTester tester) async {
  final difficultyPage = find.byType(DifficultySelectionPage);
  expect(difficultyPage, findsOneWidget);
}
