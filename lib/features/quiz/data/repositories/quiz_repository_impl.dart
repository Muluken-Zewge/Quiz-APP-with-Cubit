import 'package:dartz/dartz.dart' as dartz;
import 'package:quiz_app_with_cubit/core/error/failure.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_datasource.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/entities/quiz_entity.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDatasource quizRemoteDatasource;

  QuizRepositoryImpl({required this.quizRemoteDatasource});

  @override
  Future<dartz.Either<Failure, List<QuizEntity>>> getQuiz(
      String category, String difficulty, int numberOfQusetions) async {
    try {
      final quizModels = await quizRemoteDatasource.fetchQuiz(
          category, difficulty, numberOfQusetions);
      final quizEntities =
          quizModels.map((model) => model.toQuizEntity()).toList();

      return dartz.right(quizEntities);
    } catch (e) {
      return dartz.left(ServerFailure());
    }
  }
}
