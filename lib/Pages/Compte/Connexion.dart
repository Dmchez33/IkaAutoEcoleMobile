import 'package:flutter/material.dart';
class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      Image.asset("assets/images/connexion_autoEcole.png"),
                      Text("Connexion", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2),)
                    ],
                  )
              ),
              Container(
                margin: EdgeInsets.all(20),
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
                child: TextFormField(

                  decoration: const InputDecoration(

                    hintText: 'Email ou numéro téléphone',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez votre email ou numéro téléphone';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
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
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Mot de passe',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrez le mot de passe';
                    }
                    return null;
                  },
                ),
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
