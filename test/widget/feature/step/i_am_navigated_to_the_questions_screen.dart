import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/screens/questions_screen.dart';

/// Usage: I am navigated to the questions screen
Future<void> iAmNavigatedToTheQuestionsScreen(WidgetTester tester) async {
  const questionsScreen = QuestionsScreen;
  expect(find.byType(questionsScreen), findsOneWidget);
}
