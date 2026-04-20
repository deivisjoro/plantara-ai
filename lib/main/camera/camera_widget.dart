import '/alert/info_camera/info_camera_widget.dart';
import '/alert/web_not_working/web_not_working_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/loader/loader_widget.dart';
import '/components/snack/snack_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'camera_model.dart';
export 'camera_model.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    super.key,
    required this.initialValue,
  });

  final PlantType? initialValue;

  static String routeName = 'Camera';
  static String routePath = '/camera';

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (isWeb) {
        await showDialog(
          barrierColor: FlutterFlowTheme.of(context).barrier,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: WebNotWorkingWidget(),
              ),
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Builder(
            builder: (context) => Container(
              width: double.infinity,
              height: double.infinity,
              child: custom_widgets.PlantScannerCamera(
                width: double.infinity,
                height: double.infinity,
                primaryColor: FlutterFlowTheme.of(context).primary,
                initialType: widget.initialValue,
                onCapture: (imageFile, scanType) async {
                  showDialog(
                    barrierColor: FlutterFlowTheme.of(context).barrierShade,
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(dialogContext).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: LoaderWidget(),
                        ),
                      );
                    },
                  );

                  _model.plantInformationStruct =
                      await actions.getPlantInformation(
                    imageFile!,
                    scanType,
                    'AIzaSyDwjIbbGqYdsbNQg7MHAQhDwYGCqOxbtbg',
                    'KNXS3Ze6R8xBpFcwruYxtBeG4QINyc1BYRUcE47QlssBSbkHTFSnGwcG',
                  );
                  if (_model.plantInformationStruct != null) {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'snaps': FieldValue.arrayUnion([
                            getPlantInformationFirestoreData(
                              updatePlantInformationStruct(
                                _model.plantInformationStruct,
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        },
                      ),
                    });

                    context.goNamed(
                      SnapsWidget.routeName,
                      queryParameters: {
                        'plant': serializeParam(
                          _model.plantInformationStruct,
                          ParamType.DataStruct,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    Navigator.pop(context);
                    await showDialog(
                      barrierColor: FlutterFlowTheme.of(context).tertiary,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 1.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(dialogContext).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: SnackWidget(
                              status: Status.error,
                              text: 'Flower not found!',
                              hasNavigation: false,
                            ),
                          ),
                        );
                      },
                    );
                  }

                  safeSetState(() {});
                },
                onInfoAction: () async {
                  await showDialog(
                    barrierColor: FlutterFlowTheme.of(context).barrier,
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(dialogContext).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: InfoCameraWidget(),
                        ),
                      );
                    },
                  );
                },
                onBack: () async {
                  context.safePop();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
