import '/components/navigation/navigation_widget.dart';
import '/empty/empty_garden/empty_garden_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'garden_widget.dart' show GardenWidget;
import 'package:flutter/material.dart';

class GardenModel extends FlutterFlowModel<GardenWidget> {
  ///  Local state fields for this page.

  bool update = false;

  ///  State fields for stateful widgets in this page.

  // Model for EmptyGarden component.
  late EmptyGardenModel emptyGardenModel;
  // Model for Navigation component.
  late NavigationModel navigationModel;

  @override
  void initState(BuildContext context) {
    emptyGardenModel = createModel(context, () => EmptyGardenModel());
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    emptyGardenModel.dispose();
    navigationModel.dispose();
  }
}
