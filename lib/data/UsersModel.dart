import 'package:edulab/data/Subject.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class myUser {
  String name;
  String email;
  String password;
  String image = "";
  String id;
  String role;
  List<Subject> userSubject = [];

  myUser({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    this.image = "",
    this.role = "user",
  });

  factory myUser.fromJson(Map<String, dynamic> json) => myUser(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        image: json['image'],
        id: json['id'],
        role: json['role'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'image': image,
        'id': id,
        'role': role,
      };
}

//create provider for main user
final userProvider = StateProvider<myUser>((ref) {
  return myUser(
    name: "",
    email: "",
    password: "",
    id: "",
  );
});
