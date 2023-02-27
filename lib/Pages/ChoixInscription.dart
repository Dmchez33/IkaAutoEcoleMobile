import 'package:flutter/material.dart';

import 'Compte/DemageInscriptionAutoEcole.dart';
import 'Compte/Inscription.dart';

class ChoixInscription extends StatelessWidget {
  const ChoixInscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo/Logo (1).png"),
            SizedBox(height: 10.0),
            Text(
              "Bienvenue sur l'application ikaAutoEcole",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,

                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Color(0xFF1A237E),
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Veuillez sélectionner votre type d'inscription :",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Incription(),
                  ),
                );
                // L'utilisateur a cliqué sur le bouton "Inscription utilisateur"
              },
              child: Text("Inscription utilisateur"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A237E),
                minimumSize: Size(double.infinity, 50.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InscriptionProprietaireAutoEcolePage(),
                  ),
                );
                // L'utilisateur a cliqué sur le bouton "Inscription propriétaire d'auto-école"
              },
              child: Text("Inscription propriétaire d'auto-école"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A237E),
                minimumSize: Size(double.infinity, 50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
