class TypePanneaux {
  int? id;
  String? type;
  String? image;

  TypePanneaux({this.id, this.type, this.image});

  TypePanneaux.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['image'] = this.image;
    return data;
  }
}
