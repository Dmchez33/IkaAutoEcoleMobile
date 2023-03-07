import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ika_auto_ecole/Pages/utilities/keys.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../../Model/User.dart';
import 'Connexion.dart';
class Incription extends StatefulWidget {
  const Incription({Key? key}) : super(key: key);

  @override
  State<Incription> createState() => _IncriptionState();
}

class _IncriptionState extends State<Incription> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  User _user = User(username: '', email: '', password: '', nom: '', prenom: '', telephone: '');
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Envoyer les données de l'utilisateur à l'API ici.
      // Encoder les données de l'utilisateur en JSON.
      Map<String, dynamic> data = {
        "username": _user.username,
        "email": _user.email,
        "password": _user.password,
        "nom": _user.nom,
        "prenom": _user.prenom,
        "telephone": _user.telephone,
      };

      var jsonData = jsonEncode(data);
        print(jsonData);
      // Envoyer les données de l'utilisateur à l'API.
      http.post(Uri.parse('$url/apprenant/save'),
          headers: {"Content-Type": "application/json"},
          body: jsonData).then((response) {
        if (response.statusCode == 200) {
          // Afficher un message de réussite ou rediriger l'utilisateur vers une autre page.
          print("donner envoyer avec succes");
          
          /*btn1(context);*/
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
                    Text('Votre compte est cré avec success '
                        ,
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
                        Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
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
        'Alerte',
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset("assets/logo/Logo (1).png",width: 195,),
                    Text("INSCRIPTION", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 2),)
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.only(top:5,left: 20,right: 20,bottom: 5),

                child: TextFormField(
                  //obscureText: true,
                  //controller: passwordController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      // icon: Icon(
                      //   Icons.person,
                      //   color: Colors.black,
                      // ),
                      hintText: "Username *",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez username';
                    }
                    return null;
                  },
                  onSaved: (value) => _user.username = value!,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:5,left: 20,right: 20,bottom: 5),

                child: TextFormField(
                  //obscureText: true,
                  //controller: passwordController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      // icon: Icon(
                      //   Icons.person,
                      //   color: Colors.black,
                      // ),
                      hintText: "Prénom *",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez votre prénom';
                    }
                    return null;
                  },
                  onSaved: (value) => _user.prenom = value!,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:5,left: 20,right: 20,bottom: 5),

                child: TextFormField(
                  //obscureText: true,
                  //controller: passwordController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      // icon: Icon(
                      //   Icons.person,
                      //   color: Colors.black,
                      // ),
                      hintText: "Nom *",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez votre Nom';
                    }
                    return null;
                  },
                  onSaved: (value) => _user.nom = value!,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:5,left: 20,right: 20,bottom: 5),

                child: TextFormField(
                  //obscureText: true,
                  //controller: passwordController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      // icon: Icon(
                      //   Icons.phone_android,
                      //   color: Colors.black,
                      // ),
                      hintText: "Numéro de téléphone *",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez le numero de téléphone';
                    }
                    return null;
                  },
                  onSaved: (value) => _user.telephone = value!,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:5,left: 20,right: 20,bottom: 5),

                child: TextFormField(
                  //obscureText: true,
                  //controller: passwordController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      // icon: Icon(
                      //   Icons.mail,
                      //   color: Colors.black,
                      // ),
                      hintText: "Email *",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez votre email';
                    }
                    return null;
                  },
                  onSaved: (value) => _user.email = value!,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:5,left: 20,right: 20,bottom: 5),

                child:TextFormField(
                  obscureText: true,
                  //controller: passwordController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      // icon: Icon(
                      //   Icons.lock,
                      //   color: Colors.black,
                      // ),
                      hintText: "Mot de passe *",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez le mot de passe';
                    }
                    return null;
                  },
                  onSaved: (value) => _user.password = value!,
                ),

              ),
        /*Container(
                margin: EdgeInsets.only(top:5,left: 20,right: 20,bottom: 5),
                decoration: const BoxDecoration(
                  //borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(2.5, 1.0),
                      //blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  child: Text('UPLOAD FILE'),
                  onPressed: () async {
                    var picked = await FilePicker.platform.pickFiles();
                    if (picked != null) {
                      Text("File name : ${picked.files.first.name}");
                      print(picked);
                    }
                  },
                )
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'File',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: _pickFile,
                    ),
                  ),
                  enabled: false ,
                  controller: TextEditingController(text: _fileName),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF6200EE)),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                        _submit();
                      }
                    },
                    child: const Text('Inscricre'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget btn1(BuildContext context) {
    return MaterialButton(
      //minWidth: 300,
      color:Color(0xFF6200EE),
      onPressed: () =>
          Dialogs.materialDialog(
            color: Colors.white,
            msg: 'Félicitations, votre inscription a été effectuée avec succès ! Vous pouvez désormais accéder à votre compte. ',
            title: 'Alerte',
            lottieBuilder: Lottie.asset(
          'assets/cong_example.json',
          fit: BoxFit.contain,
        ),
            dialogWidth: kIsWeb ? 0.3 : null,
            context: context,
            actions: [
              IconsButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                          (Route<dynamic> route) => false);
                },
                text: 'Ok',
                iconData: Icons.done,
                color: Color(0xFF1A237E),
                textStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
            ],
          ),
      child: Text("Reserver",style: TextStyle(color: Colors.white),),
    );
  }
  Widget btn2(BuildContext context) {
    return MaterialButton(
      //minWidth: 300,
      color:Color(0xFF6200EE),
      onPressed: () =>
          Dialogs.materialDialog(
            color: Colors.white,
            msg: 'Désolé, une erreur s\'est produite lors de l\'inscription. Veuillez vérifier vos informations et essayer à nouveau.',
            title: 'Alerte',
            lottieBuilder: Lottie.asset(
              'assets/cong_example.json',
              fit: BoxFit.contain,
            ),
            dialogWidth: kIsWeb ? 0.3 : null,
            context: context,
            actions: [
              IconsButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Ok',
                iconData: Icons.done,
                color: Color(0xFF1A237E),
                textStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
            ],
          ),
      child: Text("Reserver",style: TextStyle(color: Colors.white),),
    );
  }
}
