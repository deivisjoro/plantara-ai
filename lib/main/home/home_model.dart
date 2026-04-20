import '/backend/api_requests/api_calls.dart';
import '/components/navigation/navigation_widget.dart';
import '/components/tools/tools_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homeController;
  // Stores action output result for [Backend Call - API (Weater)] action in Home widget.
  ApiCallResponse? weather;
  // Model for Tools component.
  late ToolsModel toolsModel1;
  // Model for Tools component.
  late ToolsModel toolsModel2;
  // Model for Tools component.
  late ToolsModel toolsModel3;
  // Model for Tools component.
  late ToolsModel toolsModel4;
  // Model for Tools component.
  late ToolsModel toolsModel5;
  // Model for Tools component.
  late ToolsModel toolsModel6;
  // Model for Tools component.
  late ToolsModel toolsModel7;
  // Model for Tools component.
  late ToolsModel toolsModel8;
  // Model for Navigation component.
  late NavigationModel navigationModel;

  @override
  void initState(BuildContext context) {
    toolsModel1 = createModel(context, () => ToolsModel());
    toolsModel2 = createModel(context, () => ToolsModel());
    toolsModel3 = createModel(context, () => ToolsModel());
    toolsModel4 = createModel(context, () => ToolsModel());
    toolsModel5 = createModel(context, () => ToolsModel());
    toolsModel6 = createModel(context, () => ToolsModel());
    toolsModel7 = createModel(context, () => ToolsModel());
    toolsModel8 = createModel(context, () => ToolsModel());
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    homeController?.finish();
    toolsModel1.dispose();
    toolsModel2.dispose();
    toolsModel3.dispose();
    toolsModel4.dispose();
    toolsModel5.dispose();
    toolsModel6.dispose();
    toolsModel7.dispose();
    toolsModel8.dispose();
    navigationModel.dispose();
  }
}
