// import 'dart:ffi';

import 'TypeDeCourOuvert.dart';

class contenuCours {
  int? id;
  String? titre;
  String? description;
  String? vocal;
  String? image;
  Cours? cours;

  contenuCours(
      {this.id,
        this.titre,
        this.description,
        this.vocal,
        this.image,
        this.cours});

  contenuCours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    description = json['description'];
    vocal = json['vocal'];
    image = json['image'];
    cours = json['cours'] != null ? new Cours.fromJson(json['cours']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titre'] = this.titre;
    data['description'] = this.description;
    data['vocal'] = this.vocal;
    data['image'] = this.image;
    if (this.cours != null) {
      data['cours'] = this.cours!.toJson();
    }
    return data;
  }
}