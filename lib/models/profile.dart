class Profile {
  final String name;
  final String surname;
  final String email;
  final String imagePath;

  Profile({
    required this.name,
    required this.surname,
    required this.email,
    required this.imagePath,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      imagePath: json['imagePath'],
    );
  }
}
