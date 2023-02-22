
import 'dart:convert';

import 'package:ika_auto_ecole/Model/Panneaux.dart';

import 'package:http/http.dart' as http;
import 'package:ika_auto_ecole/Model/TypeCours.dart';

import '../Model/TypeDeCourOuvert.dart';
import '../Model/course.dart';
import '../Pages/utilities/keys.dart';

class CoursService{
  Future<List<Cours>> getAllTypeCours() async {
    final http.Response response = await http.get(
      Uri.parse('${url}/cours/getCours'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );



    print("courspanneux: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((typeCours) => Cours.fromJson(typeCours)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }


  //Methode permettant d'obtenir les panneaux par son type
  /*Future<List<contenuCours>> getAllContenuCours() async {
    final http.Response response = await http.get(
      Uri.parse('${url}/cours/getCours'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );



    print("getpanneauxParType: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((contenucours) => contenuCours.fromJson(contenucours)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }*/

  //Methode permettant d'obtenir les panneaux par son type
  Future<List<contenuCours>> getAllContenuCoursBys(int? id) async {
    final http.Response response = await http.get(
      Uri.parse('${url}/cours/getContenuByCour/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );



    print("getpanneauxParType: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((contenucours) => contenuCours.fromJson(contenucours)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }

  Future<List<contenuCours>> getAllContenu(int? id) async {
    final http.Response response = await http.get(
      Uri.parse('${url}/cours/getContenu/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );



    print("getpanneauxParType: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((contenucoursbyid) => contenuCours.fromJson(contenucoursbyid)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }
}