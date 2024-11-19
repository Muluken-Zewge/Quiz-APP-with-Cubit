import 'package:quiz_app_with_cubit/features/quiz/data/models/quiz_model.dart';

abstract class QuizRemoteDatasource {
  Future<List<QuizModel>> fetchQuiz(
      String category, String difficulty, int numberOfQusetions);
}
