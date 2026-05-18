import 'package:bookly_pro/screens/home_shell.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import '../bookly_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          pageBuilder: (_, __, ___) => HomeShell(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              width: 120,
              height: 120,
            ),
            SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bookly',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: BooklyColors.neutral900,
                  ),
                ),
                Text(
                  'Pro',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: BooklyColors.primary400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Book local. Live Better.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: BooklyColors.neutral900,
              ),
            ),
            SizedBox(height: 48),
            CircularProgressIndicator(
              backgroundColor: BooklyColors.primary200,
              color: BooklyColors.primary400,
            ),
          ],
        ),
      ),
    );
  }
}
