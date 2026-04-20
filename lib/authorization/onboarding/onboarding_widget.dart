import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  static String routeName = 'Onboarding';
  static String routePath = '/onboarding';

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              FFAppState().gradient < 1.0
                  ? Color.lerp(
                      FlutterFlowTheme.of(context).yellowBack,
                      FlutterFlowTheme.of(context).primaryBackground,
                      FFAppState().gradient)!
                  : FFAppState().gradient < 2.0
                      ? Color.lerp(
                          FlutterFlowTheme.of(context).primaryBackground,
                          FlutterFlowTheme.of(context).greenBack,
                          FFAppState().gradient - 1.0)!
                      : FlutterFlowTheme.of(context).greenBack,
              FlutterFlowTheme.of(context).greenBack,
            ),
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
                            PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              onPageChanged: (_) async {
                                FFAppState().gradient =
                                    _model.pageViewCurrentIndex.toDouble();
                                FFAppState().update(() {});
                                _model.update = !_model.update;
                                safeSetState(() {});
                              },
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 32.0, 24.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/1_imgupscaler.ai_V2(Pro)_2K_(1).png',
                                          width: double.infinity,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 32.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'fu3cblqm' /* Plantas saludables */,
                                              ),
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Rethink Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.3,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
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
                                              'zum4ipbu' /* Una vida mas saludable */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Rethink Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Rethink Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.3,
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '5pd59saw' /* Aire más limpio. Menos estrés.... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.scale(
                                      scaleX: 1.1,
                                      scaleY: 1.1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 32.0, 12.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/2_imgupscaler.ai_V2(Pro)_2K_(1).png',
                                            width: double.infinity,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 32.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'biz7hp3z' /* Pero las plantas pueden  */,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '574fmgjf' /* enfermarse */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Rethink Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '93csh1ns' /*  o  */,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '7qupltdt' /* morir  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Rethink Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'qz6sqcjc' /*  sin   */,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'q7jsp5qv' /* advertencia */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Rethink Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Rethink Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.3,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'qtk2duq9' /* No dejes que las hojas amarill... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            letterSpacing: 0.0,
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
                                          32.0, 0.0, 32.0, 12.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/3_imgupscaler.ai_V2(Pro)_2K_(1).png',
                                          width: double.infinity,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 32.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'qs7l9xbb' /* Te ayudaremos a 
 */
                                                ,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'mqbugj4u' /* Identificar, diagnosticar,  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Rethink Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'jq06s0n2' /* y cuidar  */,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'f04wayvp' /* como un profesional */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Rethink Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Rethink Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.3,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'v8w2rzov' /* Escanea tu primera planta ahor... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 36.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  count: 3,
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
                                    spacing: 8.0,
                                    radius: 8.0,
                                    dotWidth: 8.0,
                                    dotHeight: 8.0,
                                    dotColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    activeDotColor:
                                        FlutterFlowTheme.of(context).primary,
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
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 56.0,
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              if (false)
                                AnimatedOpacity(
                                  opacity: _model.pageViewCurrentIndex == 2
                                      ? 1.0
                                      : 0.0,
                                  duration: 300.0.ms,
                                  curve: Curves.easeInOut,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.pageViewCurrentIndex == 2) {
                                          context.pushNamed(
                                              PersonalizingWidget.routeName);
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'mx5iofpn' /* Get Started */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: double.infinity,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Rethink Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ),
                              AnimatedOpacity(
                                opacity: _model.pageViewCurrentIndex == 2
                                    ? 1.0
                                    : 0.0,
                                duration: 300.0.ms,
                                curve: Curves.easeInOut,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width - 32,
                                    height: 56.0,
                                    child: custom_widgets.SwipeButton(
                                      width:
                                          MediaQuery.sizeOf(context).width - 32,
                                      height: 56.0,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      text: 'Comience',
                                      textColor:
                                          FlutterFlowTheme.of(context).info,
                                      fontSize: 16.0,
                                      fontWeight: 500.0,
                                      borderRadius: 50.0,
                                      action: () async {
                                        if (_model.pageViewCurrentIndex == 2) {
                                          context.goNamed(
                                              PersonalizingWidget.routeName);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              if (_model.pageViewCurrentIndex != 2)
                                AnimatedOpacity(
                                  opacity: _model.pageViewCurrentIndex != 2
                                      ? 1.0
                                      : 0.0,
                                  duration: 300.0.ms,
                                  curve: Curves.easeInOut,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 50.0,
                                      borderWidth: 1.5,
                                      buttonSize: 56.0,
                                      icon: Icon(
                                        FFIcons.karrowRight,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _model.pageViewCurrentIndex == 2 ? 1.0 : 0.0,
                          duration: 300.0.ms,
                          curve: Curves.easeInOut,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '0idiuq9l' /* ¿Ya tienes una cuenta?  */,
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'u02j4nhh' /* Iniciar sesión */,
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      decoration: TextDecoration.underline,
                                    ),
                                    mouseCursor: SystemMouseCursors.click,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        if (_model.pageViewCurrentIndex == 2) {
                                          context.pushNamed(
                                              SigninWidget.routeName);
                                        }
                                      },
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rethink Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.5,
                                    ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 24.0))
                          .around(SizedBox(height: 24.0)),
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
