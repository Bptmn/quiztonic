/// Centralized error messages with specific messages per HTTP status code
class ErrorMessages {
  /// Get appropriate error message based on API response status code
  static String getApiErrorMessage(int statusCode, dynamic body) {
    switch (statusCode) {
      case 400:
        return 'Invalid quiz parameters. Please check your input and try again.';
      case 401:
        return 'Authentication required. Please sign in again to continue.';
      case 408:
        return 'Request timed out. Please check your internet connection and try again.';
      case 422:
        return 'Unable to process the content. The text might be too short or in an unsupported format. Try a different source or add more content.';
      case 429:
        return 'Too many requests. Please wait a moment before trying again.';
      case 500:
        return 'Server error. Our team has been notified. Please try again in a few moments.';
      case 503:
        return 'Service temporarily unavailable. Please try again in a few moments.';
      case -1:
        return 'Network error. Please check your internet connection.';
      default:
        return 'Oops! Something went wrong while generating your quiz. You can try again in a few moments, change your input, or contact us if the problem persists: support@quiztonic.app';
    }
  }

  /// Get error message for quiz generation failures
  static String getQuizGenerationError() {
    return 'Oops! Something went wrong while generating your quiz. You can try again in a few moments, change your input, or contact us if the problem persists: support@quiztonic.app';
  }

  /// Get error message for network failures
  static String getNetworkError() {
    return 'Unable to connect to the server. Please check your internet connection and try again.';
  }

  /// Get error message for timeout
  static String getTimeoutError() {
    return 'The request took too long to complete. Please check your internet connection and try again.';
  }

  /// Get error message for invalid input
  static String getInvalidInputError(String field) {
    return 'Invalid $field. Please check your input and try again.';
  }

  /// Get error message for file size limit
  static String getFileSizeError(String maxSize) {
    return 'File is too large. Maximum file size is $maxSize.';
  }
}

