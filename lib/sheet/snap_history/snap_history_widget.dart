import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'snap_history_model.dart';
export 'snap_history_model.dart';

class SnapHistoryWidget extends StatefulWidget {
  const SnapHistoryWidget({super.key});

  @override
  State<SnapHistoryWidget> createState() => _SnapHistoryWidgetState();
}

class _SnapHistoryWidgetState extends State<SnapHistoryWidget> {
  late SnapHistoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SnapHistoryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 32.0,
                      fillColor: FlutterFlowTheme.of(context).tertiary,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 16.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/60151881173.png',
                          width: 130.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 50.0,
                      buttonSize: 32.0,
                      fillColor: Color(0x7E7F817F),
                      icon: Icon(
                        FFIcons.kxBold,
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 16.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Text(
              FFLocalizations.of(context).getText(
                '0b8xu9wp' /* Never lose your all snap
histo... */
                ,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Rethink Sans',
                    letterSpacing: 0.0,
                    lineHeight: 1.3,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    FFIcons.kcalendar,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '8dec1ryk' /* Due to high maintenance costs ... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Rethink Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18.0, 16.0, 16.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    FFIcons.ktrash,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'bavuejgz' /* 2 identifications in your snap... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Rethink Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
            SafeArea(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(SubscriptionWidget.routeName);
                    },
                    text: FFLocalizations.of(context).getText(
                      'eiotrg7w' /* Upgrade to premium */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
