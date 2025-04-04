import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/folder_item/folder_item_widget.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/dialogs/create_new_folder/create_new_folder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer_items/folder_item_shimmer/folder_item_shimmer_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'library_widget.dart' show LibraryWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LibraryModel extends FlutterFlowModel<LibraryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;
  // State field(s) for SearchInput widget.
  FocusNode? searchInputFocusNode;
  TextEditingController? searchInputTextController;
  String? Function(BuildContext, String?)? searchInputTextControllerValidator;
  // Models for FolderItem dynamic component.
  late FlutterFlowDynamicModels<FolderItemModel> folderItemModels;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
    folderItemModels = FlutterFlowDynamicModels(() => FolderItemModel());
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
    searchInputFocusNode?.dispose();
    searchInputTextController?.dispose();

    folderItemModels.dispose();
  }
}
