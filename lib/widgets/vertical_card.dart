import 'package:flutter/material.dart';

import '../bookly_colors.dart';
import '../models/service.dart';

class VerticalCard extends StatelessWidget {
  final Service service;
  final VoidCallback onTap;

  const VerticalCard({
    super.key,
    required this.service, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 92,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: BooklyColors.primary200,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  service.imagePath,
                  height: 72,
                  width: 92,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      service.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: BooklyColors.neutral900,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: BooklyColors.secondary400,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Row(
                          children: [
                            Text(
                              '${service.rating}',
                              style: TextStyle(
                                color: BooklyColors.neutral900,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' (${service.reviewsCount}) · ${service.address}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: BooklyColors.neutral400,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Text(
                '\$${service.price}',
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}