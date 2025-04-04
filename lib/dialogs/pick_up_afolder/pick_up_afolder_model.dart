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
import 'pick_up_afolder_widget.dart' show PickUpAfolderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PickUpAfolderModel extends FlutterFlowModel<PickUpAfolderWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for FolderItem dynamic component.
  late FlutterFlowDynamicModels<FolderItemModel> folderItemModels;

  @override
  void initState(BuildContext context) {
    folderItemModels = FlutterFlowDynamicModels(() => FolderItemModel());
  }

  @override
  void dispose() {
    folderItemModels.dispose();
  }
}
