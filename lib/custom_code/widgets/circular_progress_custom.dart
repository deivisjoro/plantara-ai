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

import 'dart:math';

class CircularProgressCustom extends StatefulWidget {
  const CircularProgressCustom({
    Key? key,
    this.width,
    this.height,
    this.activeColor = const Color(0xFF81B44F),
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.strokeWidth = 7.0,
    this.fontSize,
    this.fontWeight = 700, // Default to bold (700)
  }) : super(key: key);

  final double? width;
  final double? height;

  /// Color of the active (filling) progress
  final Color activeColor;

  /// Color of the circular background border
  final Color backgroundColor;

  /// Thickness of the circular border
  final double strokeWidth;

  /// Font size of the percentage text
  final double? fontSize;

  /// Numeric font weight (100, 200, …, 900)
  final double fontWeight;

  static FontWeight _mapFontWeight(double w) {
    switch (w.toInt()) {
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

  @override
  State<CircularProgressCustom> createState() => _CircularProgressCustomState();
}

class _CircularProgressCustomState extends State<CircularProgressCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 1, end: 100).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = min(widget.width ?? 200, widget.height ?? 200);
    final strokeWidth = widget.strokeWidth;
    final fontSize = widget.fontSize ?? size * 0.2;

    // Get theme brightness for text color
    final brightness = Theme.of(context).brightness;
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.backgroundColor,
                width: strokeWidth,
              ),
            ),
          ),
          // Active circular progress
          SizedBox(
            width: size - strokeWidth,
            height: size - strokeWidth,
            child: CircularProgressIndicator(
              value: _animation.value / 100,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(widget.activeColor),
              strokeWidth: strokeWidth,
              strokeCap: StrokeCap.round,
            ),
          ),
          // Percentage text
          Text(
            '${_animation.value.toInt()}%',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight:
                  CircularProgressCustom._mapFontWeight(widget.fontWeight),
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
