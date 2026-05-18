import 'package:flutter/material.dart';
import '../bookly_colors.dart';

class FilterChipButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  const FilterChipButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap, required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.5,
      color: isSelected ? selectedColor : BooklyColors.primary100,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          height: 36,
          padding: EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              width: 2,
              color: isSelected
                  ? selectedColor
                  : BooklyColors.primary200,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : BooklyColors.neutral700,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
