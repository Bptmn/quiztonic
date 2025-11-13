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
import '/utils/error_helpers.dart';
import '/utils/error_messages.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_quiz_page_model.dart';
export 'loading_quiz_page_model.dart';

class LoadingQuizPageWidget extends StatefulWidget {
  const LoadingQuizPageWidget({
    super.key,
    required this.numOfQuestions,
    required this.numOfChoices,
    required this.generateFlashcards,
    this.textContent,
    this.url,
    this.pdfFile,
    required this.selectedInputFormat,
  });

  final int? numOfQuestions;
  final int? numOfChoices;
  final bool? generateFlashcards;
  final String? textContent;
  final String? url;
  final FFUploadedFile? pdfFile;
  final QuizInputFormat? selectedInputFormat;

  static String routeName = 'LoadingQuizPage';
  static String routePath = '/loadingQuizPage';

  @override
  State<LoadingQuizPageWidget> createState() => _LoadingQuizPageWidgetState();
}

class _LoadingQuizPageWidgetState extends State<LoadingQuizPageWidget>
    with TickerProviderStateMixin {
  late LoadingQuizPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingQuizPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.instantTimer = InstantTimer.periodic(
            duration: Duration(milliseconds: 4000),
            callback: (timer) async {
              if (_model.loadingTextIndex! <= _model.loadingTexts.length) {
                _model.loadingTextIndex = _model.loadingTextIndex! + 1;
                safeSetState(() {});
              } else {
                _model.loadingTextIndex = 0;
                safeSetState(() {});
              }
            },
            startImmediately: true,
          );
        }),
        Future(() async {
          if (widget!.selectedInputFormat == QuizInputFormat.rawText) {
            _model.apiResultFromText = await AiContentGenerationApiCall.call(
              generateFlashcard: widget!.generateFlashcards,
              numOfQuestions: widget!.numOfQuestions,
              numOfChoices: widget!.numOfChoices,
              textContent: widget!.textContent,
            );

            if ((_model.apiResultFromText?.succeeded ?? true)) {
              context.goNamed(
                QuizExoWidget.routeName,
                queryParameters: {
                  'generatedQuizz': serializeParam(
                    GeneratedQuizzStruct.maybeFromMap(
                        (_model.apiResultFromText?.jsonBody ?? '')),
                    ParamType.DataStruct,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else {
              await ErrorDialogs.showGenerationError(
                context,
                ErrorMessages.getApiErrorMessage(
                  _model.apiResultFromText?.statusCode ?? -1,
                  _model.apiResultFromText?.jsonBody,
                ),
              );

              context.goNamed(
                HomePageWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          } else if (widget!.selectedInputFormat ==
              QuizInputFormat.websiteUrl) {
            _model.apiResultFromUrl = await AiContentGenerationApiCall.call(
              generateFlashcard: widget!.generateFlashcards,
              numOfQuestions: widget!.numOfQuestions,
              numOfChoices: widget!.numOfChoices,
              url: widget!.url,
            );

            if ((_model.apiResultFromUrl?.succeeded ?? true)) {
              context.goNamed(
                QuizExoWidget.routeName,
                queryParameters: {
                  'generatedQuizz': serializeParam(
                    GeneratedQuizzStruct.maybeFromMap(
                        (_model.apiResultFromUrl?.jsonBody ?? '')),
                    ParamType.DataStruct,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else {
              await ErrorDialogs.showGenerationError(
                context,
                ErrorMessages.getApiErrorMessage(
                  _model.apiResultFromUrl?.statusCode ?? -1,
                  _model.apiResultFromUrl?.jsonBody,
                ),
              );

              context.goNamed(
                HomePageWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          } else if (widget!.selectedInputFormat == QuizInputFormat.pdfFile) {
            _model.pdfBinaryText = await actions.pdfToBinary(
              widget!.pdfFile!,
            );
            _model.apiResultFromPdf = await AiContentGenerationApiCall.call(
              generateFlashcard: widget!.generateFlashcards,
              numOfQuestions: widget!.numOfQuestions,
              numOfChoices: widget!.numOfChoices,
              pdfBinary: _model.pdfBinaryText,
            );

            if ((_model.apiResultFromPdf?.succeeded ?? true)) {
              context.goNamed(
                QuizExoWidget.routeName,
                queryParameters: {
                  'generatedQuizz': serializeParam(
                    GeneratedQuizzStruct.maybeFromMap(
                        (_model.apiResultFromPdf?.jsonBody ?? '')),
                    ParamType.DataStruct,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else {
              await ErrorDialogs.showGenerationError(
                context,
                ErrorMessages.getApiErrorMessage(
                  _model.apiResultFromPdf?.statusCode ?? -1,
                  _model.apiResultFromPdf?.jsonBody,
                ),
              );

              context.goNamed(
                HomePageWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          }
        }),
      ]);
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.6,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: FlutterFlowTheme.of(context).tonicColor1,
            angle: 0.157,
          ),
        ],
      ),
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
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      constraints: BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.goNamed(
                                    HomePageWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.brain,
                                      color: FlutterFlowTheme.of(context)
                                          .tonicColor1,
                                      size: 80.0,
                                    ).animateOnPageLoad(animationsMap[
                                        'iconOnPageLoadAnimation']!),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.loadingTexts.elementAtOrNull(
                                              _model.loadingTextIndex!),
                                          'Creating smart questions...',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              fontSize: 21.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        height: 10.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '7ee50lu4' /* Content generation could take ... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                            Opacity(
                              opacity: 0.0,
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'pxe6s6tf' /* Button */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
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
