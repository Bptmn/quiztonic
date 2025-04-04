import '/backend/schema/structs/index.dart';
import '/components/question_card/question_card_widget.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_answers_page_model.dart';
export 'quiz_answers_page_model.dart';

class QuizAnswersPageWidget extends StatefulWidget {
  const QuizAnswersPageWidget({
    super.key,
    required this.questionCards,
  });

  final List<QuestionCardStruct>? questionCards;

  static String routeName = 'QuizAnswersPage';
  static String routePath = '/quizAnswersPage';

  @override
  State<QuizAnswersPageWidget> createState() => _QuizAnswersPageWidgetState();
}

class _QuizAnswersPageWidgetState extends State<QuizAnswersPageWidget> {
  late QuizAnswersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizAnswersPageModel());

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
                    context.safePop();
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'ez5dh7pg' /* My answers */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Manrope',
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
                            FFLocalizations.of(context).getText(
                              '344koiwf' /* My answers */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        Builder(
                          builder: (context) {
                            final questionsCard =
                                widget!.questionCards!.toList();

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(questionsCard.length,
                                    (questionsCardIndex) {
                                  final questionsCardItem =
                                      questionsCard[questionsCardIndex];
                                  return wrapWithModel(
                                    model: _model.questionCardModels.getModel(
                                      questionsCardIndex.toString(),
                                      questionsCardIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: QuestionCardWidget(
                                      key: Key(
                                        'Keyrqm_${questionsCardIndex.toString()}',
                                      ),
                                      questionCard: questionsCardItem,
                                      updateScore:
                                          (isCorrect, userAnswerIndex) async {},
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ],
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
