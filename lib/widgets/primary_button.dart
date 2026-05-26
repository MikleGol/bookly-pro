import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final FocusNode focusNode;
  final double height;
  final double width;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.focusNode,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        focusNode: focusNode,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
