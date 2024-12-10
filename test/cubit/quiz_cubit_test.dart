import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_app_with_cubit/core/error/failure.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/models/quiz_model.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/entities/quiz_entity.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/usecases/get_quiz_usecase.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';

class MockGetQuizUsecase extends Mock implements GetQuizUsecase {}

void main() {
  late MockGetQuizUsecase mockGetQuizUsecase;
  late QuizCubit quizCubit;

  setUp(() {
    mockGetQuizUsecase = MockGetQuizUsecase();
    quizCubit = QuizCubit(mockGetQuizUsecase);
  });

  tearDown(() {
    quizCubit.close();
  });

  group('test entire QuizCubit', () {
    final List<QuizEntity> quizEntities = [
      const QuizEntity(
          id: 'id',
          category: 'category',
          correctAnswer: 'correctAnswer',
          question: 'question',
          difficulty: 'difficulty',
          shuffledAnswers: ['shuffledAnswers'])
    ];

    final failure = ServerFailure();

    blocTest(
        'when the app starts then QuizInitialSuccessState should be emitted',
        build: () => quizCubit,
        act: (cubit) => cubit.initialize(),
        expect: () => [QuizInitialSuccessState()]);

    blocTest(
        'when category is selected then CategorySelectedSuccessState should be emitted',
        build: () => quizCubit,
        act: (cubit) => cubit.selectedCatagory(''),
        expect: () => [const CategorySelectedSuccessState('')]);

    blocTest(
        'when dificulty is selected then DifficultySelectedSuccessState should be emitted',
        build: () => quizCubit,
        act: (cubit) => cubit.selectedDifficulty('', ''),
        expect: () => [const DifficultySelectedSuccessState('', '')]);

    blocTest(
        'when fetchQuizzes method is called then [QuizLoadingState, QuizLoadingSuccessState] should be emitted when successful',
        build: () {
          when(() => mockGetQuizUsecase.call(any(), any(), any()))
              .thenAnswer((_) async => Right(quizEntities));
          return QuizCubit(mockGetQuizUsecase);
        },
        act: (cubit) => cubit.fetchQuizzes('', '', 1),
        expect: () {
          final quizModels = quizEntities
              .map((entity) => QuizModel.fromEntity(entity))
              .toList();

          return [QuizLoadingState(), QuizLoadingSuccessState(quizModels)];
        });

    blocTest(
        'when fetchQuizzes method is called then [QuizLoadingState, QuizLoadingFailureState] should be emitted when unsuccessful',
        build: () {
          when(() => mockGetQuizUsecase.call(any(), any(), any()))
              .thenAnswer((_) async => Left(failure));
          return QuizCubit(mockGetQuizUsecase);
        },
        act: (cubit) => cubit.fetchQuizzes('', '', 1),
        expect: () => [
              QuizLoadingState(),
              const QuizLoadingFailureState('Error Occured')
            ]);
  });
}
