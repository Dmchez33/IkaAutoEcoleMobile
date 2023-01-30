import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../HomePage.dart';
import '../carousel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  heardSection(),
                  textSection(),
                  buttonSection(),
                ],
              ),
      ),
    );
  }

  //METHODE PERMETTANT DE FAIRE LA CONNEXION
  signIn(String username, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'username': username, 'password': password};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    final msg = jsonEncode({"username": username, "password": password});

    var response = await http.post(
        Uri.parse('http://192.168.43.58:8080/api/auth/signin'),
        body: msg,
        headers: headers);
    jsonResponse = json.decode(response.body);

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    print('JSONREPONSE:${jsonResponse}');
    if (jsonResponse != null) {
      setState(() {
        _isLoading = false;
      });
      sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
      sharedPreferences.setString("body", response.body);
      //isLoggedIn
      sharedPreferences.setBool("isLoggedIn", true);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MainPage()),
          (Route<dynamic> route) => false);
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF6200EE)),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          signIn(emailController.text, passwordController.text);
        },
        child: const Text(
          'Connecter',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //SECTION CONCERNANT LES DEUX CHAMPS INPUTS
  Container textSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: "username",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            height: 30.0,
          ),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: "Mot de passe",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  //SECTION CONCERNANT LA PLACE DU LOGO
  Container heardSection() {
    return Container(
        margin: const EdgeInsets.only(
          top: 40.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          children: [
            Image.asset("assets/images/connexion_autoEcole.png"),
            const Text(
              "Connexion",
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 2),
            )
          ],
        ));
  }
}
