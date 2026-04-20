import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'signin_model.dart';
export 'signin_model.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({super.key});

  static String routeName = 'Signin';
  static String routePath = '/signin';

  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  late SigninModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SigninModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.emailTextController?.text =
              FFLocalizations.of(context).getText(
            '7vbeoct7' /* correo@dominio.com */,
          );
          _model.passwordTextController?.text =
              FFLocalizations.of(context).getText(
            '1p903d0v' /* example */,
          );
        }));
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 50.0,
              buttonSize: 44.0,
              icon: Icon(
                FFIcons.kcaretLeftBold,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'psqy7xne' /* Bienvenido de nuevo */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Rethink Sans',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'plwbcrgq' /* Correo electrónico */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Rethink Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 52.0,
                                  child: Stack(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.emailTextController,
                                          focusNode: _model.emailFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.emailTextController',
                                            Duration(milliseconds: 1),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          enabled: true,
                                          autofillHints: [AutofillHints.email],
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'laxqzoox' /* Enter your email */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily:
                                                          'Rethink Sans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    52.0, 16.0, 16.0, 16.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Rethink Sans',
                                                letterSpacing: 0.0,
                                              ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          enableInteractiveSelection: true,
                                          validator: _model
                                              .emailTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kenvelopeSimple,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5gr42pow' /* Contraseña */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Rethink Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 52.0,
                                  child: Stack(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.passwordTextController,
                                          focusNode: _model.passwordFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.passwordTextController',
                                            Duration(milliseconds: 1),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          enabled: true,
                                          autofillHints: [
                                            AutofillHints.password
                                          ],
                                          textInputAction: TextInputAction.done,
                                          obscureText:
                                              !_model.passwordVisibility,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '8dxmhu1l' /* Enter your password */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily:
                                                          'Rethink Sans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    52.0, 16.0, 16.0, 16.0),
                                            suffixIcon: InkWell(
                                              onTap: () async {
                                                safeSetState(() => _model
                                                        .passwordVisibility =
                                                    !_model.passwordVisibility);
                                              },
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                _model.passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Rethink Sans',
                                                letterSpacing: 0.0,
                                              ),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          enableInteractiveSelection: true,
                                          validator: _model
                                              .passwordTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kpassword,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Transform.translate(
                              offset: Offset(-8.0, 0.0),
                              child: ClipOval(
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ToggleIcon(
                                    onPressed: () async {
                                      safeSetState(() =>
                                          _model.remember = !_model.remember);
                                    },
                                    value: _model.remember,
                                    onIcon: Icon(
                                      FFIcons.kcheckCircleFill,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    offIcon: Icon(
                                      FFIcons.kcircle,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-4.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2s4g9bm3' /* Recuerdame */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rethink Sans',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'itmf9ds1' /* ¿Has olvidado tu contraseña? */,
                                        ),
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.underline,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Opacity(
                          opacity: (_model.emailTextController.text != '') &&
                                  (_model.passwordTextController.text != '')
                              ? 1.0
                              : 0.7,
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.loginResult = await actions.loginWithEmail(
                                _model.emailTextController.text,
                                _model.passwordTextController.text,
                              );
                              if (_model.loginResult == true) {
                                context.pushNamed(HomeWidget.routeName);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Email o contraseña incorrectos',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'jxzxaaxr' /* Iniciar sesion */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '1g7cpfko' /* ¿No tienes una cuenta?  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '0u5hq9el' /* Registrate */,
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).secondary,
                              decoration: TextDecoration.underline,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                context.pushNamed(SignupWidget.routeName);
                              },
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Rethink Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              lineHeight: 1.5,
                            ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
