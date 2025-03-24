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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_page_model.dart';
export 'quiz_page_model.dart';

class QuizPageWidget extends StatefulWidget {
  const QuizPageWidget({
    super.key,
    this.generatedQuizz,
    required this.sourceType,
    this.sourceInput,
  });

  final GeneratedQuizzStruct? generatedQuizz;
  final String? sourceType;
  final String? sourceInput;

  static String routeName = 'QuizPage';
  static String routePath = '/quizPage';

  @override
  State<QuizPageWidget> createState() => _QuizPageWidgetState();
}

class _QuizPageWidgetState extends State<QuizPageWidget> {
  late QuizPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.generatedQuizz = GeneratedQuizzStruct(
        quizName: widget!.generatedQuizz?.quizName,
        questionCards: widget!.generatedQuizz?.questionCards,
      );
      safeSetState(() {});
      _model.timerController.onStartTimer();
    });

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
            buttonSize: 65.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 35.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).primary,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlutterFlowTimer(
                        initialTime: _model.timerInitialTimeMs,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        updateStateInterval: Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) safeSetState(() {});
                        },
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            LinearPercentIndicator(
                              percent: valueOrDefault<double>(
                                ((_model.pageNavigate!) + 1) /
                                    widget!
                                        .generatedQuizz!.questionCards.length,
                                0.0,
                              ),
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              lineHeight: 12.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              padding: EdgeInsets.zero,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final questionCard = widget!
                                            .generatedQuizz?.questionCards
                                            ?.toList() ??
                                        [];

                                    return Container(
                                      width: double.infinity,
                                      height: 500.0,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: PageView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          0,
                                                          questionCard.length -
                                                              1))),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: questionCard.length,
                                          itemBuilder:
                                              (context, questionCardIndex) {
                                            final questionCardItem =
                                                questionCard[questionCardIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model.questionCardModels
                                                    .getModel(
                                                  questionCardIndex.toString(),
                                                  questionCardIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                updateOnChange: true,
                                                child: QuestionCardWidget(
                                                  key: Key(
                                                    'Keyo6p_${questionCardIndex.toString()}',
                                                  ),
                                                  questionCard:
                                                      questionCardItem,
                                                  updateScore: (isCorrect,
                                                      userAnswerIndex) async {
                                                    _model.userScore =
                                                        _model.userScore! +
                                                            (isCorrect ? 1 : 0);
                                                    _model
                                                        .updateGeneratedQuizzStruct(
                                                      (e) => e
                                                        ..updateQuestionCards(
                                                          (e) => e[
                                                              questionCardIndex]
                                                            ..userSelectionIndex =
                                                                userAnswerIndex
                                                            ..questionIsDone =
                                                                true,
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      if (_model.pageNavigate! > 0)
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await _model.pageViewController
                                                  ?.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                              _model.pageNavigate =
                                                  _model.pageNavigate! + -1;
                                              safeSetState(() {});
                                            },
                                            text: 'Previous',
                                            icon: Icon(
                                              Icons.navigate_before,
                                              size: 30.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 20.0, 0.0),
                                              iconAlignment:
                                                  IconAlignment.start,
                                              iconPadding: EdgeInsets.all(0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                        ((_model.pageNavigate!) + 1)
                                                .toString() !=
                                            valueOrDefault<String>(
                                              widget!.generatedQuizz
                                                  ?.questionCards?.length
                                                  .toString(),
                                              '10',
                                            ),
                                        true,
                                      ))
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await _model.pageViewController
                                                    ?.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                                _model.pageNavigate =
                                                    _model.pageNavigate! + 1;
                                                safeSetState(() {});
                                              },
                                              text: 'Next',
                                              icon: Icon(
                                                Icons.navigate_next,
                                                size: 30.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 5.0, 0.0),
                                                iconAlignment:
                                                    IconAlignment.end,
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                        ((_model.pageNavigate!) + 1)
                                                .toString() ==
                                            valueOrDefault<String>(
                                              widget!.generatedQuizz
                                                  ?.questionCards?.length
                                                  .toString(),
                                              '10',
                                            ),
                                        true,
                                      ))
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.timerController
                                                  .onStopTimer();

                                              await SavedQuizRecord.collection
                                                  .doc()
                                                  .set({
                                                ...createSavedQuizRecordData(
                                                  quizName: widget!
                                                      .generatedQuizz?.quizName,
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  totalQuestions: widget!
                                                      .generatedQuizz
                                                      ?.questionCards
                                                      ?.length,
                                                  totalCorrectAnswers:
                                                      _model.userScore,
                                                  userRef: currentUserReference,
                                                  timeDuration:
                                                      _model.timerMilliseconds,
                                                  sourceType:
                                                      widget!.sourceType,
                                                  sourceInput:
                                                      widget!.sourceInput,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'questionCards':
                                                        getQuestionCardListFirestoreData(
                                                      _model.generatedQuizz
                                                          ?.questionCards,
                                                    ),
                                                    'flashcards':
                                                        getFlashcardListFirestoreData(
                                                      widget!.generatedQuizz
                                                          ?.flashcards,
                                                    ),
                                                  },
                                                ),
                                              });
                                              _model.userStatisticDocument =
                                                  await queryUserStatisticsRecordOnce(
                                                queryBuilder:
                                                    (userStatisticsRecord) =>
                                                        userStatisticsRecord
                                                            .where(
                                                  'userRef',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);

                                              await _model
                                                  .userStatisticDocument!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'nb_quiz_done':
                                                        FieldValue.increment(1),
                                                    'nb_questions_done':
                                                        FieldValue.increment(
                                                            widget!
                                                                .generatedQuizz!
                                                                .questionCards
                                                                .length),
                                                    'nb_correct_answers':
                                                        FieldValue.increment(
                                                            _model.userScore!),
                                                  },
                                                ),
                                              });

                                              context.goNamed(
                                                ScorePageWidget.routeName,
                                                queryParameters: {
                                                  'quizResult': serializeParam(
                                                    QuizResultStruct(
                                                      totalQuestions:
                                                          valueOrDefault<int>(
                                                        widget!
                                                            .generatedQuizz
                                                            ?.questionCards
                                                            ?.length,
                                                        10,
                                                      ),
                                                      correctAnswers:
                                                          _model.userScore,
                                                      completionTime: _model
                                                          .timerMilliseconds,
                                                    ),
                                                    ParamType.DataStruct,
                                                  ),
                                                  'flashcards': serializeParam(
                                                    widget!.generatedQuizz
                                                        ?.flashcards,
                                                    ParamType.DataStruct,
                                                    isList: true,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              safeSetState(() {});
                                            },
                                            text: 'Complete',
                                            options: FFButtonOptions(
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                    ]
                                        .divide(SizedBox(width: 10.0))
                                        .around(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 15.0)).around(SizedBox(height: 15.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
