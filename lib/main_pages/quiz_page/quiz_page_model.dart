import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/question_card/question_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'quiz_page_widget.dart' show QuizPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuizPageModel extends FlutterFlowModel<QuizPageWidget> {
  ///  Local state fields for this page.

  int? userScore = 0;

  int? pageNavigate = 0;

  GeneratedQuizzStruct? generatedQuizz;
  void updateGeneratedQuizzStruct(Function(GeneratedQuizzStruct) updateFn) {
    updateFn(generatedQuizz ??= GeneratedQuizzStruct());
  }

  ///  State fields for stateful widgets in this page.

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

  @override
  void initState(BuildContext context) {
    questionCardModels = FlutterFlowDynamicModels(() => QuestionCardModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    questionCardModels.dispose();
  }
}
