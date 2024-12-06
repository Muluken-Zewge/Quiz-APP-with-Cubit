import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_data_source_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/usecases/get_quiz_usecase.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/question_number_selection_page.dart';

/// Usage: i am on question number Selection screen
Future<void> iAmOnQuestionNumberSelectionScreen(
    WidgetTester tester, Dio dio) async {
  final quizRemoteDataSource = QuizRemoteDataSourceImpl(dio: dio);
  final quizRepository =
      QuizRepositoryImpl(quizRemoteDatasource: quizRemoteDataSource);
  final getQuizUsecase = GetQuizUsecase(quizRepository);
  await tester.pumpWidget(BlocProvider(
    create: (_) => QuizCubit(getQuizUsecase),
    child: const MaterialApp(
      home: QuestionNumberSelectionPage(
          selectedCategory: 'Music', selectedDifficulty: 'Medium'),
    ),
  ));
  await tester.pumpAndSettle();
}
