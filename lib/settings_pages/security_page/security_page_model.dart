import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/dialogs/password_check/password_check_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'security_page_widget.dart' show SecurityPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecurityPageModel extends FlutterFlowModel<SecurityPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;
  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  String? _newPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jef7d0xy' /* Enter a new password is requir... */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '2mrq3tg0' /* 6 characters minimum */,
      );
    }

    return null;
  }

  // State field(s) for ConfirmNewPassword widget.
  FocusNode? confirmNewPasswordFocusNode;
  TextEditingController? confirmNewPasswordTextController;
  late bool confirmNewPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmNewPasswordTextControllerValidator;
  String? _confirmNewPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wwgry3wl' /* Confirm new password is requir... */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'z0bo131o' /* 6 characters minimum */,
      );
    }

    return null;
  }

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? isPasswordValidated;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? isValidated;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
    newPasswordVisibility = false;
    newPasswordTextControllerValidator = _newPasswordTextControllerValidator;
    confirmNewPasswordVisibility = false;
    confirmNewPasswordTextControllerValidator =
        _confirmNewPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmNewPasswordFocusNode?.dispose();
    confirmNewPasswordTextController?.dispose();
  }
}
