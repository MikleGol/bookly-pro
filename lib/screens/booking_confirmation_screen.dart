import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/models/service.dart';
import 'package:bookly_pro/screens/success_confirmation_screen.dart';
import 'package:bookly_pro/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../models/booking.dart';
import '../widgets/provider_card.dart';
import '../widgets/service_card.dart';

class BookingConfirmation extends StatefulWidget {
  final DateTime selectedDate;
  final Service service;
  final String selectedTime;

  const BookingConfirmation({
    super.key,
    required this.service,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  State<BookingConfirmation> createState() => _BookingConfirmationState();
}

class _BookingConfirmationState extends State<BookingConfirmation> {
  final nullFocus = FocusNode();

  @override
  void dispose() {
    nullFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double tax = widget.service.price * 0.06;
    final double total = widget.service.price + tax;

    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      appBar: AppBar(
        backgroundColor: BooklyColors.primary100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: BooklyColors.neutral900),
        ),
        title: Column(
          children: [
            Text(
              'Confirm Your Booking',
              style: TextStyle(
                color: BooklyColors.neutral900,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please review your booking details',
              style: TextStyle(
                color: BooklyColors.neutral500,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    ServiceCard(service: widget.service),
                    SizedBox(height: 12),
                    ProviderCard(
                      dateTime: widget.selectedDate,
                      selectedTime: widget.selectedTime,
                      service: widget.service,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Price Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: BooklyColors.neutral900,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Service Price'),
                    Text('\$${widget.service.price}'),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Tax (6%)'), Text('\$$tax')],
                ),
                SizedBox(height: 12),
                Divider(height: 1, color: BooklyColors.neutral200),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$$total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: BooklyColors.primary400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                PrimaryButton(
                  text: 'Confirm & Pay \$$total',
                  onPressed: () {
                    AppData.bookings.add(
                      Booking(
                        date: widget.selectedDate,
                        time: widget.selectedTime,
                        service: widget.service,
                        total: total,
                      ),
                    );

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const SuccessConfirmationScreen(),
                      ),
                      (_) => false,
                    );
                  },
                  focusNode: nullFocus,
                  height: 56,
                  width: double.infinity,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.bag,
                      color: BooklyColors.primary400,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'You can cancel or reschedule later',
                      style: TextStyle(
                        color: BooklyColors.neutral500,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
