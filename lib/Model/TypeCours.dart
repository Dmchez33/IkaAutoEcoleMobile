class TypeCours {
  int? id;
  String? nomcours;
  String? image;
  Null? autoecole;

  TypeCours({this.id, this.nomcours, this.image, this.autoecole});

  TypeCours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomcours = json['nomcours'];
    image = json['image'];
    autoecole = json['autoecole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomcours'] = this.nomcours;
    data['image'] = this.image;
    data['autoecole'] = this.autoecole;
    return data;
  }
}