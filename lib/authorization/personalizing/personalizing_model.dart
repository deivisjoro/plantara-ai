import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'personalizing_widget.dart' show PersonalizingWidget;
import 'package:flutter/material.dart';

class PersonalizingModel extends FlutterFlowModel<PersonalizingWidget> {
  ///  Local state fields for this page.

  bool update = false;

  int? plants = -1;

  bool ready = false;

  int? experience = -1;

  int? many = -1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
