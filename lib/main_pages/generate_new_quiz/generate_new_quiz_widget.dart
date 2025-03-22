import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'generate_new_quiz_model.dart';
export 'generate_new_quiz_model.dart';

class GenerateNewQuizWidget extends StatefulWidget {
  const GenerateNewQuizWidget({super.key});

  static String routeName = 'GenerateNewQuiz';
  static String routePath = '/generateNewQuiz';

  @override
  State<GenerateNewQuizWidget> createState() => _GenerateNewQuizWidgetState();
}

class _GenerateNewQuizWidgetState extends State<GenerateNewQuizWidget> {
  late GenerateNewQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerateNewQuizModel());

    _model.textFieldRawTextTextController ??= TextEditingController();
    _model.textFieldRawTextFocusNode ??= FocusNode();

    _model.textFieldUrlTextController ??= TextEditingController();
    _model.textFieldUrlFocusNode ??= FocusNode();

    _model.switchGenerateFlashcardsValue = true;
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.goNamed(HomePageWidget.routeName);
            },
          ),
          title: Text(
            'Generate Quiz',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Choose Input Format',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FlutterFlowDropDown<QuizInputFormat>(
                              controller:
                                  _model.dropDownInputFormatValueController ??=
                                      FormFieldController<QuizInputFormat>(
                                _model.dropDownInputFormatValue ??=
                                    QuizInputFormat.websiteUrl,
                              ),
                              options: List<QuizInputFormat>.from(
                                  QuizInputFormat.values),
                              optionLabels: [
                                'Raw text',
                                'Website URL',
                                'PDF file'
                              ],
                              onChanged: (val) async {
                                safeSetState(() =>
                                    _model.dropDownInputFormatValue = val);
                                _model.selectedInputFormat =
                                    _model.dropDownInputFormatValue;
                                safeSetState(() {});
                              },
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Website URL',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 15.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.selectedInputFormat ==
                          QuizInputFormat.rawText) {
                        return Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Enter your text content',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _model
                                              .textFieldRawTextTextController,
                                          focusNode:
                                              _model.textFieldRawTextFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Enter your text here...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: 12,
                                          minLines: 8,
                                          validator: _model
                                              .textFieldRawTextTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.pastedContentRawText =
                                              await actions
                                                  .pasteTextFromClipboard();
                                          safeSetState(() {
                                            _model.textFieldRawTextTextController
                                                    ?.text =
                                                _model.pastedContentRawText!;
                                          });

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.content_paste_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 17.0,
                                              ),
                                              Text(
                                                'paste',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        );
                      } else if (_model.selectedInputFormat ==
                          QuizInputFormat.pdfFile) {
                        return Visibility(
                          visible: _model.selectedInputFormat ==
                              QuizInputFormat.pdfFile,
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Select a PDF file',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          allowedExtensions: ['pdf'],
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                        ))
                                                    .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                            });
                                            showUploadMessage(
                                              context,
                                              'Success!',
                                            );
                                          } else {
                                            safeSetState(() {});
                                            showUploadMessage(
                                              context,
                                              'Failed to upload file',
                                            );
                                            return;
                                          }
                                        }
                                      },
                                      text: 'Click to upload',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Enter a website URL',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller:
                                              _model.textFieldUrlTextController,
                                          focusNode:
                                              _model.textFieldUrlFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Enter an url here...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: null,
                                          validator: _model
                                              .textFieldUrlTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.pastedTextContent =
                                              await actions
                                                  .pasteTextFromClipboard();
                                          safeSetState(() {
                                            _model.textFieldUrlTextController
                                                    ?.text =
                                                _model.pastedTextContent!;
                                          });

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.content_paste_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 17.0,
                                              ),
                                              Text(
                                                'paste',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Quiz Settings',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Number of Questions',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Container(
                                  width: 120.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => Icon(
                                      Icons.remove_rounded,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 24.0,
                                    ),
                                    incrementIconBuilder: (enabled) => Icon(
                                      Icons.add_rounded,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 24.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    count: _model.countControllerValue ??= 10,
                                    updateCount: (count) => safeSetState(() =>
                                        _model.countControllerValue = count),
                                    stepSize: 1,
                                    minimum: 0,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Generate flashcards',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Switch.adaptive(
                                  value: _model.switchGenerateFlashcardsValue!,
                                  onChanged: (newValue) async {
                                    safeSetState(() =>
                                        _model.switchGenerateFlashcardsValue =
                                            newValue!);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      if (_model.selectedInputFormat ==
                          QuizInputFormat.rawText) {
                        _model.jsonFileText = await actions.createJsonFile(
                          _model.textFieldRawTextTextController.text,
                          _model.countControllerValue!,
                          4,
                          '',
                          _model.switchGenerateFlashcardsValue!,
                        );
                        _model.apiResultFromText =
                            await QuizzGenerationAPICall.call(
                          jsonFile: _model.jsonFileText,
                        );

                        if ((_model.apiResultFromText?.succeeded ?? true)) {
                          context.goNamed(
                            QuizPageWidget.routeName,
                            queryParameters: {
                              'generatedQuizz': serializeParam(
                                GeneratedQuizzStruct.maybeFromMap(
                                    (_model.apiResultFromText?.jsonBody ?? '')),
                                ParamType.DataStruct,
                              ),
                              'sourceType': serializeParam(
                                'rawText',
                                ParamType.String,
                              ),
                              'sourceInput': serializeParam(
                                _model.textFieldRawTextTextController.text,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }
                        await actions.printApiCallResult(
                          (_model.apiResultFromText?.jsonBody ?? ''),
                        );
                      } else if (_model.selectedInputFormat ==
                          QuizInputFormat.websiteUrl) {
                        _model.jsonFileUrl = await actions.createJsonFile(
                          '',
                          _model.countControllerValue!,
                          4,
                          _model.textFieldUrlTextController.text,
                          _model.switchGenerateFlashcardsValue!,
                        );
                        _model.apiResultFromUrl =
                            await QuizzGenerationAPICall.call(
                          jsonFile: _model.jsonFileUrl,
                        );

                        if ((_model.apiResultFromUrl?.succeeded ?? true)) {
                          context.goNamed(
                            QuizPageWidget.routeName,
                            queryParameters: {
                              'generatedQuizz': serializeParam(
                                GeneratedQuizzStruct.maybeFromMap(
                                    (_model.apiResultFromUrl?.jsonBody ?? '')),
                                ParamType.DataStruct,
                              ),
                              'sourceType': serializeParam(
                                'url',
                                ParamType.String,
                              ),
                              'sourceInput': serializeParam(
                                _model.textFieldUrlTextController.text,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }
                        await actions.printApiCallResult(
                          (_model.apiResultFromUrl?.jsonBody ?? ''),
                        );
                      } else if (_model.selectedInputFormat ==
                          QuizInputFormat.pdfFile) {
                        _model.jsonFilePdf = await actions.createJsonFile(
                          '',
                          _model.countControllerValue!,
                          4,
                          '',
                          _model.switchGenerateFlashcardsValue!,
                        );
                        _model.apiResultFromPdf =
                            await QuizzGenerationAPICall.call(
                          jsonFile: _model.jsonFilePdf,
                          pdfFile: _model.uploadedLocalFile,
                        );

                        if ((_model.apiResultFromPdf?.succeeded ?? true)) {
                          context.goNamed(
                            QuizPageWidget.routeName,
                            queryParameters: {
                              'generatedQuizz': serializeParam(
                                GeneratedQuizzStruct.maybeFromMap(
                                    (_model.apiResultFromPdf?.jsonBody ?? '')),
                                ParamType.DataStruct,
                              ),
                              'sourceType': serializeParam(
                                'pdf',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }
                        await actions.printApiCallResult(
                          (_model.apiResultFromPdf?.jsonBody ?? ''),
                        );
                      }

                      safeSetState(() {});
                    },
                    text: 'Generate Quiz',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 56.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                ].divide(SizedBox(height: 15.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
