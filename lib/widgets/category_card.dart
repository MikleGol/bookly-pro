import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/app_data.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final numServices = AppData.services
        .where((service) => service.categoryId == category.id)
        .length;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: BooklyColors.primary200,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Image.asset(
              category.imagePath,
              fit: BoxFit.scaleDown,
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                category.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              '$numServices services',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
