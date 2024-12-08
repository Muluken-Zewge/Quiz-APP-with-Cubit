import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
  final String id;
  final String category;
  final String correctAnswer;
  final String question;
  final String difficulty;
  final List<String> shuffledAnswers;

  const QuizEntity(
      {required this.id,
      required this.category,
      required this.correctAnswer,
      required this.question,
      required this.difficulty,
      required this.shuffledAnswers});

  @override
  List<Object?> get props =>
      [id, category, correctAnswer, question, difficulty, shuffledAnswers];
}
