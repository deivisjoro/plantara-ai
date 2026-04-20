import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'terms_model.dart';
export 'terms_model.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({super.key});

  static String routeName = 'Terms';
  static String routePath = '/terms';

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  late TermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsModel());
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
              's5ec3ezs' /* Terms & Conditions */,
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'pf19klo6' /* Please read these terms carefu... */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Rethink Sans',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.5,
                                ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '8iwotfhl' /* By using our app, you agree to... */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Rethink Sans',
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'vpx1t0nx' /* 1. Acceptance of Terms */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Rethink Sans',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '4nx79qnq' /* By using the Book Reader App (... */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Rethink Sans',
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'adgwqxzh' /* 2. Use of the App */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Rethink Sans',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'zqxnc1ah' /*  •  The App is for personal, n... */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Rethink Sans',
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'nf0rvr8r' /* 3. User Accounts */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Rethink Sans',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'pchp17u0' /*  •  Some features require crea... */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Rethink Sans',
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                  SafeArea(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'mnigajzj' /* 4. Intellectual Property */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Rethink Sans',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'y6twhwqg' /*  •  All content, design, and s... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Rethink Sans',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 24.0))
                    .addToStart(SizedBox(height: 12.0))
                    .addToEnd(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
