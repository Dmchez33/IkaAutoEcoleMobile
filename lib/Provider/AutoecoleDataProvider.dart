
import 'package:flutter/cupertino.dart';

import '../Model/Adresse.dart';
import '../Model/AutoEcole.dart';

class AutoecoleDataProvider with ChangeNotifier {
  List<AutoEcole> _autoecoles = [];
  List<Adresses> adresses = [];
/*List<Adresses> get adresses => _adresses;

 List<AutoEcole> get autoecoles => _autoecoles;

  Future<void> getAutoecole() async {
    // appeler la méthode pour récupérer les données d'Autoecole depuis une source de données externe
    _autoecoles = await getAllAutoEcole();
    notifyListeners();
  }

  Future<dynamic> getAllAdresses() async{
    _adresses = await getAllAdresses();
    notifyListeners();
  }*/

  
}
