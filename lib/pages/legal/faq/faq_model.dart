import '/components/faq_card/faq_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'faq_widget.dart' show FaqWidget;
import 'package:flutter/material.dart';

class FaqModel extends FlutterFlowModel<FaqWidget> {
  ///  Local state fields for this page.

  int opened = 0;

  ///  State fields for stateful widgets in this page.

  // Models for FaqCard dynamic component.
  late FlutterFlowDynamicModels<FaqCardModel> faqCardModels;

  @override
  void initState(BuildContext context) {
    faqCardModels = FlutterFlowDynamicModels(() => FaqCardModel());
  }

  @override
  void dispose() {
    faqCardModels.dispose();
  }
}
