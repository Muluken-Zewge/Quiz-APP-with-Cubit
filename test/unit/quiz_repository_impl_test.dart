import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app_with_cubit/core/error/failure.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_datasource.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/models/quiz_model.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/entities/quiz_entity.dart';

import 'quiz_repository_impl_test.mocks.dart';

@GenerateMocks([QuizRemoteDatasource])
void main() {
  late QuizRepositoryImpl quizRepositoryImpl;
  late MockQuizRemoteDatasource mockQuizRemoteDatasource;

  setUp(() {
    mockQuizRemoteDatasource = MockQuizRemoteDatasource();
    quizRepositoryImpl =
        QuizRepositoryImpl(quizRemoteDatasource: mockQuizRemoteDatasource);
  });

  group('get quiz', () {
    final quizModels = [
      const QuizModel(
          id: 'id',
          category: 'Music',
          correctAnswer: 'correctAnswer',
          question: 'question',
          difficulty: 'Easy',
          shuffledAnswers: ['shuffledAnswers'])
    ];

    final quizEntities = quizModels
        .map((model) => QuizEntity(
            id: model.id,
            category: model.category,
            correctAnswer: model.correctAnswer,
            question: model.question,
            difficulty: model.difficulty,
            shuffledAnswers: model.shuffledAnswers))
        .toList();
    test(
        'should return a list of QuizEntity when the call to remote data source is successful',
        () async {
      when(mockQuizRemoteDatasource.fetchQuiz('Music', 'Easy', 1))
          .thenAnswer((_) async => quizModels);

      final result = await quizRepositoryImpl.getQuiz('Music', 'Easy', 1);
      expect(result, equals(Right<Failure, List<QuizEntity>>(quizEntities)));
    });

    test(
        'should return ServerFailure when the call to remote data source throws an exception',
        () async {
      when(mockQuizRemoteDatasource.fetchQuiz('Music', 'Easy', 1))
          .thenThrow(Exception());

      final result = await quizRepositoryImpl.getQuiz('Music', 'Easy', 1);
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
