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
          category: 'category',
          correctAnswer: 'correctAnswer',
          question: 'question',
          difficulty: 'difficulty',
          shuffledAnswers: ['shuffledAnswers'])
    ];
    test(
        'should return a list of QuizEntity when the call to remote data source is successful',
        () async {
      when(mockQuizRemoteDatasource.fetchQuiz('category', 'difficulty', 1))
          .thenAnswer((_) async => quizModels);

      final quizEntities = quizModels
          .map((model) => QuizEntity(
              id: model.id,
              category: model.category,
              correctAnswer: model.correctAnswer,
              question: model.question,
              difficulty: model.difficulty,
              shuffledAnswers: model.shuffledAnswers))
          .toList();

      final result =
          await quizRepositoryImpl.getQuiz('category', 'difficulty', 1);
      expect(result, equals(Right<Failure, List<QuizEntity>>(quizEntities)));
    });
  });
}
