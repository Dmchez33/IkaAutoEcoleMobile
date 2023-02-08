import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String username;
  String email;
  String password;
  String nom;
  String prenom;
  String telephone;

  User({required this.username, required this.email, required this.password, required this.nom, required this.prenom, required this.telephone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        nom: json['nom'],
        prenom: json['prenom'],
        telephone: json['telephone']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['telephone'] = this.telephone;
    return data;
  }
}

Future<User> createUser(User user) async {
  final http.Response response = await http.post(
      Uri.parse('http://localhost:8080/api/apprenant/save'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(user.toJson()),
  );

  if (response.statusCode == 201) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create user');
  }
}
