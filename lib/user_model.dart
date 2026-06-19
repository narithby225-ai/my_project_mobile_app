class User {
  final String name;
  final String role;
  final String course;
  final String image;

  User({
    required this.name,
    required this.role,
    required this.course,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      role: json['role'],
      course: json['course'],
      image: json['image'],
    );
  }
}
