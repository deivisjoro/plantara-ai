import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'camera_widget.dart' show CameraWidget;
import 'package:flutter/material.dart';

class CameraModel extends FlutterFlowModel<CameraWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? img;

  PlantType? type = PlantType.plant;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPlantInformation] action in PlantScannerCamera widget.
  PlantInformationStruct? plantInformationStruct;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
