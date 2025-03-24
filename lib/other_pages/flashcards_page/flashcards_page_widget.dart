import '';
import '/backend/schema/structs/index.dart';
import '/components/item_flashcard/item_flashcard_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
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
            'Flashcards',
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
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.93,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ((_model.pageNavigate!) + 1).toString(),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: '/',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text:
                                widget!.generatedFlashCards!.length.toString(),
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Manrope',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: LinearPercentIndicator(
                        percent: valueOrDefault<double>(
                          ((_model.pageNavigate!) + 1) /
                              widget!.generatedFlashCards!.length,
                          0.0,
                        ),
                        lineHeight: 12.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: FlutterFlowTheme.of(context).primary,
                        backgroundColor: FlutterFlowTheme.of(context).accent4,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final flashCard = widget!.generatedFlashCards!.toList();

                        return Container(
                          width: double.infinity,
                          height: 500.0,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage:
                                          max(0, min(0, flashCard.length - 1))),
                              scrollDirection: Axis.horizontal,
                              itemCount: flashCard.length,
                              itemBuilder: (context, flashCardIndex) {
                                final flashCardItem = flashCard[flashCardIndex];
                                return wrapWithModel(
                                  model: _model.itemFlashcardModels.getModel(
                                    flashCardIndex.toString(),
                                    flashCardIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
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
                                  5.0, 0.0, 5.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await _model.pageViewController?.previousPage(
                                    duration: Duration(milliseconds: 300),
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
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 20.0, 0.0),
                                  iconAlignment: IconAlignment.start,
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          ((_model.pageNavigate!) + 1).toString() !=
                              valueOrDefault<String>(
                                widget!.generatedFlashCards?.length.toString(),
                                '10',
                              ),
                          true,
                        ))
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await _model.pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
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
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 5.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).tonicColor1,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          ((_model.pageNavigate!) + 1).toString() ==
                              widget!.generatedFlashCards?.length.toString(),
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
                                    context.goNamed(HomePageWidget.routeName);
                                  }
                                },
                                text: 'Complete',
                                options: FFButtonOptions(
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
      ),
    );
  }
}
