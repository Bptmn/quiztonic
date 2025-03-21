import '';
import '/backend/schema/structs/index.dart';
import '/components/item_flashcard/item_flashcard_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'flashcards_page_widget.dart' show FlashcardsPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class FlashcardsPageModel extends FlutterFlowModel<FlashcardsPageWidget> {
  ///  Local state fields for this page.

  int? pageNavigate = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for itemFlashcard dynamic component.
  late FlutterFlowDynamicModels<ItemFlashcardModel> itemFlashcardModels;

  @override
  void initState(BuildContext context) {
    itemFlashcardModels = FlutterFlowDynamicModels(() => ItemFlashcardModel());
  }

  @override
  void dispose() {
    itemFlashcardModels.dispose();
  }
}
