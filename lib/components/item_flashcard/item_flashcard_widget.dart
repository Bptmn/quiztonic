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
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              borderRadius: BorderRadius.circular(12.0),
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
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
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
              color: FlutterFlowTheme.of(context).primaryText,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary,
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
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).alternate,
                        letterSpacing: 0.0,
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
