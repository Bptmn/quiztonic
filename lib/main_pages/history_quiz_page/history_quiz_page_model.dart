import '';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/question_card/question_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'history_quiz_page_widget.dart' show HistoryQuizPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryQuizPageModel extends FlutterFlowModel<HistoryQuizPageWidget> {
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

  int? loopIndex;

  ///  State fields for stateful widgets in this page.

  // Models for QuestionCard dynamic component.
  late FlutterFlowDynamicModels<QuestionCardModel> questionCardModels;

  @override
  void initState(BuildContext context) {
    questionCardModels = FlutterFlowDynamicModels(() => QuestionCardModel());
  }

  @override
  void dispose() {
    questionCardModels.dispose();
  }
}
