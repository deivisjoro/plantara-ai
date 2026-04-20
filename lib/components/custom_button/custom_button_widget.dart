import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'custom_button_model.dart';
export 'custom_button_model.dart';

class CustomButtonWidget extends StatefulWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.color,
    double? spacing,
    this.subtitle,
  }) : this.spacing = spacing ?? 12.0;

  final Widget? icon;
  final String? title;
  final Color? color;
  final double spacing;
  final String? subtitle;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  late CustomButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: widget.icon!,
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                widget.title!,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Rethink Sans',
                      color: valueOrDefault<Color>(
                        widget.color,
                        FlutterFlowTheme.of(context).primaryText,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      lineHeight: 1.4,
                    ),
              ),
            ),
          ),
          Text(
            widget.subtitle!,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Rethink Sans',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          Icon(
            FFIcons.kcaretRight,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 20.0,
          ),
        ]
            .divide(SizedBox(
                width: valueOrDefault<double>(
              widget.spacing,
              12.0,
            )))
            .addToStart(SizedBox(width: 1.0)),
      ),
    );
  }
}
