import 'package:dartz/dartz.dart' as dartz;
import 'package:quiz_app_with_cubit/core/error/failure.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/entities/quiz_entity.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/repositories/quiz_repository.dart';

class GetQuizUsecase {
  final QuizRepository quizRepository;

  GetQuizUsecase(this.quizRepository);
  Future<dartz.Either<Failure, List<QuizEntity>>> call(
      String category, String difficulty, int numberOfQusetions) {
    return quizRepository.getQuiz(category, difficulty, numberOfQusetions);
  }
}
