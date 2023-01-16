import 'package:flutter/material.dart';

class compte extends StatefulWidget {
  const compte({Key? key}) : super(key: key);

  @override
  _compteState createState() => _compteState();
}

class _compteState extends State<compte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF1A237E),
      //   centerTitle: true,
      //   title: const Text('Compte'),
      //   actions: [Image.asset('assets/images/logoIkaAutoEcole.png')],
      // ),
      body: SingleChildScrollView (
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo/logobleu.png",width: 250,),
              const Text(
                "Mon compte",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Vous n'êtes pas connecté",
                style: TextStyle(fontSize: 20),
              ),
              Card(
                color: const Color(0xFF6200EE),
                child: SizedBox(
                  height: 320,
                  child: ListView(padding: const EdgeInsets.all(0), 
                  children: [
                    Card(
                      color: const Color(0xFF6200EE),
                      elevation: 0,
                      child: ListTile(
                        leading: Image.asset("assets/logo/boost.png"),
                        title: const Text(
                          'Inscription gratuite',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: const Color(0xFF6200EE),
                      elevation: 0,
                      child: ListTile(
                        minVerticalPadding: 0,
                        leading: Image.asset("assets/logo/TRUE.png"),
                        title: const Text(
                          'Débloquez la reservation des cours de conduite ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: const Color(0xFF6200EE),
                      elevation: 0,
                      child: ListTile(
                        leading: Image.asset("assets/logo/TRUE.png"),
                        title: const Text(
                          'Débloquez les quiz',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: const Color(0xFF6200EE),
                      elevation: 0,
                      child: ListTile(
                        leading: Image.asset("assets/logo/TRUE.png"),
                        title: const Text(
                          'Accedez à vos résultat',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xFFFFFFFFF)),
      
                          elevation: MaterialStateProperty.all(4),
      
                          //mouseCursor: MaterialStateProperty.all(MouseCursor())
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const listeLieux()),
                          // );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Créer un compte gratuitement',
                              style: TextStyle(color: Colors.black),
                            ),
                            //Icon(Icons.book)
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              const Text(
                "Vous n'êtes pas connecté",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
