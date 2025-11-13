import 'package:flutter/material.dart';

/// Reusable error dialog helpers to avoid code duplication
class ErrorDialogs {
  /// Show a generic generation error dialog with custom message
  static Future<void> showGenerationError(
    BuildContext context,
    String message,
  ) async {
    return showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('An error occurred'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  /// Show a network error dialog
  static Future<void> showNetworkError(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Network Error'),
          content: const Text(
            'Unable to connect to the server. Please check your internet connection and try again.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  /// Show a timeout error dialog
  static Future<void> showTimeoutError(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Request Timeout'),
          content: const Text(
            'The request took too long to complete. Please check your internet connection and try again.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  /// Show a generic error dialog with custom title and message
  static Future<void> showCustomError(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    return showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

