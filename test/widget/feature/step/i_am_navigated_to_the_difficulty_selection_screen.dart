import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/difficulty_selection_page.dart';

/// Usage: I am navigated to the difficulty selection screen
Future<void> iAmNavigatedToTheDifficultySelectionScreen(
    WidgetTester tester) async {
  const difficultyScreen = DifficultySelectionPage;
  expect(find.byType(difficultyScreen), findsOneWidget);
}
