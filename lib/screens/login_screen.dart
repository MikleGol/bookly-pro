import 'package:bookly_pro/screens/home_shell.dart';
import 'package:flutter/material.dart';
import '../theme/bookly_colors.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import '../widgets/app_text_field.dart';
import 'sign_up_screen.dart';
import '../widgets/secondary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final authButton = FocusNode();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    authButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
              SizedBox(height: 12),
              Text(
                'Welcome back 👋',
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Login to continue',
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 12),
              Form(
                key: _key,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Email address',
                          style: TextStyle(color: BooklyColors.neutral900),
                        ),
                      ],
                    ),

                    AppTextField(
                      focusNode: emailFocus,
                      nextFocus: passwordFocus,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: validateEmail,
                      hintText: 'you@example.com',
                      height: 56,
                      width: double.infinity,
                    ),

                    SizedBox(height: 12),

                    Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(color: BooklyColors.neutral900),
                        ),
                      ],
                    ),

                    AppTextField(
                      focusNode: passwordFocus,
                      nextFocus: authButton,
                      controller: passwordController,
                      type: TextInputType.text,
                      validate: validatePassword,
                      hintText: 'Enter your password',
                      height: 56,
                      width: double.infinity,
                      obscureText: true,
                    ),

                    SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SecondaryButton(text: 'Forgot?', onPressed: () {}),
                      ],
                    ),

                    SizedBox(height: 12),

                    PrimaryButton(
                      focusNode: authButton,
                      text: 'Login',
                      onPressed: () {
                        if (!_key.currentState!.validate()) {
                          return;
                        }
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeShell()));
                      },
                      height: 56,
                      width: double.infinity,
                    ),

                    SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: BooklyColors.neutral400,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text('or continue with'),
                        SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: BooklyColors.neutral400,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: SocialButton(
                            text: 'Google',
                            assetPath: 'assets/social/google.png',
                            onPressed: () {},
                            height: 56,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SocialButton(
                            text: 'Apple',
                            assetPath: 'assets/social/apple.png',
                            onPressed: () {},
                            height: 56,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        SizedBox(width: 8),
                        SecondaryButton(
                          text: 'Sign up',
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignUpScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  final email = value?.trim() ?? '';

  if (email.isEmpty) {
    return 'Email is required';
  }

  if (email.contains(' ')) {
    return 'Email must not contain spaces';
  }

  if (!email.contains('@') || !email.contains('.')) {
    return 'Enter a valid email';
  }

  return null;
}

String? validatePassword(String? value) {
  final password = value?.trim() ?? '';

  if (password.isEmpty) {
    return 'Password is required';
  }

  if (password.contains(' ')) {
    return 'Password must not contain spaces';
  }

  if (password.length < 6) {
    return 'Password must be 6+ symbols long';
  }

  return null;
}
