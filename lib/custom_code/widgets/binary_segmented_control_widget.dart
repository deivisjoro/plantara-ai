// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class BinarySegmentedControlWidget extends StatefulWidget {
  const BinarySegmentedControlWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.text1,
    required this.action1,
    required this.text2,
    required this.action2,
    required this.inactiveBorderColor,
    required this.activeBorderColor,
    required this.inactiveColor,
    required this.activeColor,
    required this.segmentPadding,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  final double width;
  final double height;

  final String text1;
  final VoidCallback action1;

  final String text2;
  final VoidCallback action2;

  // Colors
  final Color inactiveBorderColor;
  final Color activeBorderColor;
  final Color inactiveColor;
  final Color activeColor;

  // Padding around the entire segment control
  final double segmentPadding;

  final double fontSize;
  final double fontWeight;

  @override
  _BinarySegmentedControlWidgetState createState() =>
      _BinarySegmentedControlWidgetState();
}

class _BinarySegmentedControlWidgetState
    extends State<BinarySegmentedControlWidget> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    final saved = FFAppState().Segment;
    _selected = (saved == 1 || saved == 2) ? saved : 1;
  }

  FontWeight _mapWeight(double w) {
    switch (w.round()) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }

  void _update(int idx) {
    if (_selected == idx) return;
    setState(() => _selected = idx);
    FFAppState().update(() {
      FFAppState().Segment = idx;
    });
    if (idx == 1) {
      widget.action1();
    } else {
      widget.action2();
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalHeight = widget.height ?? 48.0;
    return SizedBox(
      width: widget.width,
      height: totalHeight,
      child: Container(
        padding: EdgeInsets.all(widget.segmentPadding),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            final segmentWidth = constraints.maxWidth / 2;
            final segmentHeight = constraints.maxHeight;

            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (details) {
                final localDx = (ctx.findRenderObject() as RenderBox)
                        .globalToLocal(details.globalPosition)
                        .dx -
                    widget.segmentPadding;
                final idx = (localDx ~/ segmentWidth).clamp(0, 1) + 1;
                _update(idx);
              },
              onHorizontalDragUpdate: (details) {
                final idx =
                    (details.localPosition.dx ~/ segmentWidth).clamp(0, 1) + 1;
                _update(idx);
              },
              child: Stack(
                children: [
                  // static inactive borders
                  Row(
                    children: List.generate(2, (_) {
                      return Container(
                        width: segmentWidth,
                        height: segmentHeight,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: widget.inactiveBorderColor,
                              width: 1.5,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  // moving active border
                  AnimatedPositioned(
                    left: (_selected - 1) * segmentWidth,
                    width: segmentWidth,
                    height: segmentHeight,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: widget.activeBorderColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // text
                  Row(
                    children: [
                      _buildSegmentText(1, segmentWidth, segmentHeight),
                      _buildSegmentText(2, segmentWidth, segmentHeight),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSegmentText(int idx, double w, double h) {
    final isActive = _selected == idx;
    final text = idx == 1 ? widget.text1 : widget.text2;

    final baseStyle = FlutterFlowTheme.of(context).bodyText1;

    return SizedBox(
      width: w,
      height: h,
      child: Center(
        child: Text(
          text,
          style: baseStyle.copyWith(
            color: isActive ? widget.activeColor : widget.inactiveColor,
            fontSize: widget.fontSize,
            fontWeight: _mapWeight(widget.fontWeight),
          ),
        ),
      ),
    );
  }
}
