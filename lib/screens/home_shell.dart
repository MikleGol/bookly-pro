import 'package:bookly_pro/screens/all_bookings_screen.dart';
import 'package:bookly_pro/screens/categories_screen.dart';
import 'package:bookly_pro/screens/home_screen.dart';
import 'package:bookly_pro/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeShell extends StatefulWidget {
  final int initialIndex;

  const HomeShell({super.key, this.initialIndex = 0});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          HomeScreen(),
          CategoriesScreen(),
          AllBookingsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.house_outlined),
            selectedIcon: Icon(Icons.house_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            selectedIcon: Icon(Icons.list),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.bag),
            selectedIcon: Icon(CupertinoIcons.bag),
            label: 'Bookings',
          ),

          NavigationDestination(
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
