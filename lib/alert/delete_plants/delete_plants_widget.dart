import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'delete_plants_model.dart';
export 'delete_plants_model.dart';

class DeletePlantsWidget extends StatefulWidget {
  const DeletePlantsWidget({
    super.key,
    this.snaps,
    required this.isSnap,
    this.plants,
  });

  final PlantInformationStruct? snaps;
  final bool? isSnap;
  final DocumentReference? plants;

  @override
  State<DeletePlantsWidget> createState() => _DeletePlantsWidgetState();
}

class _DeletePlantsWidgetState extends State<DeletePlantsWidget> {
  late DeletePlantsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletePlantsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 400.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'qn19vspj' /* Confirm Delete? */,
                      ),
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Rethink Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'eirnr6qc' /* Are you sure you want to delet... */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Rethink Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'nh9k11ku' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).accent2,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Rethink Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (widget.isSnap!) {
                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'my_snaps': FieldValue.arrayRemove([
                                    getPlantInformationFirestoreData(
                                      updatePlantInformationStruct(
                                        widget.snaps,
                                        clearUnsetFields: false,
                                      ),
                                      true,
                                    )
                                  ]),
                                },
                              ),
                            });
                          } else {
                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'my_plants':
                                      FieldValue.arrayRemove([widget.plants]),
                                },
                              ),
                            });
                          }

                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'qadz6z6l' /* Delete */,
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Rethink Sans',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
