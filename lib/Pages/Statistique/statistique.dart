import 'package:flutter/material.dart';

class statistique extends StatefulWidget {
  const statistique({Key? key}) : super(key: key);

  @override
  _statistiqueState createState() => _statistiqueState();
}

class _statistiqueState extends State<statistique> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Statistique'),
      ),
    );
  }
}