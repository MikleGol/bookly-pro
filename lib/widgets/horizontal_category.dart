import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/models/category.dart';
import 'package:flutter/material.dart';
import '../models/service.dart';

class HorizontalCategory extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const HorizontalCategory({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: BooklyColors.secondary200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(category.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              category.title,
              style: TextStyle(
                color: BooklyColors.neutral900,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
