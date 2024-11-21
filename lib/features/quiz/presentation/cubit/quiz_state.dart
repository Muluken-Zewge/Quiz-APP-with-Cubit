part of 'quiz_cubit.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizLoadingSuccessState extends QuizState {
  final List<QuizModel> quizes;

  const QuizLoadingSuccessState(this.quizes);
}

class QuizLoadingFailureState extends QuizState {
  final String message;

  const QuizLoadingFailureState(this.message);
}
