import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color initialColor;
  final Color pressedColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.initialColor,
    required this.pressedColor,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _currentColor = widget.pressedColor;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _currentColor = widget.initialColor;
    });
    widget.onTap();
  }

  void _handleTapCancel() {
    setState(() {
      _currentColor = widget.initialColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: _currentColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
