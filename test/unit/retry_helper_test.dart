import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_tonic/utils/retry_helper.dart';

void main() {
  group('RetryHelper', () {
    group('retryWithBackoff', () {
      test('succeeds on first attempt without retry', () async {
        int attempts = 0;
        final result = await RetryHelper.retryWithBackoff(
          () async {
            attempts++;
            return 'Success';
          },
          maxAttempts: 3,
        );

        expect(result, 'Success');
        expect(attempts, 1);
      });

      test('retries on failure and eventually succeeds', () async {
        int attempts = 0;
        final result = await RetryHelper.retryWithBackoff(
          () async {
            attempts++;
            if (attempts < 3) {
              throw Exception('Network error');
            }
            return 'Success after retries';
          },
          maxAttempts: 3,
          initialDelay: const Duration(milliseconds: 10),
        );

        expect(result, 'Success after retries');
        expect(attempts, 3);
      });

      test('respects max attempts limit', () async {
        int attempts = 0;
        expect(
          () => RetryHelper.retryWithBackoff(
            () async {
              attempts++;
              throw Exception('Always fails');
            },
            maxAttempts: 3,
            initialDelay: const Duration(milliseconds: 10),
          ),
          throwsException,
        );

        await Future.delayed(const Duration(milliseconds: 100));
        expect(attempts, 3);
      });

      test('does not retry when shouldRetry returns false', () async {
        int attempts = 0;
        expect(
          () => RetryHelper.retryWithBackoff(
            () async {
              attempts++;
              throw Exception('400 Bad Request');
            },
            maxAttempts: 3,
            shouldRetry: (error) => false,
            initialDelay: const Duration(milliseconds: 10),
          ),
          throwsException,
        );

        await Future.delayed(const Duration(milliseconds: 50));
        expect(attempts, 1); // Should not retry
      });

      test('applies exponential backoff delays', () async {
        final delayRecords = <Duration>[];
        int attempts = 0;
        DateTime? lastAttemptTime;

        try {
          await RetryHelper.retryWithBackoff(
            () async {
              final now = DateTime.now();
              if (lastAttemptTime != null) {
                delayRecords.add(now.difference(lastAttemptTime!));
              }
              lastAttemptTime = now;
              attempts++;
              throw Exception('Network error');
            },
            maxAttempts: 3,
            initialDelay: const Duration(milliseconds: 100),
          );
        } catch (_) {}

        expect(attempts, 3);
        expect(delayRecords.length, 2); // 2 delays between 3 attempts
        
        // First delay should be ~100ms
        expect(
          delayRecords[0].inMilliseconds,
          greaterThanOrEqualTo(90),
        );
        
        // Second delay should be ~200ms (exponential)
        expect(
          delayRecords[1].inMilliseconds,
          greaterThanOrEqualTo(180),
        );
      });

      test('respects max delay limit', () async {
        int attempts = 0;
        try {
          await RetryHelper.retryWithBackoff(
            () async {
              attempts++;
              throw Exception('Error');
            },
            maxAttempts: 5,
            initialDelay: const Duration(seconds: 2),
            maxDelay: const Duration(seconds: 3),
          );
        } catch (_) {}

        expect(attempts, 5);
      });
    });

    group('shouldRetryError', () {
      test('returns true for network errors', () {
        expect(
          RetryHelper.shouldRetryError(Exception('Socket exception')),
          true,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('Network error')),
          true,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('Connection failed')),
          true,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('Timeout occurred')),
          true,
        );
      });

      test('returns true for 5xx server errors', () {
        expect(
          RetryHelper.shouldRetryError(Exception('500 Internal Server Error')),
          true,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('502 Bad Gateway')),
          true,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('503 Service Unavailable')),
          true,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('504 Gateway Timeout')),
          true,
        );
      });

      test('returns true for 408 Request Timeout', () {
        expect(
          RetryHelper.shouldRetryError(Exception('408 Request Timeout')),
          true,
        );
      });

      test('returns true for 429 Too Many Requests', () {
        expect(
          RetryHelper.shouldRetryError(Exception('429 Too Many Requests')),
          true,
        );
      });

      test('returns false for 4xx client errors', () {
        expect(
          RetryHelper.shouldRetryError(Exception('400 Bad Request')),
          false,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('401 Unauthorized')),
          false,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('403 Forbidden')),
          false,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('404 Not Found')),
          false,
        );
        expect(
          RetryHelper.shouldRetryError(Exception('422 Unprocessable Entity')),
          false,
        );
      });

      test('returns true for unknown errors by default', () {
        expect(
          RetryHelper.shouldRetryError(Exception('Unknown error')),
          true,
        );
      });
    });
  });
}

