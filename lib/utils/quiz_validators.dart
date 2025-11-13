import '/app_constants.dart';
import '/flutter_flow/uploaded_file.dart';

/// Input validation utilities for quiz generation
class QuizValidators {
  /// Validate number of questions
  ///
  /// Returns null if valid, error message otherwise
  static String? validateQuestionCount(int? value) {
    if (value == null) {
      return 'Number of questions is required';
    }

    if (value < FFAppConstants.MinQuestionsPerQuiz) {
      return 'Minimum ${FFAppConstants.MinQuestionsPerQuiz} question${FFAppConstants.MinQuestionsPerQuiz > 1 ? 's' : ''}';
    }

    if (value > FFAppConstants.MaxQuestionsPerQuiz) {
      return 'Maximum ${FFAppConstants.MaxQuestionsPerQuiz} questions';
    }

    return null;
  }

  /// Validate number of choices per question
  ///
  /// Returns null if valid, error message otherwise
  static String? validateChoiceCount(int? value) {
    if (value == null) {
      return 'Number of choices is required';
    }

    if (value < FFAppConstants.MinChoicesPerQuestion) {
      return 'Minimum ${FFAppConstants.MinChoicesPerQuestion} choices';
    }

    if (value > FFAppConstants.MaxChoicesPerQuestion) {
      return 'Maximum ${FFAppConstants.MaxChoicesPerQuestion} choices';
    }

    return null;
  }

  /// Validate URL format
  ///
  /// Returns null if valid or empty, error message otherwise
  static String? validateUrl(String? url) {
    if (url == null || url.isEmpty) {
      return null; // URL is optional
    }

    // Basic URL pattern validation
    final urlPattern = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$',
      caseSensitive: false,
    );

    if (!urlPattern.hasMatch(url)) {
      return 'Please enter a valid URL (e.g., https://example.com)';
    }

    return null;
  }

  /// Validate text content
  ///
  /// Returns null if valid or empty, error message otherwise
  static String? validateTextContent(String? text) {
    if (text == null || text.isEmpty) {
      return null; // Text is optional (one of text/url/pdf is required)
    }

    final trimmedText = text.trim();

    if (trimmedText.length < 50) {
      return 'Text is too short. Please provide at least 50 characters.';
    }

    if (trimmedText.length > FFAppConstants.MaxTextLength) {
      return 'Text is too long. Maximum ${FFAppConstants.MaxTextLength} characters allowed.';
    }

    return null;
  }

  /// Validate PDF file
  ///
  /// Returns null if valid or null, error message otherwise
  static String? validatePdfFile(FFUploadedFile? file) {
    if (file == null) {
      return null; // PDF is optional (one of text/url/pdf is required)
    }

    // Check file size
    if (file.bytes != null &&
        file.bytes!.length > FFAppConstants.MaxPdfSizeBytes) {
      final maxSizeMB = FFAppConstants.MaxPdfSizeBytes / (1024 * 1024);
      return 'PDF file is too large. Maximum size is ${maxSizeMB.toStringAsFixed(0)}MB.';
    }

    // Check file extension
    if (file.name != null && !file.name!.toLowerCase().endsWith('.pdf')) {
      return 'Only PDF files are supported.';
    }

    return null;
  }

  /// Validate that at least one content source is provided
  ///
  /// Returns null if valid, error message otherwise
  static String? validateContentSource({
    String? textContent,
    String? url,
    FFUploadedFile? pdfFile,
  }) {
    final hasText = textContent != null && textContent.trim().isNotEmpty;
    final hasUrl = url != null && url.trim().isNotEmpty;
    final hasPdf = pdfFile != null && pdfFile.bytes != null;

    if (!hasText && !hasUrl && !hasPdf) {
      return 'Please provide content: paste text, enter a URL, or upload a PDF.';
    }

    return null;
  }

  /// Validate all quiz generation inputs at once
  ///
  /// Returns a map of field names to error messages
  /// Empty map means all validations passed
  static Map<String, String> validateAllInputs({
    required int? numQuestions,
    required int? numChoices,
    String? textContent,
    String? url,
    FFUploadedFile? pdfFile,
  }) {
    final errors = <String, String>{};

    // Validate question count
    final questionError = validateQuestionCount(numQuestions);
    if (questionError != null) {
      errors['questions'] = questionError;
    }

    // Validate choice count
    final choiceError = validateChoiceCount(numChoices);
    if (choiceError != null) {
      errors['choices'] = choiceError;
    }

    // Validate content source
    final contentError = validateContentSource(
      textContent: textContent,
      url: url,
      pdfFile: pdfFile,
    );
    if (contentError != null) {
      errors['content'] = contentError;
    }

    // Validate specific content types
    if (textContent != null && textContent.isNotEmpty) {
      final textError = validateTextContent(textContent);
      if (textError != null) {
        errors['text'] = textError;
      }
    }

    if (url != null && url.isNotEmpty) {
      final urlError = validateUrl(url);
      if (urlError != null) {
        errors['url'] = urlError;
      }
    }

    if (pdfFile != null) {
      final pdfError = validatePdfFile(pdfFile);
      if (pdfError != null) {
        errors['pdf'] = pdfError;
      }
    }

    return errors;
  }
}

