import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/core/injection_container.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/difficulty_selection_page.dart';

/// Usage: i am on the difficulty selection screen
Future<void> iAmOnTheDifficultySelectionScreen(
    WidgetTester tester, Dio dio) async {
  await tester.pumpWidget(BlocProvider<QuizCubit>(
    create: (context) => serviceLocator<QuizCubit>(),
    child: const MaterialApp(
      home: DifficultySelectionPage(
        selectedCategory: 'Music',
      ),
    ),
  ));
  await tester.pumpAndSettle();
}
