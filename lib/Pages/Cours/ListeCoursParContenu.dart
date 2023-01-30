
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DetailCours.dart';

class ListeCoursParContenu extends StatefulWidget {
  const ListeCoursParContenu({Key? key}) : super(key: key);

  @override
  State<ListeCoursParContenu> createState() => _ListeCoursParContenuState();
}

class _ListeCoursParContenuState extends State<ListeCoursParContenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF1A237E),
      centerTitle: true,
      title: const Text('Cours'),

    ),
      body: Column(

        children:  [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ClipPath(
              clipper: BottomArcClipper(),
              child: Container(
                color: Color(0xFF1A237E),
              ),
            ),
          ),
          Card(
            //margin: EdgeInsets.all(5),
            child: ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailCoursPage(),
                  ),
                );
              },
              leading: Container(

                width: 20,
                color: Color(0xFF6000EE),
              ),
              title: Text("Definition"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                width: 20,
                color: Color(0xFF6000EE),
              ),
              title: Text("Règles générales"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                width: 20,
                color: Color(0xFF6000EE),
              ),
              title: Text("Cas d’interdiction"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                width: 20,
                color: Color(0xFF6000EE),
              ),
              title: Text("Sur autoroute"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                width: 20,
                color: Color(0xFF6000EE),
              ),
              title: Text("Signalisation"),
            ),
          )

        ],
      ),
    );
  }
}
class BottomArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}