import 'package:circular_image/circular_image.dart';
import 'package:flutter/material.dart';

class listeLieux extends StatefulWidget {
  const listeLieux({Key? key}) : super(key: key);

  @override
  _listeLieuxState createState() => _listeLieuxState();
}

class _listeLieuxState extends State<listeLieux> {
  final _listeLieux = [
    {
      "image":"kanaga.jpg",
      "libelle":"Auto Ecole Liberte",
      "numero":"20 23 01 02/ 66 73 01 99"
    },
    {
      "image":"rectangleviolet.png",
      "libelle":"Auto Ecole Tigana",
      "numero":"76 55 23 23 / 63 63 63 51"
    },
    {
      "image":"rectangleviolet.png",
      "libelle":"Auto Ecole Cherifla",
      "numero":"74 47 53 88 / 60 28 73 83"
    },
    {
      "image":"rectangleviolet.png",
      "libelle":"Auto Ecole La belle conduite",
      "numero":"20 23 01 02 / 66 73 01 99"
    },
    {
      "image":"rectangleviolet.png",
      "libelle":"Auto Ecole Douga",
      "numero":"20 23 01 02 / 66 73 01 99"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Localisation'),
        actions: [Image.asset('assets/images/logoIkaAutoEcole.png')],
      ),
      body: ListView.builder(
        itemCount: _listeLieux.length,
        itemBuilder: (BuildContext context, int index) {
          final liste = _listeLieux[index];
          final image = liste["image"];
          final libelle = liste["libelle"];
          final numero = liste["numero"];
          return Card(
            child: ListTile(
              leading: CircularImage(radius:20, borderWidth:1,borderColor:Colors.white, source: 'assets/images/$image'),
              title: Text('$libelle'),
              trailing: Text('$numero'),
            ),
          );
        },

        ),

    );
  }
}
