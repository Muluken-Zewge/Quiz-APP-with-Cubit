import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_with_cubit/core/injection_container.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/difficulty_selection_page.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/question_number_selection_page.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = serviceLocator<QuizCubit>();
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
