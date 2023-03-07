class Vehicules {
  int? id;
  String? typevehicule;
  String? marquevehicule;
  String? image;
  Null? autoecolee;

  Vehicules(
      {this.id,
      this.typevehicule,
      this.marquevehicule,
      this.image,
      this.autoecolee});

  Vehicules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typevehicule = json['typevehicule'];
    marquevehicule = json['marquevehicule'];
    image = json['image'];
    autoecolee = json['autoecolee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['typevehicule'] = this.typevehicule;
    data['marquevehicule'] = this.marquevehicule;
    data['image'] = this.image;
    data['autoecolee'] = this.autoecolee;
    return data;
  }
}