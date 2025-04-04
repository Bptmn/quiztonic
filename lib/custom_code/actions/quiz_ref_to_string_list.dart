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

Future<List<String>> quizRefToStringList(List<DocumentReference> docRef) async {
  // return the documentId value of each DocumentReference in parameter, as a list of string format. If the DocumentReferenceList in argument is empty, return an empty list of string
  if (docRef.isEmpty) {
    return [];
  }

  return docRef.map((ref) => ref.id).toList();
}
