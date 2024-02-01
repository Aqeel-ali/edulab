import 'package:edulab/data/Subject.dart';

class User {
  String name;
  String email;
  String password;
  String image = "";
  String id;
  String stage;
  List<Subject> userSubject = [];

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    this.image = "",
    required this.stage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        image: json['image'],
        id: json['id'],
        stage: json['stage'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'image': image,
        'id': id,
        'stage': stage,
      };
}
