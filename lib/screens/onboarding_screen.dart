import 'package:flutter/material.dart';
import '../theme/bookly_colors.dart';
import 'login_screen.dart';
import '../models/board.dart';
import '../widgets/primary_button.dart';
import '../widgets/dots_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final nextFocus = FocusNode();
  int pageIndex = 0;
  final PageController _pageController = PageController();
  List<Board> boards = [
    Board(
      path: 'assets/onboarding/woman.png',
      title: 'Discover top local services',
      description:
          'Explore trusted professionals near you across many categories',
    ),
    Board(
      path: 'assets/onboarding/calendar.png',
      title: 'Book in just a few taps',
      description: 'Choose your service, pro, date & time that works for you.',
    ),
    Board(
      path: 'assets/onboarding/messaging.png',
      title: 'Manage all your appointments',
      description: 'View, reschedule or cancel anytime, all in one place.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    nextFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: boards.length,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final board = boards[index];

                    return OnboardingWidget(
                      path: board.path,
                      title: board.title,
                      description: board.description,
                    );
                  },
                ),
              ),
              SizedBox(height: 12),

              pageIndex <= 1
                  ? NextWidget(
                      nextPage: () {
                        setState(() {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.ease,
                          );
                        });
                      },
                      pageIndex: pageIndex,
                      focusNode: nextFocus,
                    )
                  : PrimaryButton(
                      text: 'Get Started',
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      focusNode: nextFocus,
                      height: 56,
                      width: double.infinity,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextWidget extends StatelessWidget {
  final VoidCallback nextPage;
  final int pageIndex;
  final FocusNode focusNode;

  const NextWidget({
    super.key,
    required this.nextPage,
    required this.pageIndex,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DotsIndicator(currentIndex: pageIndex, count: 3),
        PrimaryButton(
          text: 'Next',
          onPressed: nextPage,
          focusNode: focusNode,
          height: 56,
          width: 200,
        ),
      ],
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String path;
  final String title;
  final String description;

  const OnboardingWidget({
    super.key,
    required this.path,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(path, fit: BoxFit.cover, width: 360, height: 360),
        SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: BooklyColors.neutral900,
          ),
          maxLines: 2,
        ),
        SizedBox(height: 12),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: BooklyColors.neutral900,
          ),
          maxLines: 2,
        ),
      ],
    );
  }
}
