import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'subscription_model.dart';
export 'subscription_model.dart';

class SubscriptionWidget extends StatefulWidget {
  const SubscriptionWidget({super.key});

  static String routeName = 'Subscription';
  static String routePath = '/subscription';

  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  late SubscriptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionModel());
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
        backgroundColor: Color(0xFFFCFCFE),
        appBar: AppBar(
          backgroundColor: Color(0xFFFCFCFE),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 50.0,
              buttonSize: 44.0,
              icon: Icon(
                FFIcons.kcaretLeftBold,
                color: Color(0xFF1D231A),
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  'murcxa72' /* Restore */,
                ),
                options: FFButtonOptions(
                  height: 30.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFD5F6E2),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Rethink Sans',
                        color: Color(0xFF38B078),
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                showLoadingIndicator: false,
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFCFCFE),
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/IMG_1098.gif',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '6m2m4uof' /* Try for free */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Rethink Sans',
                          color: Color(0xFF1D231A),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.subscription = Subscription.lifetime;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 64.0,
                          decoration: BoxDecoration(
                            color: _model.subscription == Subscription.lifetime
                                ? Color(0xFFD5F6E2)
                                : Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color:
                                  _model.subscription == Subscription.lifetime
                                      ? Color(0xFF38B078)
                                      : Color(0xFFE9EBE9),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    width: 24.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEDEFED),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Transform.scale(
                                      scaleX: 1.1,
                                      scaleY: 1.1,
                                      child: Visibility(
                                        visible: _model.subscription ==
                                            Subscription.lifetime,
                                        child: Icon(
                                          FFIcons.kcheckCircleFill,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '27n4lo2p' /* Lifetime */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Rethink Sans',
                                              color: Color(0xFF1D231A),
                                              letterSpacing: 0.0,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '96mk87e1' /* US$199.99 */,
                                              ),
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '8a9xbu3z' /*   */,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'qh1p2dbj' /* US$49.99 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    fontFamily: 'Rethink Sans',
                                                    color: Color(0xFF1D231A),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Rethink Sans',
                                                color: Color(0xFFA4A5A4),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 2.0)),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).error,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        9.0, 3.0, 9.0, 3.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'oam2qaa8' /* Save -76% */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.subscription = Subscription.weekly;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 64.0,
                          decoration: BoxDecoration(
                            color: _model.subscription == Subscription.weekly
                                ? Color(0xFFD5F6E2)
                                : Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: _model.subscription == Subscription.weekly
                                  ? Color(0xFF38B078)
                                  : Color(0xFFE9EBE9),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    width: 24.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEDEFED),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Transform.scale(
                                      scaleX: 1.1,
                                      scaleY: 1.1,
                                      child: Visibility(
                                        visible: _model.subscription ==
                                            Subscription.weekly,
                                        child: Icon(
                                          FFIcons.kcheckCircleFill,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'p2f2jy9n' /* 3 days free trial */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Rethink Sans',
                                              color: Color(0xFF1D231A),
                                              letterSpacing: 0.0,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'dw50jo0d' /* then US$9.99/week auto-renewab... */,
                                              ),
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Rethink Sans',
                                                color: Color(0xFF1D231A),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 2.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .around(SizedBox(height: 12.0)),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: FFLocalizations.of(context).getText(
                      'a1sa6tso' /* Continue */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF38B078),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
