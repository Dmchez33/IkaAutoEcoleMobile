import 'Role.dart';

class AdminAutoEcole {
  int? id;
  String? username;
  String? email;
  String? password;
  bool? status;
  List<Roles>? roles;
  String? image;
  String? nom;
  String? prenom;
  String? telephone;
  bool? etat;

  AdminAutoEcole(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.status,
      this.roles,
      this.image,
      this.nom,
      this.prenom,
      this.telephone,
      this.etat});

  AdminAutoEcole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    image = json['image'];
    nom = json['nom'];
    prenom = json['prenom'];
    telephone = json['telephone'];
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['status'] = this.status;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['telephone'] = this.telephone;
    data['etat'] = this.etat;
    return data;
  }
}

class Roles {
  int? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}