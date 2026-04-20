import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'avatar_model.dart';
export 'avatar_model.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({super.key});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  late AvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarModel());
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'nb7ib54t' /* Change Avatar */,
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
            AuthUserStreamWidget(
              builder: (context) => Container(
                width: double.infinity,
                height: 152.0,
                child: CarouselSlider(
                  items: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 0)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          0))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=krasko.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 1)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          1))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=alta1r.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 2)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          2))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=anastasiafrost.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 3)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          3))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=i_da_nastya.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 4)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          4))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=yourawesam.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 5)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          5))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=Variant12.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 6)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          6))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=mikepedalkin.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 7)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          7))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=nastyatoki.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 8)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          8))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=prokofiev.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: (_model.carousel != null
                                      ? (_model.carousel == 9)
                                      : (valueOrDefault(
                                              currentUserDocument?.photoIndex,
                                              0) ==
                                          9))
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Property_1=ssemenov.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  carouselController: _model.carouselController ??=
                      CarouselSliderController(),
                  options: CarouselOptions(
                    initialPage: max(
                        0,
                        min(
                            valueOrDefault<int>(
                              valueOrDefault(
                                  currentUserDocument?.photoIndex, 0),
                              0,
                            ),
                            9)),
                    viewportFraction: 0.25,
                    disableCenter: false,
                    enlargeCenterPage: false,
                    enlargeFactor: 0.0,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                    onPageChanged: (index, _) async {
                      _model.carouselCurrentIndex = index;
                      _model.carousel = _model.carouselCurrentIndex;
                      safeSetState(() {});
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await currentUserReference!.update(createUsersRecordData(
                    photoIndex: _model.carouselCurrentIndex,
                  ));
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  'vaa19r31' /* Save */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 52.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Rethink Sans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
