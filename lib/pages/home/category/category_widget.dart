import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'category_model.dart';
export 'category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final CategoryRecord? category;

  static String routeName = 'Category';
  static String routePath = '/category';

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late CategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryModel());
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
            valueOrDefault<String>(
              widget.category?.name,
              'Ferns',
            ),
            maxLines: 1,
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
        body: StreamBuilder<List<PlantsRecord>>(
          stream: queryPlantsRecord(
            queryBuilder: (plantsRecord) => plantsRecord.where(
              'category',
              isEqualTo: widget.category?.reference,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: SpinKitThreeBounce(
                    color: FlutterFlowTheme.of(context).accent1,
                    size: 24.0,
                  ),
                ),
              );
            }
            List<PlantsRecord> bodyPlantsRecordList = snapshot.data!;

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
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
                            final plants = bodyPlantsRecordList.toList();

                            return Wrap(
                              spacing: 12.0,
                              runSpacing: 12.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children:
                                  List.generate(plants.length, (plantsIndex) {
                                final plantsItem = plants[plantsIndex];
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
                                          plantsItem,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'plant': plantsItem,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: valueOrDefault<double>(
                                      (MediaQuery.sizeOf(context).width - 44) /
                                          2,
                                      173.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: Image.network(
                                                plantsItem.images.firstOrNull!,
                                                width: double.infinity,
                                                height: valueOrDefault<double>(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 4.0),
                                            child: Text(
                                              plantsItem.name,
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
                                              plantsItem.description,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
