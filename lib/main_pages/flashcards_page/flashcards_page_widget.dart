import '/backend/schema/structs/index.dart';
import '/components/item_flashcard/item_flashcard_widget.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'flashcards_page_model.dart';
export 'flashcards_page_model.dart';

class FlashcardsPageWidget extends StatefulWidget {
  const FlashcardsPageWidget({
    super.key,
    required this.generatedFlashCards,
    this.fromProcess,
  });

  final List<FlashcardStruct>? generatedFlashCards;
  final String? fromProcess;

  static String routeName = 'FlashcardsPage';
  static String routePath = '/FlashcardsPage';

  @override
  State<FlashcardsPageWidget> createState() => _FlashcardsPageWidgetState();
}

class _FlashcardsPageWidgetState extends State<FlashcardsPageWidget> {
  late FlashcardsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlashcardsPageModel());

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
                    if (!isWeb) {
                      context.safePop();
                    }
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    '45gycve4' /* Flashcards */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
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
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: FFAppConstants.PageContentMaxWidth.toDouble(),
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '0ou5hl44' /* Flashcards */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 26.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.0,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    ((_model.pageNavigate!) + 1).toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '9ejsuro2' /* / */,
                                  ),
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget!.generatedFlashCards?.length
                                        ?.toString(),
                                    '10',
                                  ),
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: LinearPercentIndicator(
                              percent: valueOrDefault<double>(
                                ((_model.pageNavigate!) + 1) /
                                    widget!.generatedFlashCards!.length,
                                0.0,
                              ),
                              lineHeight: 12.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              barRadius: Radius.circular(20.0),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final flashCard =
                                  widget!.generatedFlashCards!.toList();

                              return Container(
                                width: double.infinity,
                                height: 500.0,
                                child: Stack(
                                  children: [
                                    Padding(
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
                                                    min(0,
                                                        flashCard.length - 1))),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: flashCard.length,
                                        itemBuilder: (context, flashCardIndex) {
                                          final flashCardItem =
                                              flashCard[flashCardIndex];
                                          return wrapWithModel(
                                            model: _model.itemFlashcardModels
                                                .getModel(
                                              flashCardIndex.toString(),
                                              flashCardIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ItemFlashcardWidget(
                                              key: Key(
                                                'Keyq5v_${flashCardIndex.toString()}',
                                              ),
                                              flashcard: flashCardItem,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller:
                                              _model.pageViewController ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              flashCard.length -
                                                                  1))),
                                          count: flashCard.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                            safeSetState(() {});
                                          },
                                          effect:
                                              smooth_page_indicator.SlideEffect(
                                            spacing: 8.0,
                                            radius: 8.0,
                                            dotWidth: 8.0,
                                            dotHeight: 8.0,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              if (_model.pageNavigate! > 0)
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await _model.pageViewController
                                            ?.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                        _model.pageNavigate =
                                            _model.pageNavigate! + -1;
                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'e8m6back' /* Previous */,
                                      ),
                                      icon: Icon(
                                        Icons.navigate_before,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 45.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 20.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                        elevation: 1.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                ((_model.pageNavigate!) + 1).toString() !=
                                    valueOrDefault<String>(
                                      widget!.generatedFlashCards?.length
                                          .toString(),
                                      '10',
                                    ),
                                true,
                              ))
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                        _model.pageNavigate =
                                            _model.pageNavigate! + 1;
                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '98wm4xnt' /* Next */,
                                      ),
                                      icon: Icon(
                                        Icons.navigate_next,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 10.0, 0.0),
                                        iconAlignment: IconAlignment.end,
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .tonicColor1,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
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
                                        elevation: 1.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tonicColor1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                ((_model.pageNavigate!) + 1).toString() ==
                                    widget!.generatedFlashCards?.length
                                        .toString(),
                                true,
                              ))
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (widget!.fromProcess == 'history') {
                                          context.safePop();
                                        } else {
                                          context.goNamed(
                                              HomePageWidget.routeName);
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'z3nz7lzn' /* Complete */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
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
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                        ],
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
