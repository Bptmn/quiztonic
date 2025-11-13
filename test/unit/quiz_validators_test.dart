import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_tonic/utils/quiz_validators.dart';
import 'package:quiz_tonic/app_constants.dart';
import 'package:quiz_tonic/flutter_flow/uploaded_file.dart';

void main() {
  group('QuizValidators', () {
    group('validateQuestionCount', () {
      test('returns error when null', () {
        final result = QuizValidators.validateQuestionCount(null);
        expect(result, isNotNull);
        expect(result, contains('required'));
      });

      test('returns error when less than minimum', () {
        final result = QuizValidators.validateQuestionCount(0);
        expect(result, isNotNull);
        expect(result, contains('Minimum'));
      });

      test('returns null when at minimum', () {
        final result = QuizValidators.validateQuestionCount(
          FFAppConstants.MinQuestionsPerQuiz,
        );
        expect(result, isNull);
      });

      test('returns null when at maximum', () {
        final result = QuizValidators.validateQuestionCount(
          FFAppConstants.MaxQuestionsPerQuiz,
        );
        expect(result, isNull);
      });

      test('returns error when greater than maximum', () {
        final result = QuizValidators.validateQuestionCount(51);
        expect(result, isNotNull);
        expect(result, contains('Maximum'));
      });

      test('returns null for valid values', () {
        expect(QuizValidators.validateQuestionCount(5), isNull);
        expect(QuizValidators.validateQuestionCount(10), isNull);
        expect(QuizValidators.validateQuestionCount(25), isNull);
      });
    });

    group('validateChoiceCount', () {
      test('returns error when null', () {
        final result = QuizValidators.validateChoiceCount(null);
        expect(result, isNotNull);
        expect(result, contains('required'));
      });

      test('returns error when less than minimum', () {
        final result = QuizValidators.validateChoiceCount(1);
        expect(result, isNotNull);
        expect(result, contains('Minimum'));
      });

      test('returns null when at minimum', () {
        final result = QuizValidators.validateChoiceCount(
          FFAppConstants.MinChoicesPerQuestion,
        );
        expect(result, isNull);
      });

      test('returns null when at maximum', () {
        final result = QuizValidators.validateChoiceCount(
          FFAppConstants.MaxChoicesPerQuestion,
        );
        expect(result, isNull);
      });

      test('returns error when greater than maximum', () {
        final result = QuizValidators.validateChoiceCount(7);
        expect(result, isNotNull);
        expect(result, contains('Maximum'));
      });

      test('returns null for valid values', () {
        expect(QuizValidators.validateChoiceCount(2), isNull);
        expect(QuizValidators.validateChoiceCount(4), isNull);
        expect(QuizValidators.validateChoiceCount(6), isNull);
      });
    });

    group('validateUrl', () {
      test('returns null when null', () {
        expect(QuizValidators.validateUrl(null), isNull);
      });

      test('returns null when empty', () {
        expect(QuizValidators.validateUrl(''), isNull);
      });

      test('returns error for invalid URL format', () {
        expect(QuizValidators.validateUrl('not a url'), isNotNull);
        expect(QuizValidators.validateUrl('ftp://example.com'), isNotNull);
        expect(QuizValidators.validateUrl('just text'), isNotNull);
      });

      test('returns null for valid HTTP URLs', () {
        expect(QuizValidators.validateUrl('http://example.com'), isNull);
        expect(QuizValidators.validateUrl('http://www.example.com'), isNull);
        expect(
          QuizValidators.validateUrl('http://example.com/path/to/page'),
          isNull,
        );
      });

      test('returns null for valid HTTPS URLs', () {
        expect(QuizValidators.validateUrl('https://example.com'), isNull);
        expect(QuizValidators.validateUrl('https://www.example.com'), isNull);
        expect(
          QuizValidators.validateUrl('https://example.com/path?query=value'),
          isNull,
        );
      });
    });

    group('validateTextContent', () {
      test('returns null when null', () {
        expect(QuizValidators.validateTextContent(null), isNull);
      });

      test('returns null when empty', () {
        expect(QuizValidators.validateTextContent(''), isNull);
      });

      test('returns error when too short', () {
        final result = QuizValidators.validateTextContent('Short text');
        expect(result, isNotNull);
        expect(result, contains('too short'));
        expect(result, contains('50 characters'));
      });

      test('returns null for valid length text', () {
        final validText = 'A' * 100;
        expect(QuizValidators.validateTextContent(validText), isNull);
      });

      test('returns error when too long', () {
        final tooLongText = 'A' * (FFAppConstants.MaxTextLength + 1);
        final result = QuizValidators.validateTextContent(tooLongText);
        expect(result, isNotNull);
        expect(result, contains('too long'));
      });

      test('trims whitespace before validation', () {
        final textWithSpaces = '  ${'A' * 100}  ';
        expect(QuizValidators.validateTextContent(textWithSpaces), isNull);
      });
    });

    group('validatePdfFile', () {
      test('returns null when null', () {
        expect(QuizValidators.validatePdfFile(null), isNull);
      });

      test('returns error when file is too large', () {
        final largeFile = FFUploadedFile(
          name: 'large.pdf',
          bytes: List.filled(FFAppConstants.MaxPdfSizeBytes + 1, 0),
        );
        final result = QuizValidators.validatePdfFile(largeFile);
        expect(result, isNotNull);
        expect(result, contains('too large'));
        expect(result, contains('MB'));
      });

      test('returns error when file is not PDF', () {
        final nonPdfFile = FFUploadedFile(
          name: 'document.txt',
          bytes: [1, 2, 3],
        );
        final result = QuizValidators.validatePdfFile(nonPdfFile);
        expect(result, isNotNull);
        expect(result, contains('PDF'));
      });

      test('returns null for valid PDF file', () {
        final validPdf = FFUploadedFile(
          name: 'document.pdf',
          bytes: [1, 2, 3, 4, 5],
        );
        expect(QuizValidators.validatePdfFile(validPdf), isNull);
      });
    });

    group('validateContentSource', () {
      test('returns error when all sources are null', () {
        final result = QuizValidators.validateContentSource(
          textContent: null,
          url: null,
          pdfFile: null,
        );
        expect(result, isNotNull);
        expect(result, contains('provide content'));
      });

      test('returns error when all sources are empty', () {
        final result = QuizValidators.validateContentSource(
          textContent: '',
          url: '',
          pdfFile: null,
        );
        expect(result, isNotNull);
      });

      test('returns null when text is provided', () {
        final result = QuizValidators.validateContentSource(
          textContent: 'Some text content',
          url: null,
          pdfFile: null,
        );
        expect(result, isNull);
      });

      test('returns null when URL is provided', () {
        final result = QuizValidators.validateContentSource(
          textContent: null,
          url: 'https://example.com',
          pdfFile: null,
        );
        expect(result, isNull);
      });

      test('returns null when PDF is provided', () {
        final result = QuizValidators.validateContentSource(
          textContent: null,
          url: null,
          pdfFile: FFUploadedFile(name: 'doc.pdf', bytes: [1, 2, 3]),
        );
        expect(result, isNull);
      });
    });

    group('validateAllInputs', () {
      test('returns multiple errors for invalid inputs', () {
        final errors = QuizValidators.validateAllInputs(
          numQuestions: null,
          numChoices: null,
          textContent: null,
          url: null,
          pdfFile: null,
        );
        expect(errors['questions'], isNotNull);
        expect(errors['choices'], isNotNull);
        expect(errors['content'], isNotNull);
      });

      test('returns empty map for all valid inputs', () {
        final errors = QuizValidators.validateAllInputs(
          numQuestions: 10,
          numChoices: 4,
          textContent: 'A' * 100,
          url: null,
          pdfFile: null,
        );
        expect(errors.isEmpty, true);
      });

      test('validates specific content type when provided', () {
        final errors = QuizValidators.validateAllInputs(
          numQuestions: 10,
          numChoices: 4,
          textContent: 'Short',
          url: null,
          pdfFile: null,
        );
        expect(errors['text'], isNotNull);
        expect(errors['text'], contains('too short'));
      });
    });
  });
}

