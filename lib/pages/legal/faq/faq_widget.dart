import '/components/faq_card/faq_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'faq_model.dart';
export 'faq_model.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({super.key});

  static String routeName = 'FAQ';
  static String routePath = '/faq';

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  late FaqModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaqModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 50.0,
              buttonSize: 44.0,
              icon: Icon(
                FFIcons.kcaretLeftBold,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'zb2oro5u' /* Help Center */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Rethink Sans',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Builder(
              builder: (context) {
                final faq = FFAppConstants.FAQ.toList();

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    12.0,
                    0,
                    16.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: faq.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.0),
                  itemBuilder: (context, faqIndex) {
                    final faqItem = faq[faqIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.opened = faqIndex;
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.faqCardModels.getModel(
                          faqIndex.toString(),
                          faqIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: FaqCardWidget(
                          key: Key(
                            'Keyc0x_${faqIndex.toString()}',
                          ),
                          question: faqItem,
                          answer:
                              'Get quick answers to the most common questions about using the app. Learn how to scan problems, view step-by-step explanations, and access advanced tools. If something isn’t working or you need help, this section will guide you.',
                          opened: faqIndex == _model.opened,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
