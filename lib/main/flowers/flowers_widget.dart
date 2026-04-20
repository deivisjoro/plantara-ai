import '/backend/backend.dart';
import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'flowers_model.dart';
export 'flowers_model.dart';

class FlowersWidget extends StatefulWidget {
  const FlowersWidget({super.key});

  static String routeName = 'Flowers';
  static String routePath = '/flowers';

  @override
  State<FlowersWidget> createState() => _FlowersWidgetState();
}

class _FlowersWidgetState extends State<FlowersWidget> {
  late FlowersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlowersModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'k5sh5n34' /* Flores */,
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
                                      'yslz2jl4' /* Buscar plantas, flores, árbole... */,
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
                                'djdkbfiq' /* Explorar por categoría */,
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
                          StreamBuilder<List<CategoryRecord>>(
                            stream: queryCategoryRecord(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('ERROR: ${snapshot.error.toString()}', style: TextStyle(color: Colors.red, fontSize: 12)),
                                );
                              }
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
                              List<CategoryRecord> queryCategoryRecordList =
                                  snapshot.data!;

                              // DEBUG
                              for (var doc in queryCategoryRecordList) {
                                print('DOC: \${doc.reference.id} | column_flowers: \${doc.snapshotData[\'column_flowers\']} | type: \${doc.snapshotData[\'column_flowers\'].runtimeType}');
                              }

                              if (queryCategoryRecordList.isEmpty) {
                                return Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('DEBUG: 0 documentos recibidos', style: TextStyle(color: Colors.red, fontSize: 14)),
                                );
                              }

                              // Show first doc raw data
                              final firstDoc = queryCategoryRecordList.first;
                              print('FIRST DOC RAW: \${firstDoc.snapshotData}');

                              return Container(
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final category0 =
                                                  queryCategoryRecordList
                                                      .where((e) =>
                                                          int.tryParse(e.snapshotData['column_flowers'].toString()) == 0)
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.indexFlowers,
                                                          desc: false)
                                                      .toList();

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    category0.length,
                                                    (category0Index) {
                                                  final category0Item =
                                                      category0[category0Index];
                                                  return InkWell(
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
                                                        CategoryWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'category':
                                                              serializeParam(
                                                            category0Item,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'category':
                                                              category0Item,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: () {
                                                        if (category0Index ==
                                                            0) {
                                                          return 190.0;
                                                        } else if (category0Index ==
                                                            1) {
                                                          return 180.0;
                                                        } else if (category0Index ==
                                                            2) {
                                                          return 230.0;
                                                        } else {
                                                          return 180.0;
                                                        }
                                                      }(),
                                                      height: 96.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          image: Image.network(
                                                            category0Item.image,
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              category0Item
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                }).divide(
                                                    SizedBox(width: 10.0)),
                                              );
                                            },
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final category1 =
                                                  queryCategoryRecordList
                                                      .where((e) =>
                                                          int.tryParse(e.snapshotData['column_flowers'].toString()) == 1)
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.indexFlowers,
                                                          desc: false)
                                                      .toList();

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    category1.length,
                                                    (category1Index) {
                                                  final category1Item =
                                                      category1[category1Index];
                                                  return InkWell(
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
                                                        CategoryWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'category':
                                                              serializeParam(
                                                            category1Item,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'category':
                                                              category1Item,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: () {
                                                        if (category1Index ==
                                                            0) {
                                                          return 170.0;
                                                        } else if (category1Index ==
                                                            1) {
                                                          return 145.0;
                                                        } else if (category1Index ==
                                                            2) {
                                                          return 150.0;
                                                        } else if (category1Index ==
                                                            3) {
                                                          return 150.0;
                                                        } else {
                                                          return 155.0;
                                                        }
                                                      }(),
                                                      height: 96.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          image: Image.network(
                                                            category1Item.image,
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              category1Item
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                }).divide(
                                                    SizedBox(width: 10.0)),
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ]
                                        .addToStart(SizedBox(width: 16.0))
                                        .addToEnd(SizedBox(width: 16.0)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 10.0)),
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
                                'y5oqj9it' /* Flores de moda */,
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
                              child: StreamBuilder<List<PlantsRecord>>(
                                stream: queryPlantsRecord(),
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
                                  List<PlantsRecord> wrapPlantsRecordList =
                                      snapshot.data!;

                                  return Wrap(
                                    spacing: 12.0,
                                    runSpacing: 12.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(
                                        wrapPlantsRecordList.length,
                                        (wrapIndex) {
                                      final wrapPlantsRecord =
                                          wrapPlantsRecordList[wrapIndex];
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
                                                wrapPlantsRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'plant': wrapPlantsRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: valueOrDefault<double>(
                                            (MediaQuery.sizeOf(context).width -
                                                    44) /
                                                2,
                                            173.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: Image.network(
                                                      wrapPlantsRecord
                                                          .images.firstOrNull!,
                                                      width: double.infinity,
                                                      height: valueOrDefault<
                                                          double>(
                                                        (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width -
                                                                92) /
                                                            2,
                                                        149.0,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Text(
                                                    wrapPlantsRecord.name,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Rethink Sans',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    wrapPlantsRecord
                                                        .description,
                                                    maxLines: 2,
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
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
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
                  page: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
