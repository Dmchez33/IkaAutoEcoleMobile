
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/TypeDeCourOuvert.dart';
import '../../Model/course.dart';
import '../../Provider/AutoecoleDataProvider.dart';
import '../../Service/CoursService.dart';
import 'DetailCours.dart';

class ListeCoursParContenu extends StatefulWidget {
  final int?  idType;
  ListeCoursParContenu({Key? key, this.idType}) : super(key: key);

  @override
  State<ListeCoursParContenu> createState() => _ListeCoursParContenuState();
}

class _ListeCoursParContenuState extends State<ListeCoursParContenu> {

  //Contenu Cours
  CoursService coursService = CoursService();
  List<contenuCours>? contenu;

  getAllCours() async {
    contenu = await coursService.getAllContenuCoursBys(widget.idType);
    Provider
        .of<AutoecoleDataProvider>(context, listen: false)
        .contenu = contenu!;
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getAllCours();
  }

  @override
  Widget build(BuildContext context) {
    if(contenu == null){
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
        const Center(
          child: CircularProgressIndicator(),
        ),
          ]
        )
      );
    }else{
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
            for(int i=0; i<contenu!.length; i++)...[
              Card(
                //margin: EdgeInsets.all(5),
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursPage(idContenu: contenu![i].id,),
                      ),
                    );
                  },
                  leading: Container(

                    width: 20,
                    color: Color(0xFF6000EE),
                  ),
                  title: Text("${contenu![i].titre}"),
                ),
              ),
            ],
          ],
        ),
      );
    }
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