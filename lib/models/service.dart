class Service {
  final int id;
  final String title;
  final String providerName;
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
  final String distance;
  final String address;
  final List<String> tags;
  final int categoryId;
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
    required this.availableTimes,
    required this.categoryId,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] as int,
      title: json['title'] as String,
      categoryId: json['categoryId'] as int,
      providerName: json['providerName'] as String,
      specialistName: json['specialistName'] as String,
      specialistRole: json['specialistRole'] as String,
      specialistImagePath: json['specialistImagePath'] as String,
      shortDescription: json['shortDescription'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'] as int,
      price: json['price'] as int,
      durationMinutes: json['durationMinutes'] as int,
      distance: json['distance'] as String,
      address: json['address'] as String,
      tags: List<String>.from(json['tags'] as List),
      availableTimes: List<String>.from(json['availableTimes'] as List),
    );
  }
}

