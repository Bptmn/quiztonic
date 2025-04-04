import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/folder_item/folder_item_widget.dart';
import '/dialogs/create_new_folder/create_new_folder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pick_up_afolder_model.dart';
export 'pick_up_afolder_model.dart';

class PickUpAfolderWidget extends StatefulWidget {
  const PickUpAfolderWidget({
    super.key,
    required this.quizRef,
    this.currentFolderRef,
    bool? fromChangeProcess,
  }) : this.fromChangeProcess = fromChangeProcess ?? false;

  final DocumentReference? quizRef;
  final DocumentReference? currentFolderRef;
  final bool fromChangeProcess;

  @override
  State<PickUpAfolderWidget> createState() => _PickUpAfolderWidgetState();
}

class _PickUpAfolderWidgetState extends State<PickUpAfolderWidget> {
  late PickUpAfolderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickUpAfolderModel());

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
        constraints: BoxConstraints(
          maxWidth: 400.0,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: StreamBuilder<List<FoldersRecord>>(
            stream: queryFoldersRecord(
              queryBuilder: (foldersRecord) => foldersRecord.where(
                'userRef',
                isEqualTo: currentUserReference,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<FoldersRecord> containerFoldersRecordList = snapshot.data!;

              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7.0,
                      color: Color(0x4D090F13),
                      offset: Offset(
                        0.0,
                        -3.0,
                      ),
                      spreadRadius: 0.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'gkkvujn5' /* Choose a Folder */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: 300.0,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final folderItem =
                                containerFoldersRecordList.toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: folderItem.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, folderItemIndex) {
                                final folderItemItem =
                                    folderItem[folderItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (widget!.fromChangeProcess) {
                                      await widget!.currentFolderRef!.update({
                                        ...createFoldersRecordData(
                                          updatedAt: getCurrentTimestamp,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'QuizRefs': FieldValue.arrayRemove(
                                                [widget!.quizRef]),
                                          },
                                        ),
                                      });
                                    }

                                    await widget!.quizRef!
                                        .update(createSavedQuizRecordData(
                                      folderRef: folderItemItem.reference,
                                    ));

                                    await folderItemItem.reference.update({
                                      ...createFoldersRecordData(
                                        updatedAt: getCurrentTimestamp,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'QuizRefs': FieldValue.arrayUnion(
                                              [widget!.quizRef]),
                                        },
                                      ),
                                    });

                                    context.goNamed(
                                      FolderPageWidget.routeName,
                                      queryParameters: {
                                        'folderDocument': serializeParam(
                                          folderItemItem,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'folderDocument': folderItemItem,
                                      },
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.folderItemModels.getModel(
                                      folderItemItem.reference.id,
                                      folderItemIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: FolderItemWidget(
                                      key: Key(
                                        'Key119_${folderItemItem.reference.id}',
                                      ),
                                      folderItem: folderItemItem,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Flexible(
                        child: Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        child: CreateNewFolderWidget(),
                                      ),
                                    );
                                  },
                                );

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'csq5q7bv' /* Create a new folder */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tonicColor1,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 1.0,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
