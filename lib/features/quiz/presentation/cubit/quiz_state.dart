part of 'quiz_cubit.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitialSuccessState extends QuizState {}

class CategorySelectedSuccessState extends QuizState {
  final String selectedCategory;

  const CategorySelectedSuccessState(this.selectedCategory);
}

class DifficultySelectedSuccessState extends QuizState {
  final String selectedCategory;
  final String selectedDifficulty;

  const DifficultySelectedSuccessState(
      this.selectedCategory, this.selectedDifficulty);
}

class QuizLoadingState extends QuizState {}

class QuizLoadingSuccessState extends QuizState {
  final List<QuizModel> quizes;

  const QuizLoadingSuccessState(this.quizes);
}

class QuizLoadingFailureState extends QuizState {
  final String message;

  const QuizLoadingFailureState(this.message);
}
