import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const DotsIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;

        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.only(right: 6),
          width: isActive ? 18 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? BooklyColors.primary400
                : BooklyColors.primary200,
            borderRadius: BorderRadiusGeometry.circular(99),
          ),
        );
      }),
    );
  }
}
