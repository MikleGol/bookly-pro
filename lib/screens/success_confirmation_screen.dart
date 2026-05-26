import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/screens/home_shell.dart';
import 'package:bookly_pro/widgets/primary_button.dart';
import 'package:bookly_pro/widgets/secondary_button.dart';
import 'package:flutter/material.dart';

class SuccessConfirmationScreen extends StatefulWidget {
  const SuccessConfirmationScreen({super.key});

  @override
  State<SuccessConfirmationScreen> createState() =>
      _SuccessConfirmationScreenState();
}

class _SuccessConfirmationScreenState extends State<SuccessConfirmationScreen> {
  final nullFocus = FocusNode();

  @override
  void dispose() {
    nullFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageSize = constraints.maxHeight < 620 ? 220.0 : 300.0;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 48,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/system/success.png',
                      height: imageSize,
                      width: imageSize,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Booking Confirmed! 🎉',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: BooklyColors.neutral900,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Your appointment has been',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: BooklyColors.neutral900),
                      maxLines: 2,
                    ),
                    Text(
                      'booked successfully.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: BooklyColors.neutral900),
                      maxLines: 2,
                    ),
                    SizedBox(height: 24),
                    PrimaryButton(
                      text: 'View Booking',
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const HomeShell(initialIndex: 2),
                          ),
                          (_) => false,
                        );
                      },
                      focusNode: nullFocus,
                      height: 56,
                      width: double.infinity,
                    ),
                    SizedBox(height: 12),
                    SecondaryButton(
                      text: 'Back to Home',
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const HomeShell()),
                          (_) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
