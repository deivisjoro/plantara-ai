import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:text_search/text_search.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  static String routeName = 'Search';
  static String routePath = '/search';

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: AlignmentDirectional(1.0, 0.0),
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
            title: Container(
              height: 48.0,
              decoration: BoxDecoration(),
              child: Container(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 1),
                    () async {
                      await queryPlantsRecordOnce()
                          .then(
                            (records) => _model.simpleSearchResults =
                                TextSearch(
                              records
                                  .map(
                                    (record) => TextSearchItem.fromTerms(
                                        record, [record.name]),
                                  )
                                  .toList(),
                            )
                                    .search(_model.textController.text)
                                    .map((r) => r.object)
                                    .toList(),
                          )
                          .onError((_, __) => _model.simpleSearchResults = [])
                          .whenComplete(() => safeSetState(() {}));
                    },
                  ),
                  autofocus: true,
                  enabled: true,
                  textInputAction: TextInputAction.search,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: FFLocalizations.of(context).getText(
                      '3akyt4pw' /* Search plants, flowers, trees */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Rethink Sans',
                          letterSpacing: 0.0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).accent1,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).accent1,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    contentPadding: EdgeInsets.all(16.0),
                    prefixIcon: Icon(
                      FFIcons.kmagnifyingGlass,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 22.0,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Rethink Sans',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  enableInteractiveSelection: true,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
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
            toolbarHeight: 72.0,
            elevation: 0.0,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              if (_model.textController.text == '') {
                return SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (_model.textController.text == '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'j89vr1cv' /* Trending */,
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
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
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
                                      children: List.generate(
                                              rowPlantsRecordList.length,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  alignment:
                                                      AlignmentDirectional(
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .barrier,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                              'rgjujezd' /* Trending */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (_model.textController.text == '')
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ukzne84x' /* Flowers */,
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
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Align(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        verticalDirection:
                                            VerticalDirection.down,
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
                                                (MediaQuery.sizeOf(context)
                                                            .width -
                                                        44) /
                                                    2,
                                                173.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child: Image.network(
                                                          wrapPlantsRecord
                                                              .images
                                                              .firstOrNull!,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              valueOrDefault<
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        wrapPlantsRecord.name,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Rethink Sans',
                                                              letterSpacing:
                                                                  0.0,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 40.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        wrapPlantsRecord
                                                            .description,
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Rethink Sans',
                                                              letterSpacing:
                                                                  0.0,
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
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                      SafeArea(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Builder(
                            builder: (context) {
                              final searched =
                                  _model.simpleSearchResults.toList();

                              return Wrap(
                                spacing: 12.0,
                                runSpacing: 12.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(searched.length,
                                    (searchedIndex) {
                                  final searchedItem = searched[searchedIndex];
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
                                            searchedItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'plant': searchedItem,
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
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  searchedItem
                                                      .images.firstOrNull!,
                                                  width: double.infinity,
                                                  height:
                                                      valueOrDefault<double>(
                                                    (MediaQuery.sizeOf(context)
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
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                searchedItem.name,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                searchedItem.description,
                                                maxLines: 2,
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
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
