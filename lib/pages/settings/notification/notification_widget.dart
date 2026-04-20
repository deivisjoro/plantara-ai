import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  static String routeName = 'Notification';
  static String routePath = '/notification';

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());

    _model.switchValue1 = true;
    _model.switchValue2 = true;
    _model.switchValue3 = true;
    _model.switchValue4 = true;
    _model.switchValue5 = true;
    _model.switchValue6 = true;
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
        resizeToAvoidBottomInset: false,
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
              '5bqjwyz1' /* Notification */,
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      16.0,
                      0,
                      16.0,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ao2win22' /* Order updates */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(),
                                    child: Transform.scale(
                                      scaleX: 0.8,
                                      scaleY: 0.8,
                                      child: Switch.adaptive(
                                        value: _model.switchValue1!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue1 = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'fytdd1gc' /* Get updates about your orders */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Rethink Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'r9nzbbh2' /* Promotions & offers */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(),
                                    child: Transform.scale(
                                      scaleX: 0.8,
                                      scaleY: 0.8,
                                      child: Switch.adaptive(
                                        value: _model.switchValue2!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue2 = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'y1apkhp1' /* Receive special deals and disc... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Rethink Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '66i3sjpq' /* App updates */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(),
                                    child: Transform.scale(
                                      scaleX: 0.8,
                                      scaleY: 0.8,
                                      child: Switch.adaptive(
                                        value: _model.switchValue3!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue3 = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'evqke76p' /* Stay informed about new featur... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Rethink Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'se2zve67' /* Recommendations */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(),
                                    child: Transform.scale(
                                      scaleX: 0.8,
                                      scaleY: 0.8,
                                      child: Switch.adaptive(
                                        value: _model.switchValue4!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue4 = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '5lf339bu' /* Get personalized product sugge... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Rethink Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'rj1mq2vf' /* Email notifications */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(),
                                    child: Transform.scale(
                                      scaleX: 0.8,
                                      scaleY: 0.8,
                                      child: Switch.adaptive(
                                        value: _model.switchValue5!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue5 = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'wqjp55k1' /* Receive updates via email */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Rethink Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'vmklj0j4' /* Push notifications */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(),
                                    child: Transform.scale(
                                      scaleX: 0.8,
                                      scaleY: 0.8,
                                      child: Switch.adaptive(
                                        value: _model.switchValue6!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue6 = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'bnagdjqm' /* Instant alerts on your device */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Rethink Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
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
