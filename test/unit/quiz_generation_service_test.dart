import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_tonic/services/quiz_generation_service.dart';
import 'package:quiz_tonic/app_constants.dart';

void main() {
  group('QuizGenerationService', () {
    late QuizGenerationService service;

    setUp(() {
      service = QuizGenerationService();
    });

    group('validation', () {
      test('throws exception for invalid question count', () {
        expect(
          () => service.generateFromText(
            textContent: 'A' * 100,
            numQuestions: 0,
            numChoices: 4,
            generateFlashcards: false,
          ),
          throwsA(isA<QuizGenerationException>()),
        );
      });

      test('throws exception for invalid choice count', () {
        expect(
          () => service.generateFromText(
            textContent: 'A' * 100,
            numQuestions: 10,
            numChoices: 1,
            generateFlashcards: false,
          ),
          throwsA(isA<QuizGenerationException>()),
        );
      });

      test('throws exception for text that is too short', () {
        expect(
          () => service.generateFromText(
            textContent: 'Too short',
            numQuestions: 10,
            numChoices: 4,
            generateFlashcards: false,
          ),
          throwsA(isA<QuizGenerationException>()),
        );
      });

      test('throws exception for invalid URL format', () {
        expect(
          () => service.generateFromUrl(
            url: 'not a valid url',
            numQuestions: 10,
            numChoices: 4,
            generateFlashcards: false,
          ),
          throwsA(isA<QuizGenerationException>()),
        );
      });

      test('accepts valid inputs for text generation', () {
        // This test verifies validation passes (actual API call will fail in test env)
        final validText = 'A' * 100;
        
        expect(
          () => service.generateFromText(
            textContent: validText,
            numQuestions: FFAppConstants.MinQuestionsPerQuiz,
            numChoices: FFAppConstants.MinChoicesPerQuestion,
            generateFlashcards: false,
          ),
          // Will fail on API call, but validation should pass
          throwsA(isNot(predicate(
            (e) => e is QuizGenerationException && e.message.contains('Invalid'),
          ))),
        );
      });

      test('accepts valid inputs for URL generation', () {
        expect(
          () => service.generateFromUrl(
            url: 'https://example.com',
            numQuestions: 10,
            numChoices: 4,
            generateFlashcards: false,
          ),
          // Will fail on API call, but validation should pass
          throwsA(isNot(predicate(
            (e) => e is QuizGenerationException && e.message.contains('Invalid'),
          ))),
        );
      });
    });

    group('QuizGenerationException', () {
      test('has message', () {
        final exception = QuizGenerationException('Test error');
        expect(exception.message, 'Test error');
        expect(exception.toString(), contains('Test error'));
      });

      test('can include status code', () {
        final exception = QuizGenerationException(
          'API error',
          statusCode: 500,
        );
        expect(exception.statusCode, 500);
      });
    });
  });
}

