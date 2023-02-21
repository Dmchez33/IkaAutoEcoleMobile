
import 'dart:convert';

import 'package:ika_auto_ecole/Model/Panneaux.dart';

import 'package:http/http.dart' as http;

import '../Pages/utilities/keys.dart';

class PanneauxService{
  Future<List<PanneauDeConduite>> getAllPanneaux() async {
    final http.Response response = await http.get(
      Uri.parse('${url}/panneauxCours/getAll'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );



    print("courspanneux: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((panneaux) => PanneauDeConduite.fromJson(panneaux)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }


  //Methode permettant d'obtenir les panneaux par son type
  Future<List<PanneauDeConduite>> getAllPanneauxByType(String? typePanneaux) async {
    final http.Response response = await http.get(
      Uri.parse('${url}/panneauxCours/getBytitreType/${typePanneaux}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );



    print("getpanneauxParType: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((panneaux) => PanneauDeConduite.fromJson(panneaux)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }
}