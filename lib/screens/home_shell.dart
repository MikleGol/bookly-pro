import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/screens/categories_screen.dart';
import 'package:bookly_pro/screens/home_screen.dart';
import 'package:bookly_pro/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [HomeScreen(), CategoriesScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: BooklyColors.primary200,
        elevation: 1,

        // цвет фона выбранной иконки
        indicatorColor: BooklyColors.primary400.withValues(alpha: 0.2),

        // цвет при нажатии/hover/focus
        overlayColor: WidgetStateProperty.all(
          BooklyColors.primary100.withValues(alpha: 0.2),
        ),

        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),

        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              color: BooklyColors.primary400,
              fontWeight: FontWeight.w600,
            );
          }

          return TextStyle(
            color: BooklyColors.neutral400,
            fontWeight: FontWeight.w500,
          );
        }),

        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.house_outlined,
              color: BooklyColors.neutral400,
            ),
            selectedIcon: Icon(
              Icons.house_outlined,
              color: BooklyColors.primary400,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.list,
              color: BooklyColors.neutral400,
            ),
            selectedIcon: Icon(
              Icons.list,
              color: BooklyColors.primary400,
            ),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: BooklyColors.neutral400,
            ),
            selectedIcon: Icon(
              Icons.list,
              color: BooklyColors.primary400,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
