import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_tonic/utils/error_messages.dart';

void main() {
  group('ErrorMessages', () {
    group('getApiErrorMessage', () {
      test('returns specific message for 400 Bad Request', () {
        final message = ErrorMessages.getApiErrorMessage(400, null);
        expect(message, contains('Invalid quiz parameters'));
        expect(message, contains('check your input'));
      });

      test('returns specific message for 401 Unauthorized', () {
        final message = ErrorMessages.getApiErrorMessage(401, null);
        expect(message, contains('Authentication required'));
        expect(message, contains('sign in again'));
      });

      test('returns specific message for 408 Request Timeout', () {
        final message = ErrorMessages.getApiErrorMessage(408, null);
        expect(message, contains('Request timed out'));
        expect(message, contains('internet connection'));
      });

      test('returns specific message for 422 Unprocessable Entity', () {
        final message = ErrorMessages.getApiErrorMessage(422, null);
        expect(message, contains('Unable to process'));
        expect(message, contains('too short or in an unsupported format'));
      });

      test('returns specific message for 429 Too Many Requests', () {
        final message = ErrorMessages.getApiErrorMessage(429, null);
        expect(message, contains('Too many requests'));
        expect(message, contains('wait a moment'));
      });

      test('returns specific message for 500 Internal Server Error', () {
        final message = ErrorMessages.getApiErrorMessage(500, null);
        expect(message, contains('Server error'));
        expect(message, contains('team has been notified'));
      });

      test('returns specific message for 503 Service Unavailable', () {
        final message = ErrorMessages.getApiErrorMessage(503, null);
        expect(message, contains('Service temporarily unavailable'));
      });

      test('returns network error message for -1', () {
        final message = ErrorMessages.getApiErrorMessage(-1, null);
        expect(message, contains('Network error'));
        expect(message, contains('internet connection'));
      });

      test('returns default message for unknown status codes', () {
        final message = ErrorMessages.getApiErrorMessage(418, null);
        expect(message, contains('Something went wrong'));
        expect(message, contains('support@quiztonic.app'));
      });

      test('all error messages are user-friendly', () {
        final codes = [400, 401, 408, 422, 429, 500, 503, -1, 999];
        for (final code in codes) {
          final message = ErrorMessages.getApiErrorMessage(code, null);
          expect(message.isNotEmpty, true);
          expect(message.length, greaterThan(20)); // Meaningful message
        }
      });
    });

    group('getQuizGenerationError', () {
      test('returns appropriate quiz generation error message', () {
        final message = ErrorMessages.getQuizGenerationError();
        expect(message, contains('Something went wrong'));
        expect(message, contains('generating your quiz'));
        expect(message, contains('support@quiztonic.app'));
      });
    });

    group('getNetworkError', () {
      test('returns network error message', () {
        final message = ErrorMessages.getNetworkError();
        expect(message, contains('Unable to connect'));
        expect(message, contains('internet connection'));
      });
    });

    group('getTimeoutError', () {
      test('returns timeout error message', () {
        final message = ErrorMessages.getTimeoutError();
        expect(message, contains('took too long'));
        expect(message, contains('internet connection'));
      });
    });

    group('getInvalidInputError', () {
      test('returns invalid input error with field name', () {
        final message = ErrorMessages.getInvalidInputError('email');
        expect(message, contains('Invalid email'));
      });
    });

    group('getFileSizeError', () {
      test('returns file size error with max size', () {
        final message = ErrorMessages.getFileSizeError('10MB');
        expect(message, contains('too large'));
        expect(message, contains('10MB'));
      });
    });
  });
}

