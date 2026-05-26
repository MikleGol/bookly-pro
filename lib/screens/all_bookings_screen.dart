import 'package:bookly_pro/models/booking.dart';
import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:flutter/material.dart';
import '../data/app_data.dart';

class AllBookingsScreen extends StatefulWidget {
  const AllBookingsScreen({super.key});

  @override
  State<AllBookingsScreen> createState() => _AllBookingsScreenState();
}

class _AllBookingsScreenState extends State<AllBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      appBar: AppBar(backgroundColor: BooklyColors.primary100),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final booking = AppData.bookings[index];

              return _BookingCard(booking: booking);
            },
            separatorBuilder: (_, _) => SizedBox(height: 12),
            itemCount: AppData.bookings.length,
          ),
        ),
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final Booking booking;

  const _BookingCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    final service = booking.service;

    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(service.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${booking.date} · ${booking.time}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: BooklyColors.neutral500),
                  ),
                  SizedBox(height: 12),
                  Text(
                    service.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: BooklyColors.neutral900,
                    ),
                  ),
                  Text(
                    service.shortDescription,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: BooklyColors.neutral500,
                    ),
                  ),
                  Text(
                    '\$${booking.total}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: BooklyColors.primary400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Upcoming',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
