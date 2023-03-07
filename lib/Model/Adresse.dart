import 'dart:convert';

class Adresses {
  int? id;
  String? ville;
  String? quartier;
  String? longitude;
  String? latitude;

  Adresses({this.id, this.ville, this.quartier, this.longitude, this.latitude});

  Adresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ville = json['ville'];
    quartier = json['quartier'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ville'] = this.ville;
    data['quartier'] = this.quartier;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }

}