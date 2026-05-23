import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/models/service.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.0, color: BooklyColors.primary200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(service.imagePath),
                ),
              ),
            ),
            SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service',
                    style: TextStyle(
                      color: BooklyColors.neutral500,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    service.title,
                    style: TextStyle(
                      color: BooklyColors.neutral900,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    service.shortDescription,
                    style: TextStyle(
                      color: BooklyColors.neutral500,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$${service.price} ·',
                        style: TextStyle(
                          color: BooklyColors.neutral900,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        ' ${service.durationMinutes} min',
                        style: TextStyle(
                          color: BooklyColors.neutral500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
