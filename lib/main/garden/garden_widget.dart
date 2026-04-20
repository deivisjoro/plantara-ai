import '/alert/delete_plants/delete_plants_widget.dart';
import '/alert/delete_snap/delete_snap_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation/navigation_widget.dart';
import '/empty/empty_garden/empty_garden_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sheet/snap_history/snap_history_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'garden_model.dart';
export 'garden_model.dart';

class GardenWidget extends StatefulWidget {
  const GardenWidget({super.key});

  static String routeName = 'Garden';
  static String routePath = '/garden';

  @override
  State<GardenWidget> createState() => _GardenWidgetState();
}

class _GardenWidgetState extends State<GardenWidget> {
  late GardenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GardenModel());
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
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
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 56.0,
                      child: custom_widgets.BinarySegmentedControlWidget(
                        width: double.infinity,
                        height: 56.0,
                        text1: 'My Garden',
                        text2: 'Snap History',
                        inactiveBorderColor:
                            FlutterFlowTheme.of(context).accent2,
                        activeBorderColor:
                            FlutterFlowTheme.of(context).primaryText,
                        inactiveColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        activeColor: FlutterFlowTheme.of(context).primaryText,
                        segmentPadding: 0.0,
                        fontSize: 16.0,
                        fontWeight: 600.0,
                        action1: () async {
                          FFAppState().Segment = 1;
                          safeSetState(() {});
                        },
                        action2: () async {
                          FFAppState().Segment = 2;
                          safeSetState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (FFAppState().Segment == 1) {
                            return Builder(
                              builder: (context) {
                                if (((currentUserDocument?.myPlants.toList() ??
                                            [])
                                        .isNotEmpty) ||
                                    ((currentUserDocument?.mySnaps.toList() ??
                                            [])
                                        .isNotEmpty)) {
                                  return SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '60d7kzcs' /* Todas mis plantas */,
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
                                        Builder(
                                          builder: (context) {
                                            final myPlants =
                                                (currentUserDocument?.myPlants
                                                            .toList() ??
                                                        [])
                                                    .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: myPlants.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 12.0),
                                              itemBuilder:
                                                  (context, myPlantsIndex) {
                                                final myPlantsItem =
                                                    myPlants[myPlantsIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          PlantsRecord>(
                                                        stream: PlantsRecord
                                                            .getDocument(
                                                                myPlantsItem),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final containerPlantsRecord =
                                                              snapshot.data!;

                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            height: 64.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        FlowerWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'plant':
                                                                              serializeParam(
                                                                            containerPlantsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'plant':
                                                                              containerPlantsRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                            child:
                                                                                Image.network(
                                                                              containerPlantsRecord.images.firstOrNull!,
                                                                              width: 64.0,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  containerPlantsRecord.name,
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: 'Rethink Sans',
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.5,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  containerPlantsRecord.description,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Rethink Sans',
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.4,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 3.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showDialog(
                                                                        barrierColor:
                                                                            FlutterFlowTheme.of(context).barrier,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: DeletePlantsWidget(
                                                                                isSnap: false,
                                                                                plants: containerPlantsRecord.reference,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );

                                                                      _model.update =
                                                                          !_model
                                                                              .update;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .ktrash,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: 1.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border1,
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final mySnaps = (currentUserDocument
                                                        ?.mySnaps
                                                        .toList() ??
                                                    [])
                                                .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: mySnaps.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 12.0),
                                              itemBuilder:
                                                  (context, mySnapsIndex) {
                                                final mySnapsItem =
                                                    mySnaps[mySnapsIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 64.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    SnapsWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'plant':
                                                                          serializeParam(
                                                                        mySnapsItem,
                                                                        ParamType
                                                                            .DataStruct,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                        child: Image
                                                                            .network(
                                                                          mySnapsItem
                                                                              .images
                                                                              .firstOrNull!,
                                                                          width:
                                                                              64.0,
                                                                          height:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              mySnapsItem.name,
                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                    fontFamily: 'Rethink Sans',
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              mySnapsItem.description,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Rethink Sans',
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.4,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 3.0)),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await showDialog(
                                                                    barrierColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .barrier,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              DeletePlantsWidget(
                                                                            isSnap:
                                                                                true,
                                                                            snaps:
                                                                                mySnapsItem,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.update =
                                                                      !_model
                                                                          .update;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  FFIcons
                                                                      .ktrash,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: 1.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border1,
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ]
                                          .divide(SizedBox(height: 12.0))
                                          .addToStart(SizedBox(height: 12.0))
                                          .addToEnd(SizedBox(height: 100.0)),
                                    ),
                                  );
                                } else {
                                  return wrapWithModel(
                                    model: _model.emptyGardenModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: EmptyGardenWidget(),
                                  );
                                }
                              },
                            );
                          } else {
                            return SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '3w4cit9r' /* Snaps */,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .barrier,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SnapHistoryWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 18.0, 16.0, 18.0),
                                              child: Container(
                                                width: 56.0,
                                                height: 56.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .border1,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(6.0),
                                                      child: Icon(
                                                        FFIcons.kinfo,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 18.0,
                                                      ),
                                                    ),
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
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: (currentUserDocument
                                                                      ?.snaps
                                                                      .toList() ??
                                                                  [])
                                                              .length
                                                              .toString(),
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'cdubdevm' /*  Identification is expiring */,
                                                          ),
                                                          style: TextStyle(),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Rethink Sans',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'tf5mhen7' /* Tap to keep history */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final snaps = (currentUserDocument
                                                    ?.snaps
                                                    .toList() ??
                                                [])
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: snaps.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder: (context, snapsIndex) {
                                            final snapsItem = snaps[snapsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border2,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            SnapsWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'plant':
                                                                  serializeParam(
                                                                snapsItem,
                                                                ParamType
                                                                    .DataStruct,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 64.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    child: Image
                                                                        .network(
                                                                      snapsItem
                                                                          .images
                                                                          .firstOrNull!,
                                                                      width:
                                                                          64.0,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          snapsItem
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Rethink Sans',
                                                                                letterSpacing: 0.0,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          snapsItem
                                                                              .description,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Rethink Sans',
                                                                                letterSpacing: 0.0,
                                                                                lineHeight: 1.4,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 3.0)),
                                                                    ),
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          barrierColor:
                                                                              FlutterFlowTheme.of(context).barrier,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: DeleteSnapWidget(
                                                                                  snaps: snapsItem,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        _model.update =
                                                                            !_model.update;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .ktrash,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 1.0,
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .border2,
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    16.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    16.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                dateTimeFormat(
                                                                  "MMMM d, yyyy",
                                                                  snapsItem
                                                                      .created!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Rethink Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              if (false)
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await PlantsRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set({
                                                                      ...createPlantsRecordData(
                                                                        name: snapsItem
                                                                            .name,
                                                                        category:
                                                                            functions.flowersPlantingReference(),
                                                                        description:
                                                                            snapsItem.description,
                                                                        overview:
                                                                            snapsItem.overview,
                                                                        temperature:
                                                                            updateTemperatureStruct(
                                                                          snapsItem
                                                                              .temperature,
                                                                          clearUnsetFields:
                                                                              false,
                                                                          create:
                                                                              true,
                                                                        ),
                                                                        hardiness:
                                                                            updateTemperatureStruct(
                                                                          snapsItem
                                                                              .hardiness,
                                                                          clearUnsetFields:
                                                                              false,
                                                                          create:
                                                                              true,
                                                                        ),
                                                                        sunlight:
                                                                            snapsItem.sunlight,
                                                                        soil: snapsItem
                                                                            .soil,
                                                                        location:
                                                                            snapsItem.location,
                                                                      ),
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'labels':
                                                                              snapsItem.labels,
                                                                          'requires':
                                                                              getRequiresListFirestoreData(
                                                                            snapsItem.requires,
                                                                          ),
                                                                          'images':
                                                                              snapsItem.images,
                                                                          'scientific':
                                                                              getScientificListFirestoreData(
                                                                            snapsItem.scientific,
                                                                          ),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'rc90n2i2' /* Create Flowers */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        30.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .successBack,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Rethink Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).success,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                ),
                                                              if (!(currentUserDocument
                                                                          ?.mySnaps
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(
                                                                      snapsItem))
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'my_snaps':
                                                                              FieldValue.arrayUnion([
                                                                            getPlantInformationFirestoreData(
                                                                              updatePlantInformationStruct(
                                                                                snapsItem,
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                              true,
                                                                            )
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0gkwxu8g' /* Add */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        30.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .successBack,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Rethink Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).success,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 12.0))
                                    .addToStart(SizedBox(height: 12.0))
                                    .addToEnd(SizedBox(height: 100.0)),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navigationModel,
                updateCallback: () => safeSetState(() {}),
                child: NavigationWidget(
                  page: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
