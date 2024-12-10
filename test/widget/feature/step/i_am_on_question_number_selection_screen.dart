import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/core/injection_container.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/question_number_selection_page.dart';

/// Usage: i am on question number Selection screen
Future<void> iAmOnQuestionNumberSelectionScreen(
    WidgetTester tester, Dio dio) async {
  await tester.pumpWidget(BlocProvider(
    create: (_) => serviceLocator<QuizCubit>(),
    child: const MaterialApp(
      home: QuestionNumberSelectionPage(
          selectedCategory: 'Music', selectedDifficulty: 'Medium'),
    ),
  ));
  await tester.pumpAndSettle();
}
