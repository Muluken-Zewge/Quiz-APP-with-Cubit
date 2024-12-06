import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_data_source_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/usecases/get_quiz_usecase.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/difficulty_selection_page.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/question_number_selection_page.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final dio = Dio();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final quizRemoteDataSource = QuizRemoteDataSourceImpl(dio: dio);
    final quizRepository =
        QuizRepositoryImpl(quizRemoteDatasource: quizRemoteDataSource);
    final getQuizUsecase = GetQuizUsecase(quizRepository);
    return BlocProvider(
      create: (context) {
        final cubit = QuizCubit(getQuizUsecase);
        cubit.initialize();
        return cubit;
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuizWrapper(),
      ),
    );
  }
}

class QuizWrapper extends StatelessWidget {
  const QuizWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizCubit, QuizState>(
      listener: (context, state) {
        if (state is CategorySelectedSuccessState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DifficultySelectionPage(
                      selectedCategory: state.selectedCategory)));
        } else if (state is DifficultySelectedSuccessState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionNumberSelectionPage(
                        selectedCategory: state.selectedCategory,
                        selectedDifficulty: state.selectedDifficulty,
                      )));
        }
      },
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizInitialSuccessState) {
            return const HomeScreen();
          }
          return const HomeScreen();
        },
      ),
    );
  }
}
