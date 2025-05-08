import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quiz_item/quiz_item_widget.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/dialogs/edit_folder/edit_folder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer_items/folder_item_shimmer/folder_item_shimmer_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'folder_page_model.dart';
export 'folder_page_model.dart';

class FolderPageWidget extends StatefulWidget {
  const FolderPageWidget({
    super.key,
    required this.folderDocument,
  });

  final MyFoldersRecord? folderDocument;

  static String routeName = 'FolderPage';
  static String routePath = '/folderPage';

  @override
  State<FolderPageWidget> createState() => _FolderPageWidgetState();
}

class _FolderPageWidgetState extends State<FolderPageWidget> {
  late FolderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FolderPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).transparent,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 65.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 35.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Text(
                  valueOrDefault<String>(
                    widget!.folderDocument?.name,
                    'folderName',
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.webSideBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: WebSideBarWidget(),
                ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: FFAppConstants.PageContentMaxWidth.toDouble(),
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget!.folderDocument?.name,
                                          'folderName',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 26.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.0,
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              StreamBuilder<List<MyQuizRecord>>(
                                stream: queryMyQuizRecord(
                                  parent: currentUserReference,
                                  queryBuilder: (myQuizRecord) =>
                                      myQuizRecord.where(
                                    'folder_reference',
                                    isEqualTo:
                                        widget!.folderDocument?.reference,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return FolderItemShimmerWidget();
                                  }
                                  List<MyQuizRecord> listViewMyQuizRecordList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewMyQuizRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 10.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewMyQuizRecord =
                                          listViewMyQuizRecordList[
                                              listViewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            QuizPageWidget.routeName,
                                            queryParameters: {
                                              'quizDocument': serializeParam(
                                                listViewMyQuizRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'quizDocument':
                                                  listViewMyQuizRecord,
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.quizItemModels.getModel(
                                            listViewMyQuizRecord.reference.id,
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: QuizItemWidget(
                                            key: Key(
                                              'Key66p_${listViewMyQuizRecord.reference.id}',
                                            ),
                                            quiz: listViewMyQuizRecord,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                child: EditFolderWidget(
                                                  currentFolder:
                                                      widget!.folderDocument!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'gofnmf1a' /* Edit the folder */,
                                    ),
                                    icon: Icon(
                                      Icons.edit_rounded,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 22.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 25.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .tonicColor1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                      elevation: 1.0,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              for (int loop1Index = 0;
                                  loop1Index <
                                      widget!.folderDocument!.quizReferences
                                          .length;
                                  loop1Index += 1) {
                                final currentLoop1Item = widget!
                                    .folderDocument!.quizReferences[loop1Index];

                                await currentLoop1Item.update({
                                  ...mapToFirestore(
                                    {
                                      'folder_reference': FieldValue.delete(),
                                    },
                                  ),
                                });
                              }
                              await widget!.folderDocument!.reference.delete();
                              if (isWeb) {
                                context.goNamed(
                                  LibraryWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                context.goNamed(
                                  LibraryWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'wunzriiq' /* Delete this folder */,
                            ),
                            icon: Icon(
                              Icons.delete_forever_sharp,
                              color: FlutterFlowTheme.of(context).error,
                              size: 22.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
