import 'dart:convert';

import 'AdminAutoEcole.dart';
import 'Adresse.dart';
import 'TypeCours.dart';
import 'Vehicule.dart';

import 'package:http/http.dart' as http;
class AutoEcole {
  int? id;
  String? nom;
  bool? status;
  List<Adresses>? adresses;
  List<Vehicules>? vehicules;
  List<TypeCours>? typeCours;
  AdminAutoEcole? adminAutoEcole;

  AutoEcole(
      {this.id,
        this.nom,
        this.status,
        this.adresses,
        this.vehicules,
        this.typeCours,
        this.adminAutoEcole});

  AutoEcole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    status = json['status'];
    if (json['adresses'] != null) {
      adresses = <Adresses>[];
      json['adresses'].forEach((v) {
        adresses!.add(new Adresses.fromJson(v));
      });
    }
    if (json['vehicules'] != null) {
      vehicules = <Vehicules>[];
      json['vehicules'].forEach((v) {
        vehicules!.add(new Vehicules.fromJson(v));
      });
    }
    if (json['typeCours'] != null) {
      typeCours = <TypeCours>[];
      json['typeCours'].forEach((v) {
        typeCours!.add(new TypeCours.fromJson(v));
      });
    }

    adminAutoEcole = json['adminAutoEcole'] != null
        ? new AdminAutoEcole.fromJson(json['adminAutoEcole'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['status'] = this.status;
    if (this.adresses != null) {
      data['adresses'] = this.adresses!.map((v) => v.toJson()).toList();
    }
    if (this.vehicules != null) {
      data['vehicules'] = this.vehicules!.map((v) => v.toJson()).toList();
    }
    if (this.typeCours != null) {
      data['typeCours'] = this.typeCours!.map((v) => v.toJson()).toList();
    }
    if (this.adminAutoEcole != null) {
      data['adminAutoEcole'] = this.adminAutoEcole!.toJson();
    }
    return data;
  }
}

Future<List<AutoEcole>> getAllAutoEcole() async {
  final http.Response response = await http.get(
    Uri.parse('http://192.168.43.58:8080/api/AutoEcole/getAll'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  //print("Status: ${response.body}");
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((autoEcole) => AutoEcole.fromJson(autoEcole)).toList();
  } else {
    throw Exception('Failed to retrieve AutoEcole');
  }
}
