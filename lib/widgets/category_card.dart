import 'package:bookly_pro/bookly_colors.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final numServices = Data.services
        .where((service) => service.category == category)
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
            Text(category.title),
            Text('$numServices services'),
          ],
        ),
      ),
    );
  }
}
