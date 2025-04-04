import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quiz_item/quiz_item_widget.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer_items/quiz_item_shimmer/quiz_item_shimmer_widget.dart';
import '/shimmer_items/statistics_shimmer/statistics_shimmer_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
                title: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'j4hce7ml' /* Quiz */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Manrope',
                                letterSpacing: 0.0,
                              ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            '3qx562ah' /* Tonic */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).tonicColor1,
                                letterSpacing: 0.0,
                              ),
                        )
                      ],
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                              ),
                    ),
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
              wrapWithModel(
                model: _model.webSideBarModel,
                updateCallback: () => safeSetState(() {}),
                child: WebSideBarWidget(),
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: FFAppConstants.PageContentMaxWidth.toDouble(),
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 18.0, 18.0, 18.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '71sf38af' /* Dashboard */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              StreamBuilder<List<UserStatisticsRecord>>(
                                stream: queryUserStatisticsRecord(
                                  queryBuilder: (userStatisticsRecord) =>
                                      userStatisticsRecord.where(
                                    'userRef',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return StatisticsShimmerWidget();
                                  }
                                  List<UserStatisticsRecord>
                                      containerStatisticsUserStatisticsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerStatisticsUserStatisticsRecord =
                                      containerStatisticsUserStatisticsRecordList
                                              .isNotEmpty
                                          ? containerStatisticsUserStatisticsRecordList
                                              .first
                                          : null;

                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderColor,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerStatisticsUserStatisticsRecord
                                                              ?.nbQuizDone
                                                              ?.toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tonicColor1,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '8yc2zp01' /* Quiz */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderColor,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerStatisticsUserStatisticsRecord
                                                              ?.nbQuestionsDone
                                                              ?.toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tonicColor1,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'u8qvrshd' /* Questions */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (containerStatisticsUserStatisticsRecord
                                                    ?.nbCorrectAnswers !=
                                                0)
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .borderColor,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              (valueOrDefault<
                                                                      double>(
                                                                    containerStatisticsUserStatisticsRecord
                                                                        ?.nbCorrectAnswers
                                                                        ?.toDouble(),
                                                                    0.0,
                                                                  ) /
                                                                  valueOrDefault<
                                                                      double>(
                                                                    containerStatisticsUserStatisticsRecord
                                                                        ?.nbQuestionsDone
                                                                        ?.toDouble(),
                                                                    0.0,
                                                                  )),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '##0%',
                                                              locale: '',
                                                            ),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tonicColor1,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'w9d6epg8' /* Correct */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  );
                                },
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    GenerateNewQuizWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  'rm6vgq87' /* Generate a new Quiz */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 45.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).tonicColor1,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 1.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '0n1qgekd' /* Recent Quizzes */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              StreamBuilder<List<SavedQuizRecord>>(
                                stream: querySavedQuizRecord(
                                  queryBuilder: (savedQuizRecord) =>
                                      savedQuizRecord
                                          .where(
                                            'userRef',
                                            isEqualTo: currentUserReference,
                                          )
                                          .orderBy('createdAt',
                                              descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return QuizItemShimmerWidget();
                                  }
                                  List<SavedQuizRecord>
                                      listViewSavedQuizRecordList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewSavedQuizRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 15.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewSavedQuizRecord =
                                          listViewSavedQuizRecordList[
                                              listViewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            QuizPageWidget.routeName,
                                            queryParameters: {
                                              'quizDocument': serializeParam(
                                                listViewSavedQuizRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'quizDocument':
                                                  listViewSavedQuizRecord,
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.quizItemModels.getModel(
                                            listViewSavedQuizRecord
                                                .reference.id,
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: QuizItemWidget(
                                            key: Key(
                                              'Keyb6h_${listViewSavedQuizRecord.reference.id}',
                                            ),
                                            quizSaved: listViewSavedQuizRecord,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ].divide(SizedBox(height: 15.0)),
                          ),
                        ),
                      ),
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
