import 'package:flutter/material.dart';

class compte extends StatefulWidget {
  const compte({Key? key}) : super(key: key);

  @override
  _compteState createState() => _compteState();
}

class _compteState extends State<compte> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Profile",style: TextStyle(fontSize: 18),),
                  
              ),
              Tab(
                  child: Text(  "Statistique",style: TextStyle(fontSize: 18),)
              ),

            ],
          ),
          backgroundColor: Color(0xFF1A237E),
          centerTitle: true,
          title: const Text('Compte',),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                if
              ],
            ),
            Icon(Icons.directions_transit),

          ],
        ),
      ),
    );
  }
}
