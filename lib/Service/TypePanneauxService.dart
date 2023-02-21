
import 'dart:convert';

import 'package:ika_auto_ecole/Model/Panneaux.dart';

import 'package:http/http.dart' as http;
import 'package:ika_auto_ecole/Model/TypePanneaux.dart';

import '../Pages/utilities/keys.dart';

class TypePanneauxService{
  Future<List<TypePanneaux>> getAllPanneaux() async {
    final http.Response response = await http.get(
      Uri.parse('${url}/panneauxCours/getAllType'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );



    print("courspanneux: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode( utf8.decode(response.bodyBytes));
      return jsonResponse.map((typepanneaux) => TypePanneaux.fromJson(typepanneaux)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }
}