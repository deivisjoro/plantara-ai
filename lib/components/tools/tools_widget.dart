import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tools_model.dart';
export 'tools_model.dart';

class ToolsWidget extends StatefulWidget {
  const ToolsWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.width,
  });

  final Widget? icon;
  final String? title;
  final double? width;

  @override
  State<ToolsWidget> createState() => _ToolsWidgetState();
}

class _ToolsWidgetState extends State<ToolsWidget> {
  late ToolsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToolsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon!,
            Text(
              widget.title!,
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Rethink Sans',
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
