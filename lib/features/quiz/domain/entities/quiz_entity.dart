class QuizEntity {
  final String id;
  final String category;
  final String correctAnswer;
  final String question;
  final String difficulty;
  final List<String> incorrectAnswers;

  QuizEntity(
      {required this.id,
      required this.category,
      required this.correctAnswer,
      required this.question,
      required this.difficulty,
      required this.incorrectAnswers});
}
