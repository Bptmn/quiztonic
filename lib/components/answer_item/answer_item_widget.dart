import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'answer_item_model.dart';
export 'answer_item_model.dart';

class AnswerItemWidget extends StatefulWidget {
  const AnswerItemWidget({
    super.key,
    required this.answerText,
    bool? isSelected,
    required this.itemIndex,
    required this.isCorrectAnswer,
  }) : this.isSelected = isSelected ?? false;

  final String? answerText;
  final bool isSelected;
  final int? itemIndex;
  final bool? isCorrectAnswer;

  @override
  State<AnswerItemWidget> createState() => _AnswerItemWidgetState();
}

class _AnswerItemWidgetState extends State<AnswerItemWidget> {
  late AnswerItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnswerItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            () {
              if (widget!.isCorrectAnswer! && widget!.isSelected) {
                return FlutterFlowTheme.of(context).success;
              } else if (!widget!.isCorrectAnswer! && widget!.isSelected) {
                return FlutterFlowTheme.of(context).error;
              } else {
                return FlutterFlowTheme.of(context).borderColor;
              }
            }(),
            FlutterFlowTheme.of(context).borderColor,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tonicColor1,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).borderColor,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          String.fromCharCode(65 + (widget!.itemIndex!)),
                          'A',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget!.answerText,
                      'answerX',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
