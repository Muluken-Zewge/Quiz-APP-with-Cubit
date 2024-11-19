import 'package:quiz_app_with_cubit/features/quiz/domain/entities/quiz_entity.dart';

class QuizModel extends QuizEntity {
  QuizModel(
      {required super.id,
      required super.category,
      required super.correctAnswer,
      required super.question,
      required super.difficulty,
      required super.incorrectAnswers});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'] as String,
      category: json['category'] as String,
      correctAnswer: json['correctAnswer'] as String,
      question: json['question']['text'] as String,
      difficulty: json['difficulty'] as String,
      incorrectAnswers: (json['incorrectAnswers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }

  factory QuizModel.fromEntity(QuizEntity quizEntity) {
    return QuizModel(
        id: quizEntity.id,
        category: quizEntity.category,
        correctAnswer: quizEntity.correctAnswer,
        question: quizEntity.question,
        difficulty: quizEntity.difficulty,
        incorrectAnswers: quizEntity.incorrectAnswers);
  }

  QuizEntity toQuizEntity() {
    return QuizEntity(
        id: id,
        category: category,
        correctAnswer: correctAnswer,
        question: question,
        difficulty: difficulty,
        incorrectAnswers: incorrectAnswers);
  }
}
