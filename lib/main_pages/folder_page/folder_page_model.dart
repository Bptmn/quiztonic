import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quiz_item/quiz_item_widget.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/dialogs/edit_folder/edit_folder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer_items/folder_item_shimmer/folder_item_shimmer_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'folder_page_widget.dart' show FolderPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FolderPageModel extends FlutterFlowModel<FolderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;
  // Models for QuizItem dynamic component.
  late FlutterFlowDynamicModels<QuizItemModel> quizItemModels;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
    quizItemModels = FlutterFlowDynamicModels(() => QuizItemModel());
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
    quizItemModels.dispose();
  }
}
