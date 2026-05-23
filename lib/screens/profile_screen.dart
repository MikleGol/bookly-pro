import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../theme/bookly_colors.dart';
import '../widgets/profile_tile.dart';
import '../data/app_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage(AppData.profile.imagePath),
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      Text(
                        '${AppData.profile.name} ${AppData.profile.surname}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        AppData.profile.email,
                        style: TextStyle(
                          color: BooklyColors.neutral400,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),

              ProfileTile(
                icon: Icon(Icons.person, color: BooklyColors.neutral900),
                text: 'Personal Information',
                onTap: () {},
              ),
              ProfileTile(
                icon: Icon(Icons.credit_card, color: BooklyColors.neutral900),
                text: 'Payment Methods',
                onTap: () {},
              ),
              ProfileTile(
                icon: Icon(
                  Icons.location_on_outlined,
                  color: BooklyColors.neutral900,
                ),
                text: 'My Addresses',
                onTap: () {},
              ),
              ProfileTile(
                icon: Icon(Icons.star_border, color: BooklyColors.neutral900),
                text: 'My Reviews',
                onTap: () {},
              ),
              ProfileTile(
                icon: Icon(
                  Icons.offline_bolt_outlined,
                  color: BooklyColors.neutral900,
                ),
                text: 'Rewards & Offers',
                onTap: () {},
              ),
              ProfileTile(
                icon: Icon(
                  Icons.earbuds_outlined,
                  color: BooklyColors.neutral900,
                ),
                text: 'Refer & Earn',
                onTap: () {},
              ),
              SizedBox(height: 12),
              ProfileTile(
                icon: Icon(Icons.help_outline, color: BooklyColors.neutral900),
                text: 'Help & Support',
                onTap: () {},
              ),
              SizedBox(height: 12),
              ProfileTile(
                icon: Icon(
                  Icons.logout_outlined,
                  color: BooklyColors.neutral900,
                ),
                text: 'Logout',
                onTap: () {},
                withArrow: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
