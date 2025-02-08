import '/backend/schema/structs/index.dart';
import '/elements/question_card/question_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'quizz_page_widget.dart' show QuizzPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizzPageModel extends FlutterFlowModel<QuizzPageWidget> {
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
