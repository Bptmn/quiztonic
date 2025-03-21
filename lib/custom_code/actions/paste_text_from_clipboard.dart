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

import 'package:flutter/services.dart';

Future<String?> pasteTextFromClipboard() async {
  // Get the clipboard data
  final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);

  // Check if the clipboard data is not null and contains text
  if (clipboardData != null && clipboardData.text != null) {
    return clipboardData.text; // Return the text from the clipboard
  }

  return null; // Return null if there is no text in the clipboard
}
