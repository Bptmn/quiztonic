import 'package:flutter/foundation.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/utils/quiz_validators.dart';

/// Service layer for quiz generation
///
/// Encapsulates all quiz generation logic including API calls,
/// validation, retry logic, and error handling.
class QuizGenerationService {
  /// Generate quiz from text content
  ///
  /// Throws [QuizGenerationException] if generation fails
  Future<GeneratedQuizzStruct> generateFromText({
    required String textContent,
    required int numQuestions,
    required int numChoices,
    required bool generateFlashcards,
  }) async {
    // Validate inputs
    _validateInputs(
      numQuestions: numQuestions,
      numChoices: numChoices,
      textContent: textContent,
    );

    if (kDebugMode) {
      print('QuizGenerationService: Generating quiz from text (${textContent.length} chars)');
    }

    return _makeApiCall(
      textContent: textContent,
      numQuestions: numQuestions,
      numChoices: numChoices,
      generateFlashcards: generateFlashcards,
    );
  }

  /// Generate quiz from URL
  ///
  /// Throws [QuizGenerationException] if generation fails
  Future<GeneratedQuizzStruct> generateFromUrl({
    required String url,
    required int numQuestions,
    required int numChoices,
    required bool generateFlashcards,
  }) async {
    // Validate inputs
    _validateInputs(
      numQuestions: numQuestions,
      numChoices: numChoices,
      url: url,
    );

    if (kDebugMode) {
      print('QuizGenerationService: Generating quiz from URL: $url');
    }

    return _makeApiCall(
      url: url,
      numQuestions: numQuestions,
      numChoices: numChoices,
      generateFlashcards: generateFlashcards,
    );
  }

  /// Generate quiz from PDF file
  ///
  /// Throws [QuizGenerationException] if generation fails
  Future<GeneratedQuizzStruct> generateFromPdf({
    required String pdfBinary,
    required int numQuestions,
    required int numChoices,
    required bool generateFlashcards,
  }) async {
    // Validate inputs
    _validateInputs(
      numQuestions: numQuestions,
      numChoices: numChoices,
    );

    if (kDebugMode) {
      print('QuizGenerationService: Generating quiz from PDF (${pdfBinary.length} chars)');
    }

    return _makeApiCall(
      pdfBinary: pdfBinary,
      numQuestions: numQuestions,
      numChoices: numChoices,
      generateFlashcards: generateFlashcards,
    );
  }

  /// Validate common inputs before API call
  void _validateInputs({
    required int numQuestions,
    required int numChoices,
    String? textContent,
    String? url,
  }) {
    final questionError = QuizValidators.validateQuestionCount(numQuestions);
    if (questionError != null) {
      throw QuizGenerationException('Invalid question count: $questionError');
    }

    final choiceError = QuizValidators.validateChoiceCount(numChoices);
    if (choiceError != null) {
      throw QuizGenerationException('Invalid choice count: $choiceError');
    }

    if (textContent != null && textContent.isNotEmpty) {
      final textError = QuizValidators.validateTextContent(textContent);
      if (textError != null) {
        throw QuizGenerationException('Invalid text content: $textError');
      }
    }

    if (url != null && url.isNotEmpty) {
      final urlError = QuizValidators.validateUrl(url);
      if (urlError != null) {
        throw QuizGenerationException('Invalid URL: $urlError');
      }
    }
  }

  /// Make API call with retry logic and error handling
  Future<GeneratedQuizzStruct> _makeApiCall({
    String? textContent,
    String? url,
    String? pdfBinary,
    required int numQuestions,
    required int numChoices,
    required bool generateFlashcards,
  }) async {
    try {
      final response = await AiContentGenerationApiCall.call(
        textContent: textContent ?? '',
        url: url ?? '',
        pdfBinary: pdfBinary ?? '',
        numOfQuestions: numQuestions,
        numOfChoices: numChoices,
        generateFlashcard: generateFlashcards,
      );

      if (!response.succeeded) {
        if (kDebugMode) {
          print('QuizGenerationService: API call failed with status ${response.statusCode}');
        }
        throw QuizGenerationException(
          'API call failed with status ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }

      final quiz = GeneratedQuizzStruct.maybeFromMap(response.jsonBody);
      if (quiz == null) {
        throw QuizGenerationException('Failed to parse quiz response');
      }

      if (kDebugMode) {
        print('QuizGenerationService: Quiz generated successfully');
      }

      return quiz;
    } catch (e) {
      if (e is QuizGenerationException) {
        rethrow;
      }
      throw QuizGenerationException('Quiz generation failed: $e');
    }
  }
}

/// Exception thrown when quiz generation fails
class QuizGenerationException implements Exception {
  final String message;
  final int? statusCode;

  QuizGenerationException(this.message, {this.statusCode});

  @override
  String toString() => 'QuizGenerationException: $message';
}

