import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_model.dart';
export 'language_model.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  late LanguageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'v4xm34kj' /* Language */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Rethink Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FFIcons.kxBold,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.fromLTRB(
                0,
                0,
                0,
                16.0,
              ),
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().Languages = Language.English;
                    safeSetState(() {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image.asset(
                              'assets/images/US.png',
                              width: 28.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'k48shgfu' /* English */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (FFAppState().Languages == Language.English)
                            Icon(
                              FFIcons.kcheckCircleFill,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().Languages = Language.Deutsch;
                    safeSetState(() {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image.asset(
                              'assets/images/DE.png',
                              width: 28.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '4oshkh5v' /* Deutsch */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (FFAppState().Languages == Language.Deutsch)
                            Icon(
                              FFIcons.kcheckCircleFill,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().Languages = Language.French;
                    safeSetState(() {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image.asset(
                              'assets/images/FR.png',
                              width: 28.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'afkv6zhz' /* French */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (FFAppState().Languages == Language.French)
                            Icon(
                              FFIcons.kcheckCircleFill,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().Languages = Language.Korean;
                    safeSetState(() {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image.asset(
                              'assets/images/KR.png',
                              width: 28.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'j7mtk5oe' /* Korean */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (FFAppState().Languages == Language.Korean)
                            Icon(
                              FFIcons.kcheckCircleFill,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
