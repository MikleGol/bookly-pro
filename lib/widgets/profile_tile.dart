import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bookly_colors.dart';

class ProfileTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onTap;
  final bool withArrow;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.withArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: onTap,
        leading: icon,
        title: Text(
          text,
          style: TextStyle(
            color: BooklyColors.neutral900,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: withArrow
            ? Icon(CupertinoIcons.right_chevron, color: BooklyColors.neutral400)
            : null,
      ),
    );
  }
}
