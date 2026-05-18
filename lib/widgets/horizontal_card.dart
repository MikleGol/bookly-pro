import 'package:bookly_pro/bookly_colors.dart';
import 'package:flutter/material.dart';
import '../models/service.dart';

class HorizontalCard extends StatelessWidget {
  final Service service;
  final VoidCallback onTap;

  const HorizontalCard({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(service.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              service.title,
              style: TextStyle(
                color: BooklyColors.neutral900,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.star, color: BooklyColors.secondary400),
                SizedBox(width: 4),
                Text(
                  '${service.rating}',
                  style: TextStyle(
                    color: BooklyColors.neutral400,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Text(
              '\$${service.price}',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
