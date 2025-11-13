abstract class FFAppConstants {
  // Layout & UI
  static const int PageContentMaxWidth = 570;
  
  // User & Credits
  static const int InitialUserCredit = 15;
  
  // Animation durations (in milliseconds)
  static const int DefaultAnimationDuration = 300;
  static const int LoadingAnimationDuration = 1000;
  static const int FadeAnimationDuration = 200;
  static const int SlideAnimationDuration = 250;
  
  // Padding & Spacing
  static const double StandardPadding = 16.0;
  static const double LargePadding = 24.0;
  static const double MediumPadding = 12.0;
  static const double SmallPadding = 8.0;
  static const double TinyPadding = 4.0;
  
  // UI Dimensions
  static const double ButtonHeight = 50.0;
  static const double SmallButtonHeight = 40.0;
  static const double BorderRadius = 12.0;
  static const double SmallBorderRadius = 8.0;
  static const double LargeBorderRadius = 16.0;
  static const double IconSize = 24.0;
  static const double SmallIconSize = 16.0;
  static const double LargeIconSize = 32.0;
  
  // Quiz Configuration Limits
  static const int MaxQuestionsPerQuiz = 50;
  static const int MinQuestionsPerQuiz = 1;
  static const int DefaultQuestionsPerQuiz = 10;
  static const int MaxChoicesPerQuestion = 6;
  static const int MinChoicesPerQuestion = 2;
  static const int DefaultChoicesPerQuestion = 4;
  
  // File Upload Limits
  static const int MaxPdfSizeBytes = 10 * 1024 * 1024; // 10MB
  static const int MaxTextLength = 50000; // characters
  
  // API & Network
  static const int ApiTimeoutSeconds = 60;
  static const int MaxRetryAttempts = 3;
  static const int RetryDelaySeconds = 2;
}
