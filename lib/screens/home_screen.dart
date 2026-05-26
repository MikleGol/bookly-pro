import 'package:bookly_pro/screens/service_screen.dart';
import 'package:flutter/material.dart';
import '../models/service.dart';
import '../theme/bookly_colors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/horizontal_card.dart';
import '../widgets/horizontal_category.dart';
import '../widgets/secondary_button.dart';
import '../widgets/vertical_card.dart';
import '../data/app_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nullFocus = FocusNode();
  final searchFocus = FocusNode();
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchFocus.dispose();
    searchController.dispose();
    super.dispose();
  }

  void _openService(Service service) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 320),
        reverseTransitionDuration: const Duration(milliseconds: 260),
        pageBuilder: (_, animation, child) => ServiceScreen(service: service),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          final tween = Tween(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),

              const SizedBox(height: 20),

              AppTextField(
                focusNode: searchFocus,
                controller: searchController,
                type: TextInputType.text,
                validate: () {},
                hintText: 'Search services or specialists',
                height: 56,
                width: double.infinity,
                prefixIcon: Icon(Icons.search, color: BooklyColors.neutral400),
                nextFocus: nullFocus,
              ),

              const SizedBox(height: 24),

              _SectionHeader(
                title: 'Featured Services',
                actionText: 'See all',
                onPressed: () {},
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppData.services.length,
                  itemBuilder: (context, index) {
                    final service = AppData.services[index];
                    return HorizontalCard(
                      service: service,
                      onTap: () => _openService(service),
                    );
                  },
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                ),
              ),

              const SizedBox(height: 24),

              _SectionHeader(
                title: 'Categories',
                actionText: 'See all',
                onPressed: () {},
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppData.categories.length,
                  itemBuilder: (context, index) {
                    final category = AppData.categories[index];
                    return HorizontalCategory(category: category, onTap: () {});
                  },
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                ),
              ),

              const SizedBox(height: 24),

              _SectionHeader(
                title: 'Recommended Near You',
                actionText: 'View all',
                onPressed: () {},
              ),

              const SizedBox(height: 12),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppData.services.length,
                itemBuilder: (context, index) {
                  final service = AppData.services[index];
                  return VerticalCard(
                    service: service,
                    onTap: () => _openService(service),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${AppData.profile.name} 👋',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(AppData.profile.imagePath),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onPressed;

  const _SectionHeader({
    required this.title,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: BooklyColors.neutral900,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SecondaryButton(text: actionText, onPressed: onPressed),
      ],
    );
  }
}
