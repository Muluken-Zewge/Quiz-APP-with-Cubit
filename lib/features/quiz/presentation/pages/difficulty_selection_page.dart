import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/pages/question_number_selection_page.dart';

class DifficultySelectionPage extends StatelessWidget {
  final String selectedCategory;

  const DifficultySelectionPage({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final List<String> difficulties = ["Easy", "Medium", "Hard"];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Select Difficulty",
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade800, Colors.purple.shade800])),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Category: $selectedCategory",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Choose a difficulty",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: difficulties.length,
                    itemBuilder: (context, index) {
                      return Card(
                        surfaceTintColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        child: ListTile(
                          title: Center(child: Text(difficulties[index])),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         QuestionNumberSelectionPage(
                            //       selectedCategory: selectedCategory,
                            //       selectedDifficulty: difficulties[index],
                            //     ),
                            //   ),
                            // );
                            context.read<QuizCubit>().selectedDifficulty(
                                selectedCategory, difficulties[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
