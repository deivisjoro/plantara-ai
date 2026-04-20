import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'faq_card_model.dart';
export 'faq_card_model.dart';

class FaqCardWidget extends StatefulWidget {
  const FaqCardWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.opened,
  });

  final String? question;
  final String? answer;
  final bool? opened;

  @override
  State<FaqCardWidget> createState() => _FaqCardWidgetState();
}

class _FaqCardWidgetState extends State<FaqCardWidget> {
  late FaqCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaqCardModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      widget.question!,
                      maxLines: widget.opened! ? 10 : 1,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Rethink Sans',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (widget.opened ?? false) {
                        return Icon(
                          FFIcons.kcaretUp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        );
                      } else {
                        return Icon(
                          FFIcons.kcaretDown,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        );
                      }
                    },
                  ),
                ]
                    .divide(SizedBox(width: 8.0))
                    .addToStart(SizedBox(width: 16.0))
                    .addToEnd(SizedBox(width: 16.0)),
              ),
            ),
          ),
          if (widget.opened ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Text(
                widget.answer!,
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: 'Rethink Sans',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
