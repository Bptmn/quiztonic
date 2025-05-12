import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'loading_quiz_page_widget.dart' show LoadingQuizPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingQuizPageModel extends FlutterFlowModel<LoadingQuizPageWidget> {
  ///  Local state fields for this page.

  List<String> loadingTexts = [
    'Analyzing your content... 👁️',
    'Opening a portal to the quiz dimension... ✨',
    'Creating smart questions... 🧠',
    'Summoning the quiz gods... 🔱',
    'Adding some Tonic to the quiz... ⚡',
    'Getting your quiz ready... 🫡'
  ];
  void addToLoadingTexts(String item) => loadingTexts.add(item);
  void removeFromLoadingTexts(String item) => loadingTexts.remove(item);
  void removeAtIndexFromLoadingTexts(int index) => loadingTexts.removeAt(index);
  void insertAtIndexInLoadingTexts(int index, String item) =>
      loadingTexts.insert(index, item);
  void updateLoadingTextsAtIndex(int index, Function(String) updateFn) =>
      loadingTexts[index] = updateFn(loadingTexts[index]);

  int? loadingTextIndex = 0;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (AiContentGenerationApi)] action in LoadingQuizPage widget.
  ApiCallResponse? apiResultFromText;
  // Stores action output result for [Backend Call - API (AiContentGenerationApi)] action in LoadingQuizPage widget.
  ApiCallResponse? apiResultFromUrl;
  // Stores action output result for [Custom Action - pdfToBinary] action in LoadingQuizPage widget.
  String? pdfBinaryText;
  // Stores action output result for [Backend Call - API (AiContentGenerationApi)] action in LoadingQuizPage widget.
  ApiCallResponse? apiResultFromPdf;
  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    webSideBarModel.dispose();
  }
}
