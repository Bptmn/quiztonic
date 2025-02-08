import '/backend/schema/structs/index.dart';
import '/elements/answer_item/answer_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_card_model.dart';
export 'question_card_model.dart';

class QuestionCardWidget extends StatefulWidget {
  const QuestionCardWidget({
    super.key,
    required this.questionCard,
  });

  final QuestionCardStruct? questionCard;

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
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.questionCard?.questionText,
                  'QuestionText',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Builder(
                builder: (context) {
                  final mcq =
                      widget!.questionCard?.questionChoices?.toList() ?? [];

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: mcq.length,
                    itemBuilder: (context, mcqIndex) {
                      final mcqItem = mcq[mcqIndex];
                      return wrapWithModel(
                        model: _model.answerItemModels.getModel(
                          mcqIndex.toString(),
                          mcqIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: AnswerItemWidget(
                          key: Key(
                            'Keyb87_${mcqIndex.toString()}',
                          ),
                          answerText: mcqItem,
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
    );
  }
}
