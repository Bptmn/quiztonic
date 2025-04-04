import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_item_shimmer_model.dart';
export 'quiz_item_shimmer_model.dart';

class QuizItemShimmerWidget extends StatefulWidget {
  const QuizItemShimmerWidget({super.key});

  @override
  State<QuizItemShimmerWidget> createState() => _QuizItemShimmerWidgetState();
}

class _QuizItemShimmerWidgetState extends State<QuizItemShimmerWidget>
    with TickerProviderStateMixin {
  late QuizItemShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizItemShimmerModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(-50.0, 100.0),
            end: Offset(100.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 800.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(-63.0, 0.0),
            end: Offset(100.0, -41.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 800.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(-100.0, 100.0),
            end: Offset(100.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 800.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(-100.0, 100.0),
            end: Offset(100.0, -100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 800.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
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
    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).borderColor,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.55,
                          height: 16.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRect(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 6.0,
                                sigmaY: 6.0,
                              ),
                              child: Transform.rotate(
                                angle: 110.0 * (math.pi / 180),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/shimmer_white.png',
                                    width: double.infinity,
                                    height: 16.0,
                                    fit: BoxFit.cover,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'imageOnPageLoadAnimation1']!),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRect(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 6.0,
                            sigmaY: 6.0,
                          ),
                          child: Transform.rotate(
                            angle: 30.0 * (math.pi / 180),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.asset(
                                'assets/images/shimmer_white.png',
                                height: 30.0,
                                fit: BoxFit.cover,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 6.0,
                          sigmaY: 6.0,
                        ),
                        child: Transform.rotate(
                          angle: 110.0 * (math.pi / 180),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/shimmer_white.png',
                              width: 200.0,
                              height: 12.0,
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation3']!),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.15,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 6.0,
                          sigmaY: 6.0,
                        ),
                        child: Transform.rotate(
                          angle: 110.0 * (math.pi / 180),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/shimmer_white.png',
                              width: double.infinity,
                              height: 12.0,
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation4']!),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 5.0)),
          ),
        ),
      ),
    );
  }
}
