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
import 'statistics_shimmer_model.dart';
export 'statistics_shimmer_model.dart';

class StatisticsShimmerWidget extends StatefulWidget {
  const StatisticsShimmerWidget({super.key});

  @override
  State<StatisticsShimmerWidget> createState() =>
      _StatisticsShimmerWidgetState();
}

class _StatisticsShimmerWidgetState extends State<StatisticsShimmerWidget>
    with TickerProviderStateMixin {
  late StatisticsShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticsShimmerModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 850.0.ms,
            begin: Offset(100.0, 100.0),
            end: Offset(-100.0, -100.0),
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
      'imageOnPageLoadAnimation5': AnimationInfo(
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
      'imageOnPageLoadAnimation6': AnimationInfo(
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
    return Container(
      height: 85.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).borderColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        width: 35.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
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
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation1']!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        width: 70.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
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
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation2']!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).borderColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        width: 35.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
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
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation3']!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        width: 70.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
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
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation4']!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).borderColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        width: 35.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
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
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation5']!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        width: 70.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
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
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation6']!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ].divide(SizedBox(width: 10.0)),
      ),
    );
  }
}
