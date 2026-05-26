import 'package:flutter/material.dart';

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
    required this.hintText,
    required this.height,
    required this.width,
    this.obscureText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: height),
        child: TextFormField(
          obscureText: obscureText ?? false,
          focusNode: focusNode,
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText ?? '',
          ),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(nextFocus),
          validator: (value) {
            return validate(value);
          },
        ),
      ),
    );
  }
}
