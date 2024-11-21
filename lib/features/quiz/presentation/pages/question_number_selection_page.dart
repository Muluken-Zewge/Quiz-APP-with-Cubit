import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/screens/questions_screen.dart';

class QuestionNumberSelectionPage extends StatefulWidget {
  final String selectedCategory;
  final String selectedDifficulty;

  const QuestionNumberSelectionPage({
    super.key,
    required this.selectedCategory,
    required this.selectedDifficulty,
  });

  @override
  State<QuestionNumberSelectionPage> createState() =>
      _QuestionNumberSelectionPageState();
}

class _QuestionNumberSelectionPageState
    extends State<QuestionNumberSelectionPage> {
  final int _counterInit = 1;
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizCubit, QuizState>(
      listener: (context, state) {
        if (state is QuizLoadingSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionsScreen(questions: state.quizes),
            ),
          );
        } else if (state is QuizLoadingFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Failed to fetch quizzes. Please try again."),
            ),
          );
        } else if (state is QuizLoadingState) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => Container(
                    color: Colors.white,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text(
                            "Loading...",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                  ));
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Select Number of Questions")),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade800, Colors.purple.shade800],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    "Category: ${widget.selectedCategory}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Difficulty: ${widget.selectedDifficulty}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    "Choose number of questions",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  const SizedBox(height: 26),
                  Center(
                    child: CartStepperInt(
                      stepper: _counterInit,
                      size: 45,
                      axis: Axis.horizontal,
                      elevation: 7,
                      value: _counter,
                      didChangeCount: (count) {
                        setState(() {
                          if (count <= 10) {
                            _counter = count;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 90),
                  ElevatedButton(
                    onPressed: () {
                      context.read<QuizCubit>().fetchQuizzes(
                            widget.selectedCategory,
                            widget.selectedDifficulty.toLowerCase(),
                            _counter,
                          );
                    },
                    child: const Text(
                      'Start Quiz',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
