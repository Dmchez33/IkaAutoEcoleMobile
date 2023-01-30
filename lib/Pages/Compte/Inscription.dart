import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
class Incription extends StatefulWidget {
  const Incription({Key? key}) : super(key: key);

  @override
  State<Incription> createState() => _IncriptionState();
}

class _IncriptionState extends State<Incription> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

/*  String _fileName = '';
  Future<void> _pickFile() async {
    final file = await FilePicker.platform.pickFiles();
    if (file != null) {
      setState(() {
        _fileName = file.files.first.path!;
      });
    }
  }*/

  //METHODE PERMETTANT DE FAIRE LA CONNEXION
  /*signUp(String username, String password,) async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
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
  }*/

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
                    Image.asset("assets/logo/logonoir.png", width: 150,),
                    Text("Inscription", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2),)
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
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "Username",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez username';
                    }
                    return null;
                  },
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
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "Prénom",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez votre prénom';
                    }
                    return null;
                  },
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
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "Nom",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez votre Nom';
                    }
                    return null;
                  },
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
                      icon: Icon(
                        Icons.phone_android,
                        color: Colors.black,
                      ),
                      hintText: "Numéro de téléphone",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez le numero de téléphone';
                    }
                    return null;
                  },
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
                      icon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      hintText: "Email",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez votre email';
                    }
                    return null;
                  },
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
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: "Mot de passe",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez le mot de passe';
                    }
                    return null;
                  },
                ),

              ),
              Container(
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
                /*TextField(
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
                ),*/
              ),
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
                      }
                    },
                    child: const Text('Connecter'),
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
