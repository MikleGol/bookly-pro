import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/models/service.dart';
import 'package:flutter/material.dart';

class ProviderCard extends StatelessWidget {
  final Service service;
  final DateTime dateTime;
  final String selectedTime;

  const ProviderCard({
    super.key,
    required this.dateTime,
    required this.selectedTime,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.0, color: BooklyColors.primary200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProviderElement(
              icon: Icons.date_range,
              topText: 'Date & Time',
              centerText: dateTime.toIso8601String(),
              bottomText: selectedTime,
            ),
            SizedBox(height: 12),
            ProviderElement(
              icon: Icons.location_on_outlined,
              topText: 'Location',
              centerText: service.shortDescription,
              bottomText: service.address,
            ),
          ],
        ),
      ),
    );
  }
}

class ProviderElement extends StatelessWidget {
  final IconData icon;
  final String topText;
  final String centerText;
  final String bottomText;

  const ProviderElement({
    super.key,
    required this.icon,
    required this.topText,
    required this.centerText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 100, width: 100, child: Icon(icon, size: 50)),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topText,
                style: TextStyle(color: BooklyColors.neutral500, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                centerText,
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                bottomText,
                style: TextStyle(color: BooklyColors.neutral500, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
