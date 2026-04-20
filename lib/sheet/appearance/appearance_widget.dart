import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appearance_model.dart';
export 'appearance_model.dart';

class AppearanceWidget extends StatefulWidget {
  const AppearanceWidget({super.key});

  @override
  State<AppearanceWidget> createState() => _AppearanceWidgetState();
}

class _AppearanceWidgetState extends State<AppearanceWidget> {
  late AppearanceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppearanceModel());
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
                      '8l2ug6zz' /* Appearance */,
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
                    FFAppState().ThemeSystem = false;
                    FFAppState().update(() {});
                    setDarkModeSetting(context, ThemeMode.light);
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
                          Icon(
                            FFIcons.ksun,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'h2v6sw9q' /* Light */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if ((Theme.of(context).brightness ==
                                  Brightness.light) &&
                              !FFAppState().ThemeSystem)
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
                    FFAppState().ThemeSystem = false;
                    FFAppState().update(() {});
                    setDarkModeSetting(context, ThemeMode.dark);
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
                          Icon(
                            FFIcons.kmoon,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '8cy3zo9o' /* Dark */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if ((Theme.of(context).brightness ==
                                  Brightness.dark) &&
                              !FFAppState().ThemeSystem)
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
                    FFAppState().ThemeSystem = true;
                    FFAppState().update(() {});
                    setDarkModeSetting(context, ThemeMode.system);
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
                          Icon(
                            FFIcons.kgearFine,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'zxsxbq13' /* System */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (FFAppState().ThemeSystem)
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
