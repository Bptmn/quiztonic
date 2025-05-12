import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'feedback_page_widget.dart' show FeedbackPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedbackPageModel extends FlutterFlowModel<FeedbackPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;
  // State field(s) for TextFieldUsername widget.
  FocusNode? textFieldUsernameFocusNode1;
  TextEditingController? textFieldUsernameTextController1;
  String? Function(BuildContext, String?)?
      textFieldUsernameTextController1Validator;
  // State field(s) for TextFieldUsername widget.
  FocusNode? textFieldUsernameFocusNode2;
  TextEditingController? textFieldUsernameTextController2;
  String? Function(BuildContext, String?)?
      textFieldUsernameTextController2Validator;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
    textFieldUsernameFocusNode1?.dispose();
    textFieldUsernameTextController1?.dispose();

    textFieldUsernameFocusNode2?.dispose();
    textFieldUsernameTextController2?.dispose();
  }
}
