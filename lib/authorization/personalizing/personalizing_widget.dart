import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'personalizing_model.dart';
export 'personalizing_model.dart';

class PersonalizingWidget extends StatefulWidget {
  const PersonalizingWidget({super.key});

  static String routeName = 'Personalizing';
  static String routePath = '/personalizing';

  @override
  State<PersonalizingWidget> createState() => _PersonalizingWidgetState();
}

class _PersonalizingWidgetState extends State<PersonalizingWidget>
    with TickerProviderStateMixin {
  late PersonalizingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalizingModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 3000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 5000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 7000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 9000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
        body: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 56.0, 0.0, 0.0),
                              child: PageView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _model.pageViewController ??=
                                    PageController(initialPage: 0),
                                onPageChanged: (_) async {
                                  _model.update = !_model.update;
                                  _model.ready = false;
                                  safeSetState(() {});
                                  if (_model.pageViewCurrentIndex == 4) {
                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 9500,
                                      ),
                                    );
                                    _model.ready = true;
                                    safeSetState(() {});
                                  }
                                },
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'p2g6k5k6' /* ¡Mantén sanas tus plantas! */,
                                                ),
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Rethink Sans',
                                                  fontSize: 28.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'deelemsc' /* Te brindamos el conocimiento n... */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Rethink Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 48.0, 16.0, 48.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/7e65e70a9e76273e456e48373cd740b3.png',
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 24.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 32.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '09l6lcin' /* ¿Cuántas plantas tienes? */,
                                                ),
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Rethink Sans',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Transform.scale(
                                        scaleX: 1.1,
                                        scaleY: 1.1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/happy-woman-watering-indoor-house-plant-growing-pot-girl-caring-about-room-houseplants-home-person-interior-green-leaf-decor-flat-vector-illustration-isolated-white-background_633472-1314.png',
                                              height: 250.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.plants = 0;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '3tt813ri' /* Todavía no tengo una planta. */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.plants == 0
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.plants == 0
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.plants = 1;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'aqphvo8k' /* 1 - 10 */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.plants == 1
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.plants == 1
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.plants = 2;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '7g4qx9c2' /* Más de 10 */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.plants == 2
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.plants == 2
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 32.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'iiaizcw0' /* ¿Cuánta experiencia tienes con... */,
                                                ),
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Rethink Sans',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Transform.scale(
                                        scaleX: 1.3,
                                        scaleY: 1.3,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/a-man-watering-young-green-plants-in-a-garden-using-a-watering-can-in-a-flat-illustration-vector.png',
                                              height: 250.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.experience = 0;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'xagls4p4' /* Principiante */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.experience == 0
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.experience == 0
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.experience = 1;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '2qf8pivi' /* Algo de experiencia */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.experience == 1
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.experience == 1
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.experience = 2;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'ssv6lvnl' /* Muy experimentado */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.experience == 2
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.experience == 2
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 32.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'o7dj8bzc' /* ¿Cuánto tiempo le dedicas a tu... */,
                                                ),
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Rethink Sans',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Transform.scale(
                                        scaleX: 1.2,
                                        scaleY: 1.2,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/illustration-of-gardener-watering-flowers-illustration-vector.png',
                                              height: 250.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.many = 0;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '1mji86ep' /* Un poco */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.many == 0
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.many == 0
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.many = 1;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'qe89cfl0' /* Unas pocas horas a la semana */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.many == 1
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.many == 1
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.many = 2;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'hbeoo3s8' /* Todo el tiempo */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.many == 2
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .successBack
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.5,
                                                borderSide: BorderSide(
                                                  color: _model.many == 2
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent0,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 12.0, 20.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'qq4lxowq' /* ¡Grandes noticias! */,
                                                ),
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Rethink Sans',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'grheermk' /* Jardines comunes para ti */,
                                                ),
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Rethink Sans',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 32.0, 0.0, 16.0),
                                          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                            child: custom_widgets
                                                .CircularProgressCustom(
                                              width: 150.0,
                                              height: 150.0,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              strokeWidth: 10.0,
                                              fontSize: 25.0,
                                              fontWeight: 600.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/Pngtreegreen_leaves_vector_icon_design_5224035_(1).png',
                                                        width: 24.0,
                                                        height: 24.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'vnvl91jy' /* Sincronizando tu perfil de pla... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Rethink Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ).animateOnPageLoad(animationsMap[
                                                    'rowOnPageLoadAnimation1']!),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/Pngtreegreen_leaves_vector_icon_design_5224035_(1).png',
                                                        width: 24.0,
                                                        height: 24.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'c6to5zcm' /* Configurando tus preferencias ... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Rethink Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ).animateOnPageLoad(animationsMap[
                                                    'rowOnPageLoadAnimation2']!),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/Pngtreegreen_leaves_vector_icon_design_5224035_(1).png',
                                                        width: 24.0,
                                                        height: 24.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rxwkw1xg' /* Finalizando tu experiencia per... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Rethink Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ).animateOnPageLoad(animationsMap[
                                                    'rowOnPageLoadAnimation3']!),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/Pngtreegreen_leaves_vector_icon_design_5224035_(1).png',
                                                        width: 24.0,
                                                        height: 24.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'p4sec5lf' /* ¡Todo listo! Ya puedes explora... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Rethink Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ).animateOnPageLoad(animationsMap[
                                                    'rowOnPageLoadAnimation4']!),
                                              ].divide(SizedBox(height: 28.0)),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 8.0))
                                          .addToStart(SizedBox(height: 32.0))
                                          .addToEnd(SizedBox(height: 20.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  count: 5,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    safeSetState(() {});
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 1.001,
                                    spacing: 4.5,
                                    radius: 3.0,
                                    dotWidth:
                                        (MediaQuery.sizeOf(context).width -
                                                64) /
                                            5,
                                    dotHeight: 3.0,
                                    dotColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    activeDotColor: Color(0xFFFE1B72),
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        height: 56.0,
                        child: Stack(
                          children: [
                            AnimatedOpacity(
                              opacity: (_model.pageViewCurrentIndex == 4) &&
                                      _model.ready
                                  ? 1.0
                                  : 0.0,
                              duration: 300.0.ms,
                              curve: Curves.easeInOut,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.pageViewCurrentIndex == 4) {
                                    context.pushNamed(SignupWidget.routeName);
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'kxwry3kq' /* Empecemos */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFFE1B72),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Rethink Sans',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                            if (_model.pageViewCurrentIndex != 4)
                              AnimatedOpacity(
                                opacity: _model.pageViewCurrentIndex != 4
                                    ? 1.0
                                    : 0.0,
                                duration: 300.0.ms,
                                curve: Curves.easeInOut,
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await _model.pageViewController
                                          ?.animateToPage(
                                        4,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '5ag74x3l' /* Saltar */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 120.0,
                                      height: double.infinity,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ),
                            if (_model.pageViewCurrentIndex != 4)
                              AnimatedOpacity(
                                opacity: _model.pageViewCurrentIndex != 4
                                    ? 1.0
                                    : 0.0,
                                duration: 300.0.ms,
                                curve: Curves.easeInOut,
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if ((_model.pageViewCurrentIndex == 0) ||
                                          ((_model.pageViewCurrentIndex == 1) &&
                                              (_model.plants != -1)) ||
                                          ((_model.pageViewCurrentIndex == 2) &&
                                              (_model.experience != -1)) ||
                                          ((_model.pageViewCurrentIndex == 3) &&
                                              (_model.many != -1))) {
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      }
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '0sqyqcwf' /* Siguiente */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 120.0,
                                      height: double.infinity,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        (_model.pageViewCurrentIndex == 0) ||
                                                ((_model.pageViewCurrentIndex ==
                                                        1) &&
                                                    (_model.plants != -1)) ||
                                                ((_model.pageViewCurrentIndex ==
                                                        2) &&
                                                    (_model.experience !=
                                                        -1)) ||
                                                ((_model.pageViewCurrentIndex ==
                                                        3) &&
                                                    (_model.many != -1))
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .accent2,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            color: valueOrDefault<Color>(
                                              (_model.pageViewCurrentIndex ==
                                                          0) ||
                                                      ((_model.pageViewCurrentIndex ==
                                                              1) &&
                                                          (_model.plants !=
                                                              -1)) ||
                                                      ((_model.pageViewCurrentIndex ==
                                                              2) &&
                                                          (_model.experience !=
                                                              -1)) ||
                                                      ((_model.pageViewCurrentIndex ==
                                                              3) &&
                                                          (_model.many != -1))
                                                  ? FlutterFlowTheme.of(context)
                                                      .info
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              FlutterFlowTheme.of(context).info,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
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
