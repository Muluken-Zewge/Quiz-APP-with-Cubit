import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/difficulty_selection_page.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/question_number_selection_page.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/screens/home.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/screens/questions_screen.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/screens/result_screen.dart';
import 'package:quiz_app_with_cubit/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full app test', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    Future.delayed(const Duration(seconds: 2));

    final catagory = find.text('Music');
    await tester.tap(catagory);
    await tester.pumpAndSettle();
    Future.delayed(const Duration(seconds: 2));

    const difficultyScreen = DifficultySelectionPage;
    expect(find.byType(difficultyScreen), findsOneWidget);

    final difficulty = find.text('Medium');
    await tester.tap(difficulty);
    await tester.pumpAndSettle();
    Future.delayed(const Duration(seconds: 2));

    const questionNumberScreen = QuestionNumberSelectionPage;
    expect(find.byType(questionNumberScreen), findsOneWidget);

    final startQuizButton = find.byType(ElevatedButton);
    await tester.tap(startQuizButton);
    await tester.pumpAndSettle();
    Future.delayed(const Duration(seconds: 4));
    // final progressIndicator = find.byType(CircularProgressIndicator);

    // expect(progressIndicator, findsOneWidget);
    // Future.delayed(const Duration(seconds: 2));

    // await tester.pumpAndSettle();
    const questionScreen = QuestionsScreen;
    expect(find.byType(questionScreen), findsOneWidget);

    final slectedChoice = find.byType(GestureDetector).at(1);
    await tester.tap(slectedChoice);
    await tester.pump();
    Future.delayed(const Duration(seconds: 4));

    final finishButton = find.byType(ElevatedButton);
    await tester.tap(finishButton);
    await tester.pumpAndSettle();
    Future.delayed(const Duration(seconds: 4));

    const resultScreen = ResultScreen;
    expect(find.byType(resultScreen), findsOneWidget);

    final homeIcon = find.byIcon(Icons.home);
    await tester.tap(homeIcon);
    await tester.pumpAndSettle();
    Future.delayed(const Duration(seconds: 4));

    const homeScreen = HomeScreen;
    expect(find.byType(homeScreen), findsOneWidget);
  });
}
