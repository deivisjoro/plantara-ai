import '/components/custom_button/custom_button_widget.dart';
import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CustomButton component.
  late CustomButtonModel customButtonModel1;
  // Model for CustomButton component.
  late CustomButtonModel customButtonModel2;
  // Model for CustomButton component.
  late CustomButtonModel customButtonModel3;
  // Model for CustomButton component.
  late CustomButtonModel customButtonModel4;
  // Model for CustomButton component.
  late CustomButtonModel customButtonModel5;
  // Model for CustomButton component.
  late CustomButtonModel customButtonModel6;
  // Model for CustomButton component.
  late CustomButtonModel customButtonModel7;
  // Model for Navigation component.
  late NavigationModel navigationModel;

  @override
  void initState(BuildContext context) {
    customButtonModel1 = createModel(context, () => CustomButtonModel());
    customButtonModel2 = createModel(context, () => CustomButtonModel());
    customButtonModel3 = createModel(context, () => CustomButtonModel());
    customButtonModel4 = createModel(context, () => CustomButtonModel());
    customButtonModel5 = createModel(context, () => CustomButtonModel());
    customButtonModel6 = createModel(context, () => CustomButtonModel());
    customButtonModel7 = createModel(context, () => CustomButtonModel());
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    customButtonModel1.dispose();
    customButtonModel2.dispose();
    customButtonModel3.dispose();
    customButtonModel4.dispose();
    customButtonModel5.dispose();
    customButtonModel6.dispose();
    customButtonModel7.dispose();
    navigationModel.dispose();
  }
}
