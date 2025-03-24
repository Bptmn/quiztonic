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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'history_quiz_page_model.dart';
export 'history_quiz_page_model.dart';

class HistoryQuizPageWidget extends StatefulWidget {
  const HistoryQuizPageWidget({
    super.key,
    required this.quizDocument,
  });

  final SavedQuizRecord? quizDocument;

  static String routeName = 'HistoryQuizPage';
  static String routePath = '/historyQuizPage';

  @override
  State<HistoryQuizPageWidget> createState() => _HistoryQuizPageWidgetState();
}

class _HistoryQuizPageWidgetState extends State<HistoryQuizPageWidget> {
  late HistoryQuizPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryQuizPageModel());

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
          backgroundColor: FlutterFlowTheme.of(context).transparent,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 80.0,
            icon: Icon(
              Icons.arrow_circle_left_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget!.quizDocument?.quizName,
              'quizName',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 24.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Performance Breakdown',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Correct Answers',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget!
                                            .quizDocument?.totalCorrectAnswers
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Incorrect Answers',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        (widget!.quizDocument!.totalQuestions -
                                                widget!.quizDocument!
                                                    .totalCorrectAnswers)
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Completion Time',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        functions.formatDuration(
                                            widget!.quizDocument!.timeDuration),
                                        '0:00',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget!.quizDocument?.flashcards != null &&
                                (widget!.quizDocument?.flashcards)!.isNotEmpty)
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    FlashcardsPageWidget.routeName,
                                    queryParameters: {
                                      'generatedFlashCards': serializeParam(
                                        widget!.quizDocument?.flashcards,
                                        ParamType.DataStruct,
                                        isList: true,
                                      ),
                                      'fromProcess': serializeParam(
                                        'history',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: 'See the flashcards',
                                icon: Icon(
                                  Icons.layers,
                                  size: 22.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  SourcePageWidget.routeName,
                                  queryParameters: {
                                    'sourceType': serializeParam(
                                      widget!.quizDocument?.sourceType,
                                      ParamType.String,
                                    ),
                                    'sourceContent': serializeParam(
                                      widget!.quizDocument?.sourceInput,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'See the source',
                              icon: Icon(
                                Icons.source_rounded,
                                size: 22.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                _model.reinitializedQuestionCards = widget!
                                    .quizDocument!.questionCards
                                    .toList()
                                    .cast<QuestionCardStruct>();
                                _model.loopIndex = 0;
                                await actions.printText(
                                  widget!.quizDocument!.questionCards.length
                                      .toString(),
                                );
                                while (_model.loopIndex! <
                                    widget!
                                        .quizDocument!.questionCards.length) {
                                  _model
                                      .updateReinitializedQuestionCardsAtIndex(
                                    _model.loopIndex!,
                                    (e) => e
                                      ..userSelectionIndex = null
                                      ..questionIsDone = false,
                                  );
                                  await actions.printText(
                                    _model.loopIndex!.toString(),
                                  );
                                  _model.loopIndex = _model.loopIndex! + 1;
                                }

                                context.goNamed(
                                  QuizPageWidget.routeName,
                                  queryParameters: {
                                    'generatedQuizz': serializeParam(
                                      GeneratedQuizzStruct(
                                        quizName:
                                            widget!.quizDocument?.quizName,
                                        questionCards:
                                            _model.reinitializedQuestionCards,
                                        flashcards:
                                            widget!.quizDocument?.flashcards,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'sourceType': serializeParam(
                                      widget!.quizDocument?.sourceType,
                                      ParamType.String,
                                    ),
                                    'sourceInput': serializeParam(
                                      widget!.quizDocument?.sourceInput,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Retake the quiz',
                              icon: Icon(
                                Icons.replay_rounded,
                                size: 22.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).accent1,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Your answers',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Manrope',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final questionCard =
                                widget!.quizDocument?.questionCards?.toList() ??
                                    [];

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(questionCard.length,
                                  (questionCardIndex) {
                                final questionCardItem =
                                    questionCard[questionCardIndex];
                                return wrapWithModel(
                                  model: _model.questionCardModels.getModel(
                                    questionCardIndex.toString(),
                                    questionCardIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: QuestionCardWidget(
                                    key: Key(
                                      'Keybax_${questionCardIndex.toString()}',
                                    ),
                                    questionCard: questionCardItem,
                                    updateScore:
                                        (isCorrect, userAnswerIndex) async {},
                                  ),
                                );
                              }).divide(SizedBox(height: 10.0)),
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
