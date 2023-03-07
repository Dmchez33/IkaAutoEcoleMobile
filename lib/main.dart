import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/Compte/Connexion.dart';
import 'Pages/HomePage.dart';
import 'Pages/carousel.dart';
import 'Provider/AutoecoleDataProvider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AutoecoleDataProvider>(
      create: (context) => AutoecoleDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
          theme: ThemeData(
            fontFamily: 'Roboto',
            // autres propriétés du thème
          ),
        home:FutureBuilder(
          future: _checkUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return snapshot.data;
            }
            return CircularProgressIndicator();
          },
        ),

      ),
    );
  }
  Future<Widget> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    if (isLoggedIn) {
      return MainPage();
    }
    return CarouselPage();
  }
}

