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
import 'folder_item_shimmer_model.dart';
export 'folder_item_shimmer_model.dart';

class FolderItemShimmerWidget extends StatefulWidget {
  const FolderItemShimmerWidget({super.key});

  @override
  State<FolderItemShimmerWidget> createState() =>
      _FolderItemShimmerWidgetState();
}

class _FolderItemShimmerWidgetState extends State<FolderItemShimmerWidget>
    with TickerProviderStateMixin {
  late FolderItemShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FolderItemShimmerModel());

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
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).borderColor,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 180.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                animationsMap['imageOnPageLoadAnimation1']!),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                  ].divide(SizedBox(height: 8.0)),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 28.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
