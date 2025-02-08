import '/backend/schema/structs/index.dart';
import '/elements/question_card/question_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quizz_page_model.dart';
export 'quizz_page_model.dart';

class QuizzPageWidget extends StatefulWidget {
  const QuizzPageWidget({
    super.key,
    this.generatedQuizz,
  });

  final GeneratedQuizzStruct? generatedQuizz;

  @override
  State<QuizzPageWidget> createState() => _QuizzPageWidgetState();
}

class _QuizzPageWidgetState extends State<QuizzPageWidget> {
  late QuizzPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizzPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Quiz',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Builder(
                  builder: (context) {
                    final questionCards =
                        widget!.generatedQuizz?.questionCards?.toList() ?? [];

                    return ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: questionCards.length,
                      separatorBuilder: (_, __) => SizedBox(height: 15.0),
                      itemBuilder: (context, questionCardsIndex) {
                        final questionCardsItem =
                            questionCards[questionCardsIndex];
                        return wrapWithModel(
                          model: _model.questionCardModels.getModel(
                            questionCardsIndex.toString(),
                            questionCardsIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: QuestionCardWidget(
                            key: Key(
                              'Key1vu_${questionCardsIndex.toString()}',
                            ),
                            questionCard: QuestionCardStruct(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
