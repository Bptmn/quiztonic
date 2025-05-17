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

Future<UserCurrentSubscriptionStruct>
    revenueCatCurrentUserSubscription() async {
  try {
    final CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    if (customerInfo.entitlements.all.isNotEmpty) {
      final entitlement = customerInfo.entitlements.active.values.first;

      final productId = entitlement.productIdentifier;
      final originalPurchaseDateStr = entitlement.originalPurchaseDate;
      final expirationDateStr = entitlement.expirationDate;
      final store = entitlement.store;

      if (productId != null &&
          originalPurchaseDateStr != null &&
          expirationDateStr != null &&
          store != null) {
        final purchaseDate = DateTime.tryParse(originalPurchaseDateStr);
        final renewalDate = DateTime.tryParse(expirationDateStr);

        if (purchaseDate == null || renewalDate == null) {
          throw Exception("Failed to parse dates.");
        }

        return UserCurrentSubscriptionStruct(
          productId: productId,
          purchaseDate: purchaseDate,
          renewalDate: renewalDate,
          store: store.name.toUpperCase(), // e.g., "APP_STORE"
        );
      } else {
        throw Exception("Missing subscription data fields.");
      }
    } else {
      throw Exception("No active subscription found.");
    }
  } catch (e) {
    print("Error fetching RevenueCat subscription: $e");
    return UserCurrentSubscriptionStruct(
      productId: "",
      purchaseDate: null,
      renewalDate: null,
      store: "",
    );
  }
}
