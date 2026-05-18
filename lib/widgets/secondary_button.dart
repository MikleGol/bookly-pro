import 'package:flutter/material.dart';

import '../bookly_colors.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SecondaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(overlayColor: BooklyColors.primary400),
      child: Text(
        text,
        style: TextStyle(color: BooklyColors.primary400, fontWeight: FontWeight.bold),
      ),
    );
  }
}
