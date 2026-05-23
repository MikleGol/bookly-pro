import 'dart:convert';

class Category {
  final int id;
  final String title;
  final String imagePath;

  Category({required this.id, required this.title, required this.imagePath});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      imagePath: json['imagePath'],
    );
  }
}
