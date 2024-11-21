import 'package:dio/dio.dart';
import 'package:quiz_app_with_cubit/core/utils/app_url.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_datasource.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/models/quiz_model.dart';

class QuizRemoteDataSourceImpl implements QuizRemoteDatasource {
  @override
  Future<List<QuizModel>> fetchQuiz(
      String category, String difficulty, int numberOfQusetions) async {
    try {
      final response = await Dio().get(
          '${AppUrl.baseUrl}?categories=$category&difficulties=$difficulty&limit=$numberOfQusetions');
      if (response.statusCode == 200) {
        final List<dynamic> quizJson = response.data as List<dynamic>;
        final quizzes =
            quizJson.map((json) => QuizModel.fromJson(json)).toList();
        return quizzes;
      } else {
        throw Exception('Failed to load quizzes');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching quizzes');
    }
  }
}
