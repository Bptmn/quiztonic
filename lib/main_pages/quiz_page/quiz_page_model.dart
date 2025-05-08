import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/dialogs/pick_up_afolder/pick_up_afolder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer_items/folder_tag_shimmer/folder_tag_shimmer_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'quiz_page_widget.dart' show QuizPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizPageModel extends FlutterFlowModel<QuizPageWidget> {
  ///  Local state fields for this page.

  List<QuestionCardStruct> reinitializedQuestionCards = [];
  void addToReinitializedQuestionCards(QuestionCardStruct item) =>
      reinitializedQuestionCards.add(item);
  void removeFromReinitializedQuestionCards(QuestionCardStruct item) =>
      reinitializedQuestionCards.remove(item);
  void removeAtIndexFromReinitializedQuestionCards(int index) =>
      reinitializedQuestionCards.removeAt(index);
  void insertAtIndexInReinitializedQuestionCards(
          int index, QuestionCardStruct item) =>
      reinitializedQuestionCards.insert(index, item);
  void updateReinitializedQuestionCardsAtIndex(
          int index, Function(QuestionCardStruct) updateFn) =>
      reinitializedQuestionCards[index] =
          updateFn(reinitializedQuestionCards[index]);

  ///  State fields for stateful widgets in this page.

  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
  }
}
