import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/dialogs/reset_password/reset_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode;
  TextEditingController? emailAddressFieldTextController;
  String? Function(BuildContext, String?)?
      emailAddressFieldTextControllerValidator;
  String? _emailAddressFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1qm480oz' /* Email is required. */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  String? _passwordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eth026dm' /* Password is required. */,
      );
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in SignInWithGoogleButton widget.
  MyStatisticsRecord? userStatDocSignInGoogle;
  // Stores action output result for [Firestore Query - Query a collection] action in SignInWithAppleButton widget.
  MyStatisticsRecord? userStatDocSignInApple;

  @override
  void initState(BuildContext context) {
    emailAddressFieldTextControllerValidator =
        _emailAddressFieldTextControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFieldFocusNode?.dispose();
    emailAddressFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();
  }
}
