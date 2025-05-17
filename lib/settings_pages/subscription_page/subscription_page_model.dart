import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  ///  Local state fields for this page.

  bool subInfoFetched = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - revenueCatCurrentUserSubscription] action in SubscriptionPage widget.
  UserCurrentSubscriptionStruct? currentSub;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? isPurchaseSuccessful;
  // State field(s) for SwitchYearly widget.
  bool? switchYearlyValue;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
