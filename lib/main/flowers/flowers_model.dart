import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'flowers_widget.dart' show FlowersWidget;
import 'package:flutter/material.dart';

class FlowersModel extends FlutterFlowModel<FlowersWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Navigation component.
  late NavigationModel navigationModel;

  @override
  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    navigationModel.dispose();
  }
}
