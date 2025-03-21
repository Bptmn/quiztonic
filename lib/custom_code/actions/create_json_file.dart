// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:typed_data';

Future<FFUploadedFile> createJsonFile(
  String? textContent,
  int numQuestions,
  int numChoices,
  String? url,
  bool generateFlashcards,
) async {
  // Create JSON Map dynamically, excluding null or empty values
  final Map<String, dynamic> jsonData = {
    if (textContent != null && textContent.isNotEmpty)
      "text_content": textContent,
    "num_questions": numQuestions,
    "num_choices": numChoices,
    "generate_flashcards": generateFlashcards,
    if (url != null && url.isNotEmpty) "url": url,
  };

  // Convert JSON Map to String
  final String jsonString = jsonEncode(jsonData);

  // Convert String to Uint8List (binary format)
  final Uint8List uint8List = Uint8List.fromList(utf8.encode(jsonString));

  // Return as FFUploadedFile (FlutterFlow format)
  return FFUploadedFile(
    name: 'data.json',
    bytes: uint8List,
  );
}
