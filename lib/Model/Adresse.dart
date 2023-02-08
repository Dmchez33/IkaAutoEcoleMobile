import 'dart:convert';

class Adresses {
  int? id;
  String? longitude;
  String? latitude;
  String? ville;
  String? quartier;
  String? telephone;
  Null? autoecole;

  Adresses(
      {this.id,
        this.longitude,
        this.latitude,
        this.ville,
        this.quartier,
        this.telephone,
        this.autoecole});

  Adresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    ville = json['ville'];
    quartier = json['quartier'];
    telephone = json['telephone'];
    autoecole = json['autoecole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['ville'] = this.ville;
    data['quartier'] = this.quartier;
    data['telephone'] = this.telephone;
    data['autoecole'] = this.autoecole;
    return data;
  }

}