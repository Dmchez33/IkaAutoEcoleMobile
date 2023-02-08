import 'Role.dart';

class AdminAutoEcole {
  int? id;
  String? username;
  String? email;
  String? password;
  bool? status;
  List<Roles>? roles;
  String? datenaissance;
  String? lieuxnaissance;
  Null? image;
  String? nomautoecole;
  Null? telephone;
  Null? etat;

  AdminAutoEcole(
      {this.id,
        this.username,
        this.email,
        this.password,
        this.status,
        this.roles,
        this.datenaissance,
        this.lieuxnaissance,
        this.image,
        this.nomautoecole,
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
    datenaissance = json['datenaissance'];
    lieuxnaissance = json['lieuxnaissance'];
    image = json['image'];
    nomautoecole = json['nomautoecole'];
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
    data['datenaissance'] = this.datenaissance;
    data['lieuxnaissance'] = this.lieuxnaissance;
    data['image'] = this.image;
    data['nomautoecole'] = this.nomautoecole;
    data['telephone'] = this.telephone;
    data['etat'] = this.etat;
    return data;
  }
}