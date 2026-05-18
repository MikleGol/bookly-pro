import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bookly_colors.dart';

class AppTextField extends StatelessWidget {
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextEditingController controller;
  final TextInputType type;
  final Function validate;
  final String? hintText;
  final bool? obscureText;
  final Icon? prefixIcon;
  final double height;
  final double width;


  const AppTextField({
    super.key,
    required this.focusNode,
    required this.nextFocus,
    required this.controller,
    required this.type,
    required this.validate,
    required this.hintText, required this.height, required this.width, this.obscureText, this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        obscureText: obscureText ?? false,
        focusNode: focusNode,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: BooklyColors.neutral100,

          hintText: hintText ?? '',
          hintStyle: TextStyle(
            color: BooklyColors.neutral400,
            fontSize: 14,
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),

          enabledBorder: _border(BooklyColors.neutral200, 1),
          focusedBorder: _border(BooklyColors.primary400, 1.4),
          errorBorder: _border(Colors.red, 1),
          focusedErrorBorder: _border(Colors.red, 1.4),
        ),
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(nextFocus),
        validator: (value) {
          return validate(value);
        },
      ),
    );
  }
}

OutlineInputBorder _border(Color color, double width) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: color,
      width: width,
    ),
  );
}