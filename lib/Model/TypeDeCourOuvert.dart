class Cours {
  int? id;
  String? libelle;
  String? image;


  Cours({this.id, this.libelle, this.image});

  Cours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['libelle'] = this.libelle;
    data['image'] = this.image;

    return data;
  }
}