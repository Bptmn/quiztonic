import '/backend/schema/structs/index.dart';
import '/components/question_card/question_card_widget.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'quiz_answers_page_widget.dart' show QuizAnswersPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizAnswersPageModel extends FlutterFlowModel<QuizAnswersPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;
  // Models for QuestionCard dynamic component.
  late FlutterFlowDynamicModels<QuestionCardModel> questionCardModels;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
    questionCardModels = FlutterFlowDynamicModels(() => QuestionCardModel());
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
    questionCardModels.dispose();
  }
}
