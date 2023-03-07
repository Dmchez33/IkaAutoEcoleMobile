import 'dart:convert';

import 'package:ika_auto_ecole/Model/AutoEcole.dart';

import '../Model/Adresse.dart';

import 'package:http/http.dart' as http;

import '../Pages/utilities/keys.dart';

class AdresseService{

  Future<List<Adresses>> getAllAdresses() async {
    final http.Response response = await http.get(
      Uri.parse('${url}/AutoEcole/getallAdresse'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    

    print("Status: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((adresse) => Adresses.fromJson(adresse)).toList();
    } else {
      throw Exception('ERREUR');
    }
  }

  Future<List<AutoEcole>> getAutoEcoleByAdresse(String? quartier) async{
    final http.Response response = await http.get(Uri.parse('${url}/AutoEcole/getAutoEcole/${quartier}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("autoecoleByQuartier:${response.body}");
    if(response.statusCode == 200){
      final List<dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((autoecole) =>AutoEcole.fromJson(autoecole)).toList();
    }else{
      throw Exception('ERREUR');
    }


  }

  Future<AutoEcole> getAutoEcoleById(int? id) async{
    final http.Response response = await http.get(Uri.parse('${url}/AutoEcole/getbyId/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("autoecoleByID:${response.body}");
    if(response.statusCode == 200){
      final  jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return AutoEcole.fromJson(jsonResponse);
    }else{
      throw Exception('ERREUR');
    }


  }
}
