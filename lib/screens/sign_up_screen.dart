import 'package:bookly_pro/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../theme/bookly_colors.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/secondary_button.dart';
import 'home_shell.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final authButton = FocusNode();
  final _key = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameFocus.dispose();
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
                'Create account',
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Let\'s get you started',
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
                          'Full name',
                          style: TextStyle(color: BooklyColors.neutral900),
                        ),
                      ],
                    ),

                    AppTextField(
                      focusNode: nameFocus,
                      nextFocus: emailFocus,
                      controller: nameController,
                      type: TextInputType.text,
                      validate: validateName,
                      hintText: 'John Doe',
                      height: 56,
                      width: double.infinity,
                    ),

                    SizedBox(height: 12),

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
                      hintText: 'Create password',
                      height: 56,
                      width: double.infinity,
                      obscureText: true,
                    ),

                    SizedBox(height: 12),

                    Row(
                      children: [
                        Checkbox(
                          activeColor: BooklyColors.primary400,
                          checkColor: BooklyColors.primary200,
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                        ),
                        Text(
                          'I agree to the ',
                          style: TextStyle(color: BooklyColors.neutral900),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Terms & Privacy Policy',
                            style: TextStyle(
                              color: BooklyColors.neutral900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    PrimaryButton(
                      focusNode: authButton,
                      text: 'Sign Up',
                      onPressed: () {
                        if (!_key.currentState!.validate()) {
                          return;
                        }
                        if (!isChecked) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: BooklyColors.primary400,
                              content: Text(
                                'Please, read and accept Terms & Privacy Policy to continue',
                                style: TextStyle(
                                  color: BooklyColors.primary200,
                                ),
                              ),
                            ),
                          );
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
                        Text('Already have an account?'),
                        SizedBox(width: 8),
                        SecondaryButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
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

String? validateName(String? value) {
  final name = value?.trim() ?? '';

  if (name.isEmpty) {
    return 'Full name is required';
  }

  return null;
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
