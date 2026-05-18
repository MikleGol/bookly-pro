import 'category.dart';

class Service {
  final int id;
  final String title;

  /// Например: The Barber Club / Pure Wellness Spa
  final String providerName;

  /// Например: Senior Barber / Spa Therapist
  final String specialistName;

  final String specialistRole;
  final String specialistImagePath;

  final String shortDescription;
  final String description;

  final String imagePath;
  final double rating;
  final int reviewsCount;

  final int price;
  final int durationMinutes;

  /// Например: 0.5 km away
  final String distance;

  /// Например: 123 Main Street, Austin, TX
  final String address;

  final List<String> tags;
  final Category category;
  final List<String> availableTimes;

  Service({
    required this.id,
    required this.title,
    required this.providerName,
    required this.specialistName,
    required this.specialistRole,
    required this.specialistImagePath,
    required this.shortDescription,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.durationMinutes,
    required this.distance,
    required this.address,
    required this.tags,
    required this.category,
    required this.availableTimes,
  });
}
