/// API configuration constants
/// 
/// Centralizes API-related configuration to avoid hardcoded values
/// and enable environment-based configuration.
class ApiConfig {
  /// Base API URL for quiz generation
  /// 
  /// Can be overridden via environment variable:
  /// flutter run --dart-define=API_URL=http://localhost:5050
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue:
        'https://2mmjiwjyo27dfsa227qdc67jue0drajz.lambda-url.eu-west-1.on.aws/',
  );

  /// Timeout duration for API requests
  static const Duration timeout = Duration(seconds: 60);

  /// Maximum number of retry attempts for failed requests
  static const int maxRetries = 3;

  /// Initial delay before first retry
  static const Duration initialRetryDelay = Duration(seconds: 1);

  /// Maximum delay between retries
  static const Duration maxRetryDelay = Duration(seconds: 8);
}

