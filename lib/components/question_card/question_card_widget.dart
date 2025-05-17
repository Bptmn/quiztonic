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
    int? questionCardIndex,
  }) : this.questionCardIndex = questionCardIndex ?? 0;

  final QuestionCardStruct? questionCard;
  final Future Function(bool isCorrect, int userAnswerIndex)? updateScore;
  final int questionCardIndex;

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
        width: MediaQuery.sizeOf(context).width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).transparent,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          (widget!.questionCardIndex + 1).toString(),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        valueOrDefault<String>(
                          widget!.questionCard?.questionText,
                          'questionText',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                  child: Builder(
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
                                isCorrectAnswer:
                                    widget!.questionCard?.questionAnswerIndex ==
                                        mcqIndex,
                                answerDone: _model.answerDone,
                              ),
                            ),
                          );
                        }).divide(SizedBox(height: 5.0)),
                      );
                    },
                  ),
                ),
                if (_model.answerDone)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_model.answerIsCorrect ?? true)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: FlutterFlowTheme.of(context).success,
                                size: 30.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '4vaa3snx' /* Correct answer */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
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
                                FFLocalizations.of(context).getText(
                                  'zzn46win' /* Wrong answer */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
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
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'poib76jn' /* Explanation: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.questionCard?.answerExplanation,
                                      'answerExplanation',
                                    ),
                                    style: FlutterFlowTheme.of(context)
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
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                      ].divide(SizedBox(height: 2.0)),
                    ),
                  ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
