import 'package:flutter/material.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_data_source_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/models/quiz_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<QuizModel>> _quizzes;

  @override
  void initState() {
    super.initState();
    final dataSource = QuizRemoteDataSourceImpl();
    _quizzes = dataSource.fetchQuiz('science', 'medium', 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizes'),
      ),
    );
  }
}
