import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/loader/loader_widget.dart';
import '/components/snack/snack_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sheet/avatar/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    _model.nameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nameFocusNode ??= FocusNode();

    _model.emailTextController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailFocusNode ??= FocusNode();
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
              '697xipby' /* Profile */,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: FlutterFlowTheme.of(context).barrier,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: AvatarWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFF4F5),
                                    Color(0xFFFFD6D8)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      0) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=krasko.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      1) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=alta1r.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      2) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=anastasiafrost.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      3) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=i_da_nastya.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      4) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=yourawesam.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      5) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=Variant12.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      6) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=mikepedalkin.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      7) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=nastyatoki.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      8) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.asset(
                                        'assets/images/Property_1=prokofiev.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (valueOrDefault(
                                          currentUserDocument?.photoIndex, 0) ==
                                      9) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
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
                                          BorderRadius.circular(100.0),
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
                            Text(
                              FFLocalizations.of(context).getText(
                                'b1nxa67f' /* CHANGE PICTURE */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'cndi28k2' /* Full Name */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rethink Sans',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Container(
                              height: 54.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.nameTextController,
                                    focusNode: _model.nameFocusNode,
                                    autofocus: false,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'hvpoghoe' /* Enter Name */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      contentPadding: EdgeInsets.all(16.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.name,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model
                                        .nameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'pi6nfdsx' /* Email */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rethink Sans',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Container(
                              height: 54.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.emailTextController,
                                  focusNode: _model.emailFocusNode,
                                  autofocus: false,
                                  enabled: true,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '2r6inoki' /* Enter Email */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    contentPadding: EdgeInsets.all(16.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Rethink Sans',
                                        letterSpacing: 0.0,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model.emailTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ]
                        .divide(SizedBox(height: 20.0))
                        .addToStart(SizedBox(height: 12.0))
                        .addToEnd(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Builder(
                  builder: (context) => Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        showDialog(
                          barrierColor:
                              FlutterFlowTheme.of(context).barrierShade,
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(dialogContext).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: LoaderWidget(),
                              ),
                            );
                          },
                        );

                        await currentUserReference!
                            .update(createUsersRecordData(
                          displayName: _model.nameTextController.text,
                        ));
                        Navigator.pop(context);
                        await showDialog(
                          barrierColor: FlutterFlowTheme.of(context).tertiary,
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 1.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(dialogContext).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: SnackWidget(
                                  status: Status.success,
                                  text: 'Successfully updated!',
                                  hasNavigation: false,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'cmjjxui9' /* Save */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
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
            ),
          ],
        ),
      ),
    );
  }
}
