import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:http/http.dart' as http;

import '../HomePage.dart';
import '../utilities/keys.dart';

class InscriptionProprietaireAutoEcolePage extends StatefulWidget {
  @override
  _InscriptionProprietaireAutoEcolePageState createState() =>
      _InscriptionProprietaireAutoEcolePageState();
}

class _InscriptionProprietaireAutoEcolePageState
    extends State<InscriptionProprietaireAutoEcolePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nomAutoEcoleController = TextEditingController();
  final _villeController = TextEditingController();
  final _quartierController = TextEditingController();
  final _porteController = TextEditingController();
  final _rueController = TextEditingController();
  final _emailController = TextEditingController();
  final _telephoneController = TextEditingController();

  void _submit(String nom, String prenom, String username,String email, String telephone, String nomAutoEcole, String ville, String quartier, String porte, String rue) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Envoyer les données de l'utilisateur à l'API ici.
      // Encoder les données de l'utilisateur en JSON.
      Map<String, dynamic> data = {
        "nom": nom,
        "prenom": prenom,
        "telephone": telephone,
        "username":username,
        "email": email,
        "nomAutoEcole":nomAutoEcole,
        "ville":ville,
        "quartier":quartier,
        "porte":porte,
        "rue":rue
      };

      var jsonData = jsonEncode(data);
      print(jsonData);
      // Envoyer les données de l'utilisateur à l'API.
      http.post(Uri.parse('$url/adminAutoEcole/demande'),
          headers: {"Content-Type": "application/json"},
          body: jsonData
      ).then((response) {
        if (response.statusCode == 200) {
          // Afficher un message de réussite ou rediriger l'utilisateur vers une autre page.
          print("donner envoyer avec succes");
        /*Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);*/
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text('Envoi avec succès'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/carousel/succes.gif',
                      fit: BoxFit.contain,
                      height: 150,
                    ),
                    Text('Nous vous remercions d\'avoir soumis votre demande de création de compte de propriétaire d\'auto-école et d\'enregistrement de votre auto-école sur notre plateforme. '
                        'Veillez verifier votre e-mail pour avoir le reste des informations à fournir',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1A237E),
                        minimumSize: Size(double.infinity, 50.0),
                      ),
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPage()),
                        );
                      },
                    ),
                  ],
                ) ,

              );
            },
          );

        } else {
          // Afficher une erreur.
          String jsonString = response.body;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);
          String message = jsonMap['message'];
          print(message);
          //print(jsonDecode(response.body).);
          _displaySuccessMotionToast(message);

        }
      });

    }

  }
  void _displaySuccessMotionToast(String message) {
    MotionToast.warning(
      title: const Text(
        'Engagement',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(
        '${message}',
        style: TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      dismissable: false,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Inscription propriétaire d'auto-école"),
      ),*/
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Les informations personnelles",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _nomController,
                      decoration: const InputDecoration(
                        labelText: "Nom",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer votre nom";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _prenomController,
                      decoration: const InputDecoration(
                        labelText: "Prénom",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer votre prénom";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: "Nom d'utilisateur",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer un nom d'utilisateur";
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _telephoneController,
                      decoration: const InputDecoration(
                        labelText: "Téléphone",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer numéro de téléphone";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer votre email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Les informations personnelles",
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _nomAutoEcoleController,
                      decoration: const InputDecoration(
                        labelText: "Nom de l'auto-école",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer le nom de votre auto-école";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _villeController,
                      decoration: const InputDecoration(
                        labelText: "Ville",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer le nom de votre ville";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _quartierController,
                      decoration: const InputDecoration(
                        labelText: "Quartier",
                      )
                          .copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      )
                          .copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer le nom de votre quartier";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _porteController,
                      decoration: const InputDecoration(
                        labelText: "Porte",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer le numéro de votre porte";
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*$'))
                      ], // permet uniquement les chiffres
                    ),
                    TextFormField(
                      controller: _rueController,
                      decoration: const InputDecoration(
                        labelText: "Rue",
                      ).copyWith(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                        // Couleur de la bordure lorsqu'il est focused
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer le nom de votre rue";
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*$'))
                      ], // permet uniquement les chiffres
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          bool isChecked = false;

                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return AlertDialog(
                                title: Text('Message d\'engagement', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                                ),textAlign: TextAlign.center,),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Je m\'engage à fournir des informations précises et à jour sur mon entreprise et à respecter les conditions d\'utilisation de votre plateforme.'
                                      ,
                                        textAlign: TextAlign.justify
                                        ,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      CheckboxListTile(
                                        title: Text('Je confirme avoir lu et accepté le message d\'engagement.'
                                          ,
                                          textAlign: TextAlign.justify
                                          ,style: TextStyle(fontSize: 14),),
                                        value: isChecked,
                                        onChanged: (newValue) {
                                          setState(() {
                                            isChecked = newValue!;
                                          });
                                        },
                                        controlAffinity: ListTileControlAffinity.leading,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Annuler',style: TextStyle(color: Colors.red, fontSize: 16),),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: !isChecked ? Text('Continuer',style: TextStyle(fontSize: 16),) : Text('Continuer',style: TextStyle(color: Color(0xFF1A237E), fontSize: 16),),
                                    onPressed: isChecked
                                        ? () {
                                      // L'utilisateur a coché le message d'engagement, on peut continuer.
                                      _submit(_nomController.text,_prenomController.text,_usernameController.text,_emailController.text,_telephoneController.text,_nomAutoEcoleController.text,_villeController.text,_quartierController.text,_porteController.text,_rueController.text);
                                      Navigator.of(context).pop();
                                      // Ajoutez ici le code qui doit être exécuté lorsque l'utilisateur a coché le message d'engagement.
                                    }
                                        : null, // Désactivez le bouton de continuer tant que l'utilisateur n'a pas coché le message d'engagement.
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );



                    }
                  },
                  child: const Text("Envoyer"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A237E),
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
