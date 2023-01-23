import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Model/course.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();
    _getCourses();
  }

  _getCourses() async {
    
    print("bonjour");
    final response = await http.get(Uri.parse('http://192.168.137.208:8080/api/cours/getCours'));
print(response.body);
    if (response.statusCode == 200) {
      // Si la réponse est OK, on parse les données JSON
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _courses = data.map((e) => Course.fromJson(e)).toList();
      });
    } else {
      // Sinon, on affiche une erreur
      print("erreur de connection");
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cours'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: _courses.map((course) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.network(course.image),
                Text(course.libelle),
                
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
