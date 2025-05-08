import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_flashcard_model.dart';
export 'item_flashcard_model.dart';

class ItemFlashcardWidget extends StatefulWidget {
  const ItemFlashcardWidget({
    super.key,
    required this.flashcard,
  });

  final FlashcardStruct? flashcard;

  @override
  State<ItemFlashcardWidget> createState() => _ItemFlashcardWidgetState();
}

class _ItemFlashcardWidgetState extends State<ItemFlashcardWidget> {
  late ItemFlashcardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemFlashcardModel());

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
      height: 400.0,
      decoration: BoxDecoration(),
      child: FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        speed: 400,
        front: Padding(
          padding: EdgeInsets.all(12.0),
          child: Material(
            color: Colors.transparent,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tonicColor1,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).borderColor,
                  width: 1.0,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget!.flashcard?.front,
                      'frontContent',
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.manrope(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
        back: Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).tonicColor1,
                width: 4.0,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.flashcard?.back,
                    'backContent',
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).blackText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
