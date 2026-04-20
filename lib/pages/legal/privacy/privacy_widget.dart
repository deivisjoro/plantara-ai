import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'privacy_model.dart';
export 'privacy_model.dart';

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({super.key});

  static String routeName = 'Privacy';
  static String routePath = '/privacy';

  @override
  State<PrivacyWidget> createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  late PrivacyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyModel());
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
              'puq90lgp' /* Privacy Policy */,
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
                          'gdocybfu' /* How we collect, use, and prote... */,
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
                          'etoh4fsv' /* We value your privacy. This po... */,
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
                          'gqr0kc38' /* 1. Information We Collect */,
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
                          '5k9ytsfs' /*  •  Personal information you p... */,
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
                          'p04x7rus' /* 2. How We Use Your Data */,
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
                          'tisfqysd' /*  •  To provide and improve the... */,
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
                          '7ad7kl32' /* 3. Data Security */,
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
                          '4gpqcjrt' /*  •  We do not sell your person... */,
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
                              'z1cgob4r' /* 4. Security */,
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
                              '183mopjh' /*  •  We use reasonable measures... */,
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
