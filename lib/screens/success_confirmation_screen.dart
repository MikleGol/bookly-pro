import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/screens/home_shell.dart';
import 'package:bookly_pro/widgets/primary_button.dart';
import 'package:bookly_pro/widgets/secondary_button.dart';
import 'package:flutter/material.dart';

class SuccessConfirmationScreen extends StatelessWidget {
  SuccessConfirmationScreen({super.key});

  final nullFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/system/success.png',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 24),
              Text(
                'Booking Confirmed! 🎉',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: BooklyColors.neutral900,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Your appointment has been',
                style: TextStyle(color: BooklyColors.neutral900),
                maxLines: 2,
              ),
              Text(
                'booked successfully.',
                style: TextStyle(color: BooklyColors.neutral900),
                maxLines: 2,
              ),
              SizedBox(height: 24),
              PrimaryButton(
                text: 'View Booking',
                onPressed: () {},
                focusNode: nullFocus,
                height: 56,
                width: double.infinity,
              ),
              SizedBox(height: 12),
              SecondaryButton(
                text: 'Back to Home',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomeShell()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
