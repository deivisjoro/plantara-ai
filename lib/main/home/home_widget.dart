import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/navigation/navigation_widget.dart';
import '/components/tools/tools_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/home.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (FFAppState().isFromSetup) {
        safeSetState(
            () => _model.homeController = createPageWalkthrough(context));
        _model.homeController?.show(context: context);
      }
      _model.weather = await WeaterCall.call(
        lat: functions.latLon(true, currentUserLocationValue!),
        lon: functions.latLon(false, currentUserLocationValue!),
      );

      if ((_model.weather?.succeeded ?? true)) {
        FFAppState().updateLocationWeatherStruct(
          (e) => e
            ..city = getJsonField(
              (_model.weather?.jsonBody ?? ''),
              r'''$.name''',
            ).toString()
            ..current = getJsonField(
              (_model.weather?.jsonBody ?? ''),
              r'''$.main.temp''',
            ).round()
            ..min = getJsonField(
              (_model.weather?.jsonBody ?? ''),
              r'''$.main.temp_min''',
            ).round()
            ..max = getJsonField(
              (_model.weather?.jsonBody ?? ''),
              r'''$.main.temp_max''',
            ).round(),
        );
        FFAppState().update(() {});
      }
    });
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    FFIcons.kmapPinFill,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 22.0,
                  ),
                  Text(
                    FFAppState().LocationWeather.city,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Rethink Sans',
                          letterSpacing: 0.0,
                          lineHeight: 1.5,
                        ),
                  ),
                ].divide(SizedBox(width: 4.0)),
              ).addWalkthrough(
                row4bg4jghg,
                _model.homeController,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFAppState().LocationWeather.current.toString(),
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'astran9p' /* °C */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'zjlvthb2' /*  ( */,
                          ),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: FFAppState().LocationWeather.min.toString(),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            't0z3z2pl' /* °C •  */,
                          ),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: FFAppState().LocationWeather.max.toString(),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'yjvasp4c' /* °C) */,
                          ),
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Rethink Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                  Icon(
                    FFIcons.kcloudFogFill,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 22.0,
                  ),
                ].divide(SizedBox(width: 4.0)),
              ).addWalkthrough(
                rowVcgrh1hi,
                _model.homeController,
              ),
            ],
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
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(SearchWidget.routeName);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kmagnifyingGlass,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 22.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'b332ohfi' /* Buscar plantas, flores, árbole... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ).addWalkthrough(
                          container3xgsmbh7,
                          _model.homeController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(SubscriptionWidget.routeName);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              width: double.infinity,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  image: Image.asset(
                                    'assets/images/premium.webp',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '0v7t8yb9' /* Premium gratuito disponible */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7rdxabfe' /* Toca para reclamar */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ).addWalkthrough(
                          containerQ20ls7ge,
                          _model.homeController,
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
                                '5e3nh9i8' /* Herramientas de planta */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Wrap(
                                spacing: 12.0,
                                runSpacing: 12.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        CameraWidget.routeName,
                                        queryParameters: {
                                          'initialValue': serializeParam(
                                            PlantType.plant,
                                            ParamType.Enum,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.toolsModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToolsWidget(
                                        icon: Icon(
                                          FFIcons.kplantFill,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 32.0,
                                        ),
                                        title: 'Plantas',
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width -
                                                  44) /
                                              2,
                                          173.0,
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
                                      context.pushNamed(
                                        CameraWidget.routeName,
                                        queryParameters: {
                                          'initialValue': serializeParam(
                                            PlantType.disease,
                                            ParamType.Enum,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.toolsModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToolsWidget(
                                        icon: Icon(
                                          FFIcons.kheartFill,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 32.0,
                                        ),
                                        title: 'Enfermedades',
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width -
                                                  44) /
                                              2,
                                          173.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    wrapWithModel(
                                      model: _model.toolsModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToolsWidget(
                                        icon: Icon(
                                          FFIcons.ksunFill,
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          size: 32.0,
                                        ),
                                        title: 'Medidor de luz',
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width -
                                                  44) /
                                              2,
                                          173.0,
                                        ),
                                      ),
                                    ),
                                  if (false)
                                    wrapWithModel(
                                      model: _model.toolsModel4,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToolsWidget(
                                        icon: Icon(
                                          FFIcons.kdropFill,
                                          color: FlutterFlowTheme.of(context)
                                              .infoBlue,
                                          size: 32.0,
                                        ),
                                        title: 'Medidor de agua',
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width -
                                                  44) /
                                              2,
                                          173.0,
                                        ),
                                      ),
                                    ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        CameraWidget.routeName,
                                        queryParameters: {
                                          'initialValue': serializeParam(
                                            PlantType.toxicity,
                                            ParamType.Enum,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.toolsModel5,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToolsWidget(
                                        icon: Icon(
                                          FFIcons.kbiohazard,
                                          color: Color(0xFF18DF9B),
                                          size: 32.0,
                                        ),
                                        title: 'Toxicidad',
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width -
                                                  44) /
                                              2,
                                          173.0,
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
                                      context.pushNamed(
                                        CameraWidget.routeName,
                                        queryParameters: {
                                          'initialValue': serializeParam(
                                            PlantType.mushroom,
                                            ParamType.Enum,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.toolsModel6,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToolsWidget(
                                        icon: Icon(
                                          FFIcons.kacornFill,
                                          color: Color(0xFFAD9279),
                                          size: 32.0,
                                        ),
                                        title: 'Hongos',
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width -
                                                  44) /
                                              2,
                                          173.0,
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
                                      context.pushNamed(
                                        CameraWidget.routeName,
                                        queryParameters: {
                                          'initialValue': serializeParam(
                                            PlantType.weed,
                                            ParamType.Enum,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.toolsModel7,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToolsWidget(
                                        icon: Icon(
                                          FFIcons.kleafFill,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 32.0,
                                        ),
                                        title: 'Malezas',
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width -
                                                  44) /
                                              2,
                                          173.0,
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
                                      context.pushNamed(
                                        CameraWidget.routeName,
                                        queryParameters: {
                                          'initialValue': serializeParam(
                                            PlantType.tree,
                                            ParamType.Enum,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.toolsModel8,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToolsWidget(
                                        icon: Icon(
                                          FFIcons.ktreeEvergreenFill,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 32.0,
                                        ),
                                        title: 'Árboles',
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width -
                                                  44) /
                                              2,
                                          173.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ).addWalkthrough(
                          column5idsvq21,
                          _model.homeController,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'x41mqw5h' /* Flowers */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Rethink Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.goNamed(
                                      FlowersWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'qg00tdyy' /* See all */,
                                          ),
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Rethink Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<List<PlantsRecord>>(
                            stream: queryPlantsRecord(
                              limit: 3,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 24.0,
                                    height: 24.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 24.0,
                                    ),
                                  ),
                                );
                              }
                              List<PlantsRecord> rowPlantsRecordList =
                                  snapshot.data!;

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(rowPlantsRecordList.length,
                                              (rowIndex) {
                                    final rowPlantsRecord =
                                        rowPlantsRecordList[rowIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          FlowerWidget.routeName,
                                          queryParameters: {
                                            'plant': serializeParam(
                                              rowPlantsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'plant': rowPlantsRecord,
                                          },
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Container(
                                          width: 120.0,
                                          height: 160.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              image: Image.network(
                                                rowPlantsRecord
                                                    .images.firstOrNull!,
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0x33000000),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .barrier,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  2.0,
                                                                  8.0,
                                                                  2.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ronv5tsm' /* Trending */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rethink Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Text(
                                                      rowPlantsRecord.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Rethink Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
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
                                  })
                                          .divide(SizedBox(width: 12.0))
                                          .addToStart(SizedBox(width: 16.0))
                                          .addToEnd(SizedBox(width: 16.0)),
                                ),
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 12.0)),
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
                                '5daohg2p' /* Browse by Category */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: StreamBuilder<List<CategoryRecord>>(
                                stream: queryCategoryRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          size: 24.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CategoryRecord> queryCategoryRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final category = queryCategoryRecordList
                                            .sortedList(
                                                keyOf: (e) => e.indexHome,
                                                desc: false)
                                            .toList();

                                        return Wrap(
                                          spacing: 12.0,
                                          runSpacing: 12.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: List.generate(
                                              category.length, (categoryIndex) {
                                            final categoryItem =
                                                category[categoryIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  CategoryWidget.routeName,
                                                  queryParameters: {
                                                    'category': serializeParam(
                                                      categoryItem,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'category': categoryItem,
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: valueOrDefault<double>(
                                                  (double width, int index) {
                                                    return index == 8
                                                        ? width - 32
                                                        : (width - 44) / 2;
                                                  }(
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                      categoryItem.indexHome),
                                                  173.0,
                                                ),
                                                height: 96.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    image: Image.network(
                                                      categoryItem.image,
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        categoryItem.name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rethink Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'mqw2m0yy' /* Suggestions */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Rethink Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          StreamBuilder<List<SuggestionsRecord>>(
                            stream: querySuggestionsRecord(
                              limit: 10,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 24.0,
                                    height: 24.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 24.0,
                                    ),
                                  ),
                                );
                              }
                              List<SuggestionsRecord>
                                  querySuggestionsRecordList = snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final suggestions =
                                        querySuggestionsRecordList
                                            .sortedList(
                                                keyOf: (e) => e.created!,
                                                desc: true)
                                            .toList()
                                            .take(10)
                                            .toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: suggestions.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 12.0),
                                      itemBuilder: (context, suggestionsIndex) {
                                        final suggestionsItem =
                                            suggestions[suggestionsIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                SuggestionWidget.routeName,
                                                queryParameters: {
                                                  'suggestion': serializeParam(
                                                    suggestionsItem,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'suggestion': suggestionsItem,
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 140.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            suggestionsItem
                                                                .type,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rethink Sans',
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            suggestionsItem
                                                                .title,
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rethink Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '111r91qk' /* Go to learn */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Rethink Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            lineHeight:
                                                                                1.4,
                                                                          ),
                                                                    ),
                                                                    Icon(
                                                                      FFIcons
                                                                          .kcaretRightBold,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                16.0, 16.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.network(
                                                        suggestionsItem.image,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
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
                  page: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.homeController = null);
          FFAppState().isFromSetup = false;
          safeSetState(() {});
        },
        onSkip: () {
          return true;
        },
      );
}
