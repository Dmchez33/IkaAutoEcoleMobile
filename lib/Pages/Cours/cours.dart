import 'package:flutter/material.dart';

class cours extends StatefulWidget {
  const cours({Key? key}) : super(key: key);

  @override
  _coursState createState() => _coursState();
}

class _coursState extends State<cours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF6200EE),
      //   centerTitle: true,
      //   title: const Text('Cours'),
      //   actions: [Image.asset('assets/images/logoIkaAutoEcole.png')],
      // ),
      body: Center(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 20,
        // marge vertical entre les elements
        mainAxisSpacing: 20,
        // marge horizontal entre les elements
        crossAxisCount: 2,
        // nombre d'elements par ligne
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('first widget')),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
          ),
        ],
      )),
    );
  }
}
