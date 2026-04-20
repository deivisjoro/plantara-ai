import '/alert/logout/logout_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/custom_button/custom_button_widget.dart';
import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sheet/appearance/appearance_widget.dart';
import '/sheet/language/language_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'Settings';
  static String routePath = '/settings';

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          title: Text(
            FFLocalizations.of(context).getText(
              '8lb7alnt' /* Settings */,
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
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (loggedIn) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(ProfileWidget.routeName);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Container(
                                            width: 52.0,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFFFF4F5),
                                                  Color(0xFFFFD6D8)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    0) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=krasko.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    1) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=alta1r.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    2) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=anastasiafrost.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    3) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=i_da_nastya.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    4) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=yourawesam.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    5) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=Variant12.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    6) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=mikepedalkin.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    7) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=nastyatoki.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    8) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=prokofiev.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.photoIndex,
                                                        0) ==
                                                    9) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=ssemenov.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/images/Property_1=yourawesam.png',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    currentUserDisplayName,
                                                    'Unknown',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Rethink Sans',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.4,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  currentUserEmail,
                                                  'example@domain.com',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.4,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(
                                            FFIcons.kcaretRight,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(SignupWidget.routeName);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 18.0, 16.0, 18.0),
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x20000000),
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .border1,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                FFIcons.kcloudFill,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 28.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'tu5hjyh8' /* Sign Up */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'fuoxi8bk' /* Sign Up or Log In if you
alrea... */
                                                  ,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.4,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(
                                            FFIcons.kcaretRight,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'otm1nwjq' /* Account */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
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
                                    context.pushNamed(
                                        NotificationWidget.routeName);
                                  },
                                  child: wrapWithModel(
                                    model: _model.customButtonModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CustomButtonWidget(
                                      icon: Icon(
                                        FFIcons.kclock,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      title: 'Notifications',
                                      subtitle: '',
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          FlutterFlowTheme.of(context).barrier,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: LanguageWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: wrapWithModel(
                                    model: _model.customButtonModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CustomButtonWidget(
                                      icon: Icon(
                                        FFIcons.ktranslate,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      title: 'Language',
                                      subtitle: valueOrDefault<String>(
                                        FFAppState().Languages?.name,
                                        'English',
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
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          FlutterFlowTheme.of(context).barrier,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: AppearanceWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: wrapWithModel(
                                    model: _model.customButtonModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CustomButtonWidget(
                                      icon: Icon(
                                        FFIcons.kpalette,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      title: 'Theme',
                                      subtitle: valueOrDefault<String>(
                                        () {
                                          if (FFAppState().ThemeSystem) {
                                            return 'System';
                                          } else if (Theme.of(context)
                                                  .brightness ==
                                              Brightness.dark) {
                                            return 'Dark';
                                          } else {
                                            return 'Light';
                                          }
                                        }(),
                                        'System',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'm8fyzvwu' /* Legal */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
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
                                    context.pushNamed(FaqWidget.routeName);
                                  },
                                  child: wrapWithModel(
                                    model: _model.customButtonModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CustomButtonWidget(
                                      icon: Icon(
                                        FFIcons.kquestion,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      title: 'Help Center',
                                      subtitle: '',
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(TermsWidget.routeName);
                                  },
                                  child: wrapWithModel(
                                    model: _model.customButtonModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CustomButtonWidget(
                                      icon: Icon(
                                        FFIcons.kfileText,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      title: 'Terms & Conditions',
                                      subtitle: '',
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(PrivacyWidget.routeName);
                                  },
                                  child: wrapWithModel(
                                    model: _model.customButtonModel6,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CustomButtonWidget(
                                      icon: Icon(
                                        FFIcons.kshield,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      title: 'Privacy Policy',
                                      subtitle: '',
                                    ),
                                  ),
                                ),
                                if (loggedIn)
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .barrier,
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: LogoutWidget(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: wrapWithModel(
                                        model: _model.customButtonModel7,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CustomButtonWidget(
                                          icon: Icon(
                                            FFIcons.ksignOut,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                          ),
                                          title: 'Log out',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          subtitle: '',
                                        ),
                                      ),
                                    ),
                                  ),
                                SafeArea(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 20.0))
                        .addToStart(SizedBox(height: 12.0))
                        .addToEnd(SizedBox(height: 100.0)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navigationModel,
                updateCallback: () => safeSetState(() {}),
                child: NavigationWidget(
                  page: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
