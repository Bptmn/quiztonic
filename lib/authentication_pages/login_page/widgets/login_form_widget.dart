import 'package:flutter/material.dart';
import '/authentication_pages/login_page/login_page_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/dialogs/reset_password/reset_password_widget.dart';
import 'package:google_fonts/google_fonts.dart';

/// Login form widget - Email and password fields with validation
///
/// Extracted from login_page_widget.dart for better code organization
/// and reusability. This widget handles the email/password form section.
class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required this.model,
    required this.formKey,
  });

  final LoginPageModel model;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Email field
              _buildEmailField(context),
              
              // Password field  
              _buildPasswordField(context),
              
              // Forgot password link
              _buildForgotPasswordLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: model.emailAddressFieldTextController,
          focusNode: model.emailAddressFieldFocusNode,
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.roboto(),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  lineHeight: 1.5,
                ),
            hintText: FFLocalizations.of(context).getText('7ebq4ti3' /* Email */),
            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.roboto(),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  lineHeight: 1.5,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFD0D5DD),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFFDA29B),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFFDA29B),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(14.0, 10.0, 14.0, 10.0),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.roboto(),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
                lineHeight: 1.5,
              ),
          keyboardType: TextInputType.emailAddress,
          validator: model.emailAddressFieldTextControllerValidator.asValidator(context),
        ),
      ],
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: model.passwordFieldTextController,
          focusNode: model.passwordFieldFocusNode,
          autofocus: false,
          obscureText: !model.passwordFieldVisibility,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.roboto(),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  lineHeight: 1.5,
                ),
            hintText: FFLocalizations.of(context).getText('l0q1a02h' /* Password */),
            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.roboto(),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  lineHeight: 1.5,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFD0D5DD),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFFDA29B),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFFDA29B),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(14.0, 10.0, 14.0, 10.0),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.roboto(),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
                lineHeight: 1.5,
              ),
          validator: model.passwordFieldTextControllerValidator.asValidator(context),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordLink(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              isDismissible: false,
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: const ResetPasswordWidget(),
                );
              },
            );
          },
          child: Text(
            FFLocalizations.of(context).getText('75zz3dh0' /* Forgot password? */),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.roboto(),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ),
    );
  }
}

