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
import 'folder_tag_shimmer_model.dart';
export 'folder_tag_shimmer_model.dart';

class FolderTagShimmerWidget extends StatefulWidget {
  const FolderTagShimmerWidget({super.key});

  @override
  State<FolderTagShimmerWidget> createState() => _FolderTagShimmerWidgetState();
}

class _FolderTagShimmerWidgetState extends State<FolderTagShimmerWidget>
    with TickerProviderStateMixin {
  late FolderTagShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FolderTagShimmerModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
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
      width: 150.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
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
            ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
