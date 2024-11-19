part of 'quiz_cubit.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizLoadingSuccessState extends QuizState {}

class QuizLoadingFailureState extends QuizState {}
