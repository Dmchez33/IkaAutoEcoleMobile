// import 'dart:ffi';

class Course {
  int id;
  String libelle;
  String image;
  
  Course({required this.id, required this.libelle, required this.image});
  
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      libelle: json['libelle'],
      image: json['image'],
    );
  }
}
