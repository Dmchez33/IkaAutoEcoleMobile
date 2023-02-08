class TypeCours {
  int? id;
  String? nomcours;
  String? image;

  TypeCours({this.id, this.nomcours, this.image});

  TypeCours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomcours = json['nomcours'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomcours'] = this.nomcours;
    data['image'] = this.image;
    return data;
  }
}