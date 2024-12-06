import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app_with_cubit/core/utils/app_url.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_data_source_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/models/quiz_model.dart';

import 'quiz_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late QuizRemoteDataSourceImpl quizRemoteDataSourceImpl;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    quizRemoteDataSourceImpl = QuizRemoteDataSourceImpl(dio: mockDio);
  });

  group('fetch quiz', () {
    const testCategory = 'Music';
    const testDifficulty = 'easy';
    const testNumberOfQuestions = 1;

    test(
        'should perform a GET request with correct URL and return a list of quizzes',
        () async {
      final mockResponse = [
        {
          "category": "music",
          "id": "622a1c397cc59eab6f950c44",
          "correctAnswer": "The Beach Boys",
          "incorrectAnswers": ["Swans", "The Velvet Underground", "Aerosmith"],
          "question": {
            "text":
                "Which American rock band released the song 'Good Vibrations'?"
          },
          "tags": ["music"],
          "type": "text_choice",
          "difficulty": "easy",
          "regions": [],
          "isNiche": false
        }
      ];
      when(mockDio.get(
              '${AppUrl.baseUrl}?categories=$testCategory&difficulties=$testDifficulty&limit=$testNumberOfQuestions'))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(
                  path:
                      '${AppUrl.baseUrl}?categories=$testCategory&difficulties=$testDifficulty&limit=$testNumberOfQuestions',
                ),
                statusCode: 200,
                data: mockResponse,
              ));

      final result = await quizRemoteDataSourceImpl.fetchQuiz(
          testCategory, testDifficulty, testNumberOfQuestions);

      expect(result, isA<List<QuizModel>>());
      expect(result.length, equals(1));
      expect(result.first.category, equals('music'));
    });

    test(
        'should throw an exception when the server responds with non-200 status code',
        () async {
      // Arrange
      when(mockDio.get(any)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: 'Error',
          statusCode: 500));

      // Act & Assert
      expect(
          () async => await quizRemoteDataSourceImpl.fetchQuiz(
              testCategory, testDifficulty, testNumberOfQuestions),
          throwsException);
    });
  });
}
