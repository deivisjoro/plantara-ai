import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'snack_model.dart';
export 'snack_model.dart';

class SnackWidget extends StatefulWidget {
  const SnackWidget({
    super.key,
    required this.status,
    required this.text,
    required this.hasNavigation,
    int? delay,
  }) : this.delay = delay ?? 1200;

  final Status? status;
  final String? text;
  final bool? hasNavigation;
  final int delay;

  @override
  State<SnackWidget> createState() => _SnackWidgetState();
}

class _SnackWidgetState extends State<SnackWidget> {
  late SnackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SnackModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: valueOrDefault<int>(
            widget.delay,
            1200,
          ),
        ),
      );
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          16.0,
          16.0,
          16.0,
          valueOrDefault<double>(
            widget.hasNavigation! ? 88.0 : 16.0,
            0.0,
          )),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 52.0,
          decoration: BoxDecoration(
            color: () {
              if (widget.status == Status.error) {
                return FlutterFlowTheme.of(context).error;
              } else if (widget.status == Status.warning) {
                return FlutterFlowTheme.of(context).warning;
              } else if (widget.status == Status.info) {
                return FlutterFlowTheme.of(context).infoBlue;
              } else {
                return FlutterFlowTheme.of(context).primary;
              }
            }(),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  if (widget.status == Status.error) {
                    return Icon(
                      FFIcons.kwarningCircle,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    );
                  } else if (widget.status == Status.warning) {
                    return Icon(
                      FFIcons.kwarning,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    );
                  } else if (widget.status == Status.info) {
                    return Icon(
                      FFIcons.kinfo,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    );
                  } else {
                    return Icon(
                      FFIcons.kcheckCircle,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    );
                  }
                },
              ),
              Expanded(
                child: Text(
                  valueOrDefault<String>(
                    widget.text,
                    'This is the Success message.',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Rethink Sans',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
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
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                    child: Icon(
                      FFIcons.kx,
                      color: FlutterFlowTheme.of(context).info,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 8.0)).addToStart(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}
