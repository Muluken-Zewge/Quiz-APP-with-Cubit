import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/question_number_selection_page.dart';

/// Usage: I am navigated to the question number selection screen
Future<void> iAmNavigatedToTheQuestionNumberSelectionScreen(
    WidgetTester tester) async {
  const questionSelectionScreen = QuestionNumberSelectionPage;
  expect(find.byType(questionSelectionScreen), findsOneWidget);
}
