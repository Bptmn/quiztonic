import 'dart:async';
import 'dart:math';

/// Helper class for retrying failed operations with exponential backoff
class RetryHelper {
  /// Retry an operation with exponential backoff
  ///
  /// [operation] - The async operation to retry
  /// [maxAttempts] - Maximum number of retry attempts (default: 3)
  /// [initialDelay] - Initial delay before first retry (default: 1 second)
  /// [maxDelay] - Maximum delay between retries (default: 8 seconds)
  /// [shouldRetry] - Optional function to determine if error should trigger retry
  ///
  /// Returns the result of the operation if successful
  /// Throws the last error if all retry attempts fail
  static Future<T> retryWithBackoff<T>(
    Future<T> Function() operation, {
    int maxAttempts = 3,
    Duration initialDelay = const Duration(seconds: 1),
    Duration maxDelay = const Duration(seconds: 8),
    bool Function(Object error)? shouldRetry,
  }) async {
    int attempt = 0;
    Object? lastError;

    while (attempt < maxAttempts) {
      try {
        return await operation();
      } catch (e) {
        lastError = e;
        attempt++;

        // Check if we should retry this error
        if (shouldRetry != null && !shouldRetry(e)) {
          rethrow;
        }

        // If this was the last attempt, rethrow the error
        if (attempt >= maxAttempts) {
          rethrow;
        }

        // Calculate delay with exponential backoff
        final exponentialDelay = initialDelay * pow(2, attempt - 1);
        final actualDelay = exponentialDelay > maxDelay ? maxDelay : exponentialDelay;

        // Wait before retrying
        await Future.delayed(actualDelay);
      }
    }

    // This should never be reached, but for type safety
    throw lastError ?? Exception('Retry failed with no error recorded');
  }

  /// Determine if an error should trigger a retry
  ///
  /// Returns true for network errors and server errors (5xx)
  /// Returns false for client errors (4xx) that should not be retried
  static bool shouldRetryError(Object error) {
    final errorString = error.toString().toLowerCase();

    // Network-related errors that should be retried
    if (errorString.contains('socket') ||
        errorString.contains('network') ||
        errorString.contains('connection') ||
        errorString.contains('timeout') ||
        errorString.contains('timed out')) {
      return true;
    }

    // Check for HTTP status codes
    // Retry on 5xx server errors
    if (errorString.contains('500') ||
        errorString.contains('502') ||
        errorString.contains('503') ||
        errorString.contains('504')) {
      return true;
    }

    // Retry on 408 Request Timeout
    if (errorString.contains('408')) {
      return true;
    }

    // Retry on 429 Too Many Requests (rate limiting)
    if (errorString.contains('429')) {
      return true;
    }

    // Don't retry on 4xx client errors (except 408 and 429)
    if (errorString.contains('400') ||
        errorString.contains('401') ||
        errorString.contains('403') ||
        errorString.contains('404') ||
        errorString.contains('422')) {
      return false;
    }

    // By default, retry other errors
    return true;
  }
}

