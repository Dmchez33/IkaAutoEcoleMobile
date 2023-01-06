
import 'package:flutter/material.dart';

class compte extends StatefulWidget {
  const compte({Key? key}) : super(key: key);

  @override
  _compteState createState() => _compteState();
}

class _compteState extends State<compte> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Compte'),
      ),
    );
  }
}