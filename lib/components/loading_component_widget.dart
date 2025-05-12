import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_component_model.dart';
export 'loading_component_model.dart';

class LoadingComponentWidget extends StatefulWidget {
  const LoadingComponentWidget({super.key});

  @override
  State<LoadingComponentWidget> createState() => _LoadingComponentWidgetState();
}

class _LoadingComponentWidgetState extends State<LoadingComponentWidget>
    with TickerProviderStateMixin {
  late LoadingComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingComponentModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1290.0.ms,
            color: FlutterFlowTheme.of(context).tonicColor1,
            angle: 6.283,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: FlutterFlowTheme.of(context).tonicColor1,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      constraints: BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Icon(
                Icons.diamond_outlined,
                color: FlutterFlowTheme.of(context).tonicColor1,
                size: 80.0,
              ),
            ),
            Flexible(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'r9xqxosp' /* Analyzing the collective consc... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.7,
                height: 10.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                ),
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Visibility(
                  visible: currentUserEmailVerified,
                  child: AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 130.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tonicColor1,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                  ),
                ),
              )
                  .animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!)
                  .animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                  ),
            ),
            Flexible(
              child: Text(
                FFLocalizations.of(context).getText(
                  'wkt2hpv7' /* Content generation could take ... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
              ),
            ),
          ].divide(SizedBox(height: 15.0)),
        ),
      ),
    );
  }
}
