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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
//
import 'package:purchases_flutter/purchases_flutter.dart';

Future<bool> revenueCatlogIn(String userId) async {
  try {
    // Log the user into RevenueCat
    final LogInResult logInResult = await Purchases.logIn(userId);

    // Retrieve the active entitlements
    final activeEntitlements = logInResult.customerInfo.entitlements.active;

    // Check if the user has "premium_features" entitlement
    final hasPremiumFeatures =
        activeEntitlements.containsKey("premium_features");

    // Log the result
    if (hasPremiumFeatures) {
      print("User has premium features.");
    } else {
      print("User does not have premium features.");
    }

    // Return whether the user has "premium_features"
    return hasPremiumFeatures;
  } catch (e) {
    print("Error logging into RevenueCat: $e");

    // Return false in case of an error
    return false;
  }
}
