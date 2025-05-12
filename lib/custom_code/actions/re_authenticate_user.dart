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

//
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> reAuthenticateUser(
  String username,
  String password,
) async {
  // re-authenticate the user to firebase auth with the reauthenticateWithCredential flutter method
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Create a credential using the provided username and password
    AuthCredential credential = EmailAuthProvider.credential(
      email: username,
      password: password,
    );

    // Re-authenticate the user
    await user?.reauthenticateWithCredential(credential);
    return true; // Re-authentication successful
  } catch (e) {
    print("Re-authentication failed: $e");
    return false; // Re-authentication failed
  }
}
