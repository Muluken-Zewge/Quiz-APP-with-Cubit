import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_data_source_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/usecases/get_quiz_usecase.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/difficulty_selection_page.dart';

/// Usage: i am on the difficulty selection screen
Future<void> iAmOnTheDifficultySelectionScreen(
    WidgetTester tester, Dio dio) async {
  final quizRemoteDataSource = QuizRemoteDataSourceImpl(dio: dio);
  final quizRepository =
      QuizRepositoryImpl(quizRemoteDatasource: quizRemoteDataSource);
  final getQuizUsecase = GetQuizUsecase(quizRepository);
  await tester.pumpWidget(BlocProvider<QuizCubit>(
    create: (context) => QuizCubit(getQuizUsecase),
    child: const MaterialApp(
      home: DifficultySelectionPage(
        selectedCategory: 'Music',
      ),
    ),
  ));
  await tester.pumpAndSettle();
}
