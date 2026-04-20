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

class SwipeButton extends StatefulWidget {
  const SwipeButton({
    Key? key,
    required this.width,
    required this.height,
    required this.action,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.borderRadius,
  }) : super(key: key);

  final double width;
  final double height;
  final Future Function() action;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final double fontSize;
  final double fontWeight;
  final double borderRadius;

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 0;
  bool _isDragging = false;
  bool _isCompleted = false;
  late AnimationController _checkAnimationController;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();
    _checkAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _checkAnimation = CurvedAnimation(
      parent: _checkAnimationController,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _checkAnimationController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    if (_isCompleted) return;
    setState(() {
      _isDragging = true;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_isCompleted) return;

    final maxDrag = widget.width - widget.height;
    setState(() {
      _dragPosition = (_dragPosition + details.delta.dx).clamp(0.0, maxDrag);
    });

    // Agar 85% dan ko'p surilsa, tugallangan hisoblanadi
    if (_dragPosition >= maxDrag * 0.85) {
      _completeSwipe();
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_isCompleted) return;
    setState(() {
      _isDragging = false;
      _dragPosition = 0;
    });
  }

  void _completeSwipe() {
    if (_isCompleted) return;

    setState(() {
      _isCompleted = true;
      _dragPosition = widget.width - widget.height;
      _isDragging = false;
    });

    _checkAnimationController.forward();

    // Action ni bajarish
    Future.delayed(const Duration(milliseconds: 200), () {
      widget.action();
    });
  }

  FontWeight _getFontWeight() {
    if (widget.fontWeight >= 700) return FontWeight.bold;
    if (widget.fontWeight >= 600) return FontWeight.w600;
    if (widget.fontWeight >= 500) return FontWeight.w500;
    return FontWeight.normal;
  }

  @override
  Widget build(BuildContext context) {
    final sliderSize = widget.height - 8;
    final progress = _dragPosition / (widget.width - widget.height);

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Stack(
        children: [
          // Progress background
          AnimatedContainer(
            duration:
                _isDragging ? Duration.zero : const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: widget.width * progress,
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),

          // Text
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isCompleted ? 0.0 : 1.0,
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: widget.fontSize,
                  fontWeight: _getFontWeight(),
                ),
              ),
            ),
          ),

          // Checkmark
          if (_isCompleted)
            Center(
              child: ScaleTransition(
                scale: _checkAnimation,
                child: Icon(
                  Icons.check,
                  color: widget.textColor,
                  size: widget.height * 0.5,
                ),
              ),
            ),

          // Slider button
          AnimatedPositioned(
            duration:
                _isDragging ? Duration.zero : const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            left: 4 + _dragPosition,
            top: 4,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: sliderSize,
                height: sliderSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(widget.borderRadius - 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(_isDragging ? 0.3 : 0.15),
                      blurRadius: _isDragging ? 15 : 8,
                      offset: Offset(0, _isDragging ? 6 : 2),
                    ),
                  ],
                ),
                transform: Matrix4.identity()..scale(_isDragging ? 1.05 : 1.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: widget.backgroundColor,
                  size: sliderSize * 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Usage example for FlutterFlow:
// SwipeButton(
//   width: 300,
//   height: 56,
//   action: () async {
//     // Call the required function here
//     print('Swipe completed!');
//   },
//   backgroundColor: Color(0xFF8B5CF6),
//   text: 'Get Started',
//   textColor: Colors.white,
//   fontSize: 16,
//   fontWeight: 600,
//   borderRadius: 12,
// )
