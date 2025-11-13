import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_tonic/config/api_config.dart';

void main() {
  group('ApiConfig', () {
    test('has valid API URL configured', () {
      expect(ApiConfig.apiUrl, isNotEmpty);
      expect(ApiConfig.apiUrl, startsWith('https://'));
    });

    test('has timeout configured to 60 seconds', () {
      expect(ApiConfig.timeout, const Duration(seconds: 60));
      expect(ApiConfig.timeout.inSeconds, 60);
    });

    test('has max retries configured to 3', () {
      expect(ApiConfig.maxRetries, 3);
    });

    test('has initial retry delay configured', () {
      expect(ApiConfig.initialRetryDelay, const Duration(seconds: 1));
      expect(ApiConfig.initialRetryDelay.inSeconds, 1);
    });

    test('has max retry delay configured', () {
      expect(ApiConfig.maxRetryDelay, const Duration(seconds: 8));
      expect(ApiConfig.maxRetryDelay.inSeconds, 8);
    });

    test('has retry max attempts alias', () {
      expect(ApiConfig.retryMaxAttempts, ApiConfig.maxRetries);
      expect(ApiConfig.retryMaxAttempts, 3);
    });

    test('has retry initial delay alias', () {
      expect(ApiConfig.retryInitialDelay, ApiConfig.initialRetryDelay);
      expect(ApiConfig.retryInitialDelay, const Duration(seconds: 1));
    });

    test('timeout is reasonable for mobile apps', () {
      expect(ApiConfig.timeout.inSeconds, greaterThan(30));
      expect(ApiConfig.timeout.inSeconds, lessThanOrEqualTo(120));
    });

    test('retry delay progression is reasonable', () {
      expect(
        ApiConfig.initialRetryDelay.inSeconds,
        lessThan(ApiConfig.maxRetryDelay.inSeconds),
      );
    });

    test('all constants are accessible', () {
      // Verify all constants can be read without errors
      final _ = [
        ApiConfig.apiUrl,
        ApiConfig.timeout,
        ApiConfig.maxRetries,
        ApiConfig.initialRetryDelay,
        ApiConfig.maxRetryDelay,
        ApiConfig.retryMaxAttempts,
        ApiConfig.retryInitialDelay,
      ];
      expect(_.length, 7);
    });
  });
}

