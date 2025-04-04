import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/dialogs/password_check/password_check_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_user_profile_widget.dart' show EditUserProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUserProfileModel extends FlutterFlowModel<EditUserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;
  // State field(s) for TextFieldUsername widget.
  FocusNode? textFieldUsernameFocusNode;
  TextEditingController? textFieldUsernameTextController;
  String? Function(BuildContext, String?)?
      textFieldUsernameTextControllerValidator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? isValidated;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
    textFieldUsernameFocusNode?.dispose();
    textFieldUsernameTextController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();
  }
}
