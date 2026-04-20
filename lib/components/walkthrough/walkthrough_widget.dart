import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'walkthrough_model.dart';
export 'walkthrough_model.dart';

class WalkthroughWidget extends StatefulWidget {
  const WalkthroughWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<WalkthroughWidget> createState() => _WalkthroughWidgetState();
}

class _WalkthroughWidgetState extends State<WalkthroughWidget> {
  late WalkthroughModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroughModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Text(
          widget.title!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Rethink Sans',
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                lineHeight: 1.5,
              ),
        ),
      ),
    );
  }
}
