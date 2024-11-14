import 'package:dartz/dartz.dart' as dartz;
import 'package:quiz_app_with_cubit/core/error/failure.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/entities/quiz_entity.dart';

abstract class QuizRepository {
  Future<dartz.Either<Failure, QuizEntity>> getQuiz(
      String category, String difficulty, int numberOfQusetions);
}
