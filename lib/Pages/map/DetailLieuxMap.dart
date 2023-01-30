import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailLieuxMap extends StatefulWidget {
  const DetailLieuxMap({Key? key}) : super(key: key);

  @override
  State<DetailLieuxMap> createState() => _DetailLieuxMapState();
}

class _DetailLieuxMapState extends State<DetailLieuxMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Detail Lieux'),

      ),
      body: Column(
        children: [
        Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          color: Color(0xFF1A237E),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),

        ),
          //CONTENAIRE CONTENANT LE CONTACT DE L'UTILISATEUR
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              child: ListTile(
                leading: Image.asset("assets/images/kanaga.jpg"),
                title: Container(
                  margin: EdgeInsets.only(left: 100,bottom: 5),
                    child: Text("Contact",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(left: 70),
                  child: Column(

                    children: [
                      Row(
                        children: const [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text("20 23 01 02"),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text("66 73 01 99"),
                        ],
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),

          //CONTAINER CONTENANT LE LA LOCALISATION DE L'AUTOECOLE
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: const [
                Card(
                  child: Text("Localisation",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
