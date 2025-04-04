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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_exo_model.dart';
export 'quiz_exo_model.dart';

class QuizExoWidget extends StatefulWidget {
  const QuizExoWidget({
    super.key,
    this.generatedQuizz,
    required this.sourceType,
    this.sourceInput,
  });

  final GeneratedQuizzStruct? generatedQuizz;
  final String? sourceType;
  final String? sourceInput;

  static String routeName = 'QuizExo';
  static String routePath = '/quizPage';

  @override
  State<QuizExoWidget> createState() => _QuizExoWidgetState();
}

class _QuizExoWidgetState extends State<QuizExoWidget> {
  late QuizExoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizExoModel());

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
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
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
                    context.goNamed(HomePageWidget.routeName);
                  },
                ),
                title: Text(
                  valueOrDefault<String>(
                    widget!.generatedQuizz?.quizName,
                    'quizName',
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.webSideBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: WebSideBarWidget(),
                ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: FFAppConstants.PageContentMaxWidth.toDouble(),
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Text(
                            valueOrDefault<String>(
                              widget!.generatedQuizz?.quizName,
                              'quizName',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
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
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    1.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: LinearPercentIndicator(
                                        percent: valueOrDefault<double>(
                                          ((_model.pageNavigate!) + 1) /
                                              widget!.generatedQuizz!
                                                  .questionCards.length,
                                          0.0,
                                        ),
                                        lineHeight: 12.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .tonicColor1,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .greyBackground,
                                        barRadius: Radius.circular(20.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final questionCard = widget!
                                                    .generatedQuizz
                                                    ?.questionCards
                                                    ?.toList() ??
                                                [];

                                            return Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
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
                                                                  questionCard
                                                                          .length -
                                                                      1))),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      questionCard.length,
                                                  itemBuilder: (context,
                                                      questionCardIndex) {
                                                    final questionCardItem =
                                                        questionCard[
                                                            questionCardIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .questionCardModels
                                                            .getModel(
                                                          questionCardIndex
                                                              .toString(),
                                                          questionCardIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            QuestionCardWidget(
                                                          key: Key(
                                                            'Keyo6p_${questionCardIndex.toString()}',
                                                          ),
                                                          questionCard:
                                                              questionCardItem,
                                                          updateScore: (isCorrect,
                                                              userAnswerIndex) async {
                                                            _model.userScore =
                                                                _model.userScore! +
                                                                    (isCorrect
                                                                        ? 1
                                                                        : 0);
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
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              if (_model.pageNavigate! > 0)
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await _model
                                                          .pageViewController
                                                          ?.previousPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                      _model.pageNavigate =
                                                          _model.pageNavigate! +
                                                              -1;
                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'pw3tkdme' /* Previous */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.navigate_before,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 45.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 1.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                  ),
                                                ),
                                              if (valueOrDefault<bool>(
                                                ((_model.pageNavigate!) + 1)
                                                        .toString() !=
                                                    valueOrDefault<String>(
                                                      widget!
                                                          .generatedQuizz
                                                          ?.questionCards
                                                          ?.length
                                                          .toString(),
                                                      '10',
                                                    ),
                                                true,
                                              ))
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                        _model.pageNavigate =
                                                            _model.pageNavigate! +
                                                                1;
                                                        safeSetState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2c4cw188' /* Next */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.navigate_next,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 20.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        iconAlignment:
                                                            IconAlignment.end,
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tonicColor1,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 1.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tonicColor1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (valueOrDefault<bool>(
                                                ((_model.pageNavigate!) + 1)
                                                        .toString() ==
                                                    valueOrDefault<String>(
                                                      widget!
                                                          .generatedQuizz
                                                          ?.questionCards
                                                          ?.length
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
                                                      _model.firestoreId =
                                                          await actions
                                                              .generateFirestoreId();

                                                      var savedQuizRecordReference =
                                                          SavedQuizRecord
                                                              .collection
                                                              .doc(_model
                                                                  .firestoreId!);
                                                      await savedQuizRecordReference
                                                          .set({
                                                        ...createSavedQuizRecordData(
                                                          quizName: widget!
                                                              .generatedQuizz
                                                              ?.quizName,
                                                          createdAt:
                                                              getCurrentTimestamp,
                                                          totalQuestions: widget!
                                                              .generatedQuizz
                                                              ?.questionCards
                                                              ?.length,
                                                          totalCorrectAnswers:
                                                              _model.userScore,
                                                          userRef:
                                                              currentUserReference,
                                                          timeDuration: _model
                                                              .timerMilliseconds,
                                                          sourceType: widget!
                                                              .sourceType,
                                                          sourceInput: widget!
                                                              .sourceInput,
                                                          quizId: _model
                                                              .firestoreId,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'questionCards':
                                                                getQuestionCardListFirestoreData(
                                                              _model
                                                                  .generatedQuizz
                                                                  ?.questionCards,
                                                            ),
                                                            'flashcards':
                                                                getFlashcardListFirestoreData(
                                                              widget!
                                                                  .generatedQuizz
                                                                  ?.flashcards,
                                                            ),
                                                          },
                                                        ),
                                                      });
                                                      _model.quizRef =
                                                          SavedQuizRecord
                                                              .getDocumentFromData({
                                                        ...createSavedQuizRecordData(
                                                          quizName: widget!
                                                              .generatedQuizz
                                                              ?.quizName,
                                                          createdAt:
                                                              getCurrentTimestamp,
                                                          totalQuestions: widget!
                                                              .generatedQuizz
                                                              ?.questionCards
                                                              ?.length,
                                                          totalCorrectAnswers:
                                                              _model.userScore,
                                                          userRef:
                                                              currentUserReference,
                                                          timeDuration: _model
                                                              .timerMilliseconds,
                                                          sourceType: widget!
                                                              .sourceType,
                                                          sourceInput: widget!
                                                              .sourceInput,
                                                          quizId: _model
                                                              .firestoreId,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'questionCards':
                                                                getQuestionCardListFirestoreData(
                                                              _model
                                                                  .generatedQuizz
                                                                  ?.questionCards,
                                                            ),
                                                            'flashcards':
                                                                getFlashcardListFirestoreData(
                                                              widget!
                                                                  .generatedQuizz
                                                                  ?.flashcards,
                                                            ),
                                                          },
                                                        ),
                                                      }, savedQuizRecordReference);
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
                                                      ).then((s) =>
                                                              s.firstOrNull);

                                                      await _model
                                                          .userStatisticDocument!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'nb_quiz_done':
                                                                FieldValue
                                                                    .increment(
                                                                        1),
                                                            'nb_questions_done':
                                                                FieldValue.increment(widget!
                                                                    .generatedQuizz!
                                                                    .questionCards
                                                                    .length),
                                                            'nb_correct_answers':
                                                                FieldValue
                                                                    .increment(
                                                                        _model
                                                                            .userScore!),
                                                            'total_time_spent_on_quiz':
                                                                FieldValue
                                                                    .increment(
                                                                        _model
                                                                            .timerMilliseconds),
                                                          },
                                                        ),
                                                      });

                                                      context.goNamed(
                                                        ScorePageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'quizResult':
                                                              serializeParam(
                                                            QuizResultStruct(
                                                              totalQuestions:
                                                                  valueOrDefault<
                                                                      int>(
                                                                widget!
                                                                    .generatedQuizz
                                                                    ?.questionCards
                                                                    ?.length,
                                                                10,
                                                              ),
                                                              correctAnswers:
                                                                  _model
                                                                      .userScore,
                                                              completionTime: _model
                                                                  .timerMilliseconds,
                                                            ),
                                                            ParamType
                                                                .DataStruct,
                                                          ),
                                                          'flashcards':
                                                              serializeParam(
                                                            widget!
                                                                .generatedQuizz
                                                                ?.flashcards,
                                                            ParamType
                                                                .DataStruct,
                                                            isList: true,
                                                          ),
                                                          'quizRef':
                                                              serializeParam(
                                                            _model.quizRef
                                                                ?.reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'lc0wvw5a' /* Complete */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 45.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tonicColor1,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
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
                        ),
                      ]
                          .divide(SizedBox(height: 15.0))
                          .around(SizedBox(height: 15.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
