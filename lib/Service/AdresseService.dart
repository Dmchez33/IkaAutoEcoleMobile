import 'dart:convert';

import '../Model/Adresse.dart';

import 'package:http/http.dart' as http;

class AdresseService{

  Future<List<Adresses>> getAllAdresses() async {
    final http.Response response = await http.get(
      Uri.parse('http://192.168.43.58:8080/api/AutoEcole/getallAdresse'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    

    print("Status: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((adresse) => Adresses.fromJson(adresse)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }
}
