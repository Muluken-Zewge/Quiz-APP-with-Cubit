import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/difficulty_selection_page.dart';

/// Usage: i am on the difficulty selection page
Future<void> iAmOnTheDifficultySelectionPage(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(home: DifficultySelectionPage(selectedCategory: 'Music')),
  );
  await tester.pumpAndSettle();
}
