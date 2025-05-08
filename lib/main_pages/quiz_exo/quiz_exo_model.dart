import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/question_card/question_card_widget.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'quiz_exo_widget.dart' show QuizExoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuizExoModel extends FlutterFlowModel<QuizExoWidget> {
  ///  Local state fields for this page.

  int? userScore = 0;

  int? pageNavigate = 0;

  GeneratedQuizzStruct? generatedQuizz;
  void updateGeneratedQuizzStruct(Function(GeneratedQuizzStruct) updateFn) {
    updateFn(generatedQuizz ??= GeneratedQuizzStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for QuestionCard dynamic component.
  late FlutterFlowDynamicModels<QuestionCardModel> questionCardModels;
  // Stores action output result for [Custom Action - generateFirestoreId] action in ButtonComplete widget.
  String? firestoreId;
  // Stores action output result for [Backend Call - Create Document] action in ButtonComplete widget.
  MyQuizRecord? quizRef;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonComplete widget.
  MyStatisticsRecord? userStatistics;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
    questionCardModels = FlutterFlowDynamicModels(() => QuestionCardModel());
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
    timerController.dispose();
    questionCardModels.dispose();
  }
}
