import '';
import '/backend/schema/structs/index.dart';
import '/components/answer_item/answer_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_card_model.dart';
export 'question_card_model.dart';

class QuestionCardWidget extends StatefulWidget {
  const QuestionCardWidget({
    super.key,
    required this.questionCard,
    this.updateScore,
  });

  final QuestionCardsStruct? questionCard;
  final Future Function(bool isCorrect, int userAnswerIndex)? updateScore;

  @override
  State<QuestionCardWidget> createState() => _QuestionCardWidgetState();
}

class _QuestionCardWidgetState extends State<QuestionCardWidget> {
  late QuestionCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.questionCard?.questionIsDone == true) {
        _model.answerDone = true;
        _model.answerIsCorrect = widget!.questionCard?.questionAnswerIndex ==
            widget!.questionCard?.userSelectionIndex;
        _model.selectedAnswer = widget!.questionCard?.userSelectionIndex;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              () {
                if (_model.answerIsCorrect! && _model.answerDone) {
                  return FlutterFlowTheme.of(context).secondary;
                } else if (!_model.answerIsCorrect! && _model.answerDone) {
                  return FlutterFlowTheme.of(context).error;
                } else {
                  return FlutterFlowTheme.of(context).primaryBackground;
                }
              }(),
              FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Text(
                      valueOrDefault<String>(
                        widget!.questionCard?.questionText,
                        'questionText',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  final mcq =
                      widget!.questionCard?.questionChoices?.toList() ?? [];

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(mcq.length, (mcqIndex) {
                      final mcqItem = mcq[mcqIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (!_model.answerDone) {
                            _model.answerIsCorrect = mcqIndex ==
                                widget!.questionCard?.questionAnswerIndex;
                            _model.answerDone = true;
                            _model.selectedAnswer = mcqIndex;
                            safeSetState(() {});
                            await widget.updateScore?.call(
                              _model.answerIsCorrect!,
                              _model.selectedAnswer!,
                            );
                          }
                        },
                        child: wrapWithModel(
                          model: _model.answerItemModels.getModel(
                            mcqIndex.toString(),
                            mcqIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: AnswerItemWidget(
                            key: Key(
                              'Keyb87_${mcqIndex.toString()}',
                            ),
                            answerText: mcqItem,
                            isSelected: mcqIndex == _model.selectedAnswer,
                            itemIndex: mcqIndex,
                          ),
                        ),
                      );
                    }).divide(SizedBox(height: 5.0)),
                  );
                },
              ),
              if (_model.answerDone)
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_model.answerIsCorrect ?? true)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 30.0,
                            ),
                            Text(
                              'Correct answer',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ]
                              .divide(SizedBox(width: 10.0))
                              .around(SizedBox(width: 10.0)),
                        ),
                      if (!_model.answerIsCorrect!)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).error,
                              size: 30.0,
                            ),
                            Text(
                              'Wrong answer',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ]
                              .divide(SizedBox(width: 10.0))
                              .around(SizedBox(width: 10.0)),
                        ),
                      if (valueOrDefault<bool>(
                        _model.answerDone,
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Text(
                                    'Explanation:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget!.questionCard?.answerExplanation,
                                    'answerExplanation',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ].divide(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
