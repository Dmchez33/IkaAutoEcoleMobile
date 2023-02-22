
import 'package:flutter/cupertino.dart';
import 'package:ika_auto_ecole/Model/Panneaux.dart';
import 'package:ika_auto_ecole/Model/TypePanneaux.dart';

import '../Model/Adresse.dart';
import '../Model/AutoEcole.dart';
import '../Model/Quiz.dart';
import '../Model/TypeDeCourOuvert.dart';
import '../Model/course.dart';

class AutoecoleDataProvider with ChangeNotifier {


  List<Adresses> adresses = [];

  List<PanneauDeConduite> panneauDeConduite = [];

  List<TypePanneaux> typePanneaux = [];

  List<Quiz> quiz = [];

  List<Cours> TypeCoursOuvert = [];

  List<contenuCours> contenu = [];

  
}
