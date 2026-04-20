import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_garden_model.dart';
export 'empty_garden_model.dart';

class EmptyGardenWidget extends StatefulWidget {
  const EmptyGardenWidget({super.key});

  @override
  State<EmptyGardenWidget> createState() => _EmptyGardenWidgetState();
}

class _EmptyGardenWidgetState extends State<EmptyGardenWidget> {
  late EmptyGardenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyGardenModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? 'assets/images/garden.dark.png'
                : 'assets/images/garden.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          FFLocalizations.of(context).getText(
            '7dfb9zcl' /* Your Garden is Empty */,
          ),
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Rethink Sans',
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          FFLocalizations.of(context).getText(
            'mlqvbqg6' /* Manage your plant family, view... */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Rethink Sans',
                letterSpacing: 0.0,
              ),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
