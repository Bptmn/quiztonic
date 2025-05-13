import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/web_side_bar/web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'generate_new_quiz_widget.dart' show GenerateNewQuizWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GenerateNewQuizModel extends FlutterFlowModel<GenerateNewQuizWidget> {
  ///  Local state fields for this page.

  QuizInputFormat? selectedInputFormat = QuizInputFormat.websiteUrl;

  bool pdrErrorToDisplay = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for WebSideBar component.
  late WebSideBarModel webSideBarModel;
  // State field(s) for DropDownInputFormat widget.
  QuizInputFormat? dropDownInputFormatValue;
  FormFieldController<QuizInputFormat>? dropDownInputFormatValueController;
  // State field(s) for TextFieldRawText widget.
  FocusNode? textFieldRawTextFocusNode;
  TextEditingController? textFieldRawTextTextController;
  String? Function(BuildContext, String?)?
      textFieldRawTextTextControllerValidator;
  String? _textFieldRawTextTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dmoxzgs4' /* The field is empty */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - pasteTextFromClipboard] action in ContainerPasteRawText widget.
  String? pastedContentRawText;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextFieldUrl widget.
  FocusNode? textFieldUrlFocusNode;
  TextEditingController? textFieldUrlTextController;
  String? Function(BuildContext, String?)? textFieldUrlTextControllerValidator;
  String? _textFieldUrlTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pki3pjgi' /* The field is empty */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - pasteTextFromClipboard] action in ContainerPasteUrl widget.
  String? pastedTextContent;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for SwitchGenerateFlashcards widget.
  bool? switchGenerateFlashcardsValue;

  @override
  void initState(BuildContext context) {
    webSideBarModel = createModel(context, () => WebSideBarModel());
    textFieldRawTextTextControllerValidator =
        _textFieldRawTextTextControllerValidator;
    textFieldUrlTextControllerValidator = _textFieldUrlTextControllerValidator;
  }

  @override
  void dispose() {
    webSideBarModel.dispose();
    textFieldRawTextFocusNode?.dispose();
    textFieldRawTextTextController?.dispose();

    textFieldUrlFocusNode?.dispose();
    textFieldUrlTextController?.dispose();
  }
}
