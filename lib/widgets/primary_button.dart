import 'package:flutter/material.dart';
import '../bookly_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final FocusNode focusNode;
  final double height;
  final double width;

  const PrimaryButton({super.key, required this.text, required this.onPressed, required this.focusNode, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        focusNode: focusNode,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          overlayColor: BooklyColors.primary400,
          backgroundColor: BooklyColors.primary400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: BooklyColors.primary200,
          ),
        ),
      ),
    );
  }
}
