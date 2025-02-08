import '/backend/schema/structs/index.dart';
import '/elements/answer_item/answer_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'question_card_widget.dart' show QuestionCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionCardModel extends FlutterFlowModel<QuestionCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for AnswerItem dynamic component.
  late FlutterFlowDynamicModels<AnswerItemModel> answerItemModels;

  @override
  void initState(BuildContext context) {
    answerItemModels = FlutterFlowDynamicModels(() => AnswerItemModel());
  }

  @override
  void dispose() {
    answerItemModels.dispose();
  }
}
