import 'dart:convert';

import 'AdminAutoEcole.dart';
import 'Adresse.dart';
import 'TypeCours.dart';
import 'Vehicule.dart';

import 'package:http/http.dart' as http;
class AutoEcole {
  int? id;
  String? nom;
  String? telephone;
  String? rue;
  String? porte;
  bool? status;
  List<Adresses>? adresses;
  List<Vehicules>? vehicules;
  List<TypeCours>? typeCours;
  List<Null>? apprenants;
  AdminAutoEcole? adminAutoEcole;

  AutoEcole(
      {this.id,
      this.nom,
      this.telephone,
      this.rue,
      this.porte,
      this.status,
      this.adresses,
      this.vehicules,
      this.typeCours,
      this.apprenants,
      this.adminAutoEcole});

  AutoEcole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    telephone = json['telephone'];
    rue = json['rue'];
    porte = json['porte'];
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
    data['telephone'] = this.telephone;
    data['rue'] = this.rue;
    data['porte'] = this.porte;
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
