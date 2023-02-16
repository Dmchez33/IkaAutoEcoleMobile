import 'TypePanneaux.dart';

class PanneauDeConduite {
  int? id;
  String? nom;
  String? description;
  String? vocal;
  String? image;
  TypePanneaux? typePanneaux;

  PanneauDeConduite(
      {this.id,
      this.nom,
      this.description,
      this.vocal,
      this.image,
      this.typePanneaux});

  PanneauDeConduite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    description = json['description'];
    vocal = json['vocal'];
    image = json['image'];
    typePanneaux = json['typePanneaux'] != null
        ? new TypePanneaux.fromJson(json['typePanneaux'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['description'] = this.description;
    data['vocal'] = this.vocal;
    data['image'] = this.image;
    if (this.typePanneaux != null) {
      data['typePanneaux'] = this.typePanneaux!.toJson();
    }
    return data;
  }
}
