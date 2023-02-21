import 'package:ika_auto_ecole/Model/Quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Pages/utilities/keys.dart';
class QuizService{

  Future<List<Quiz>> getAllQuiz() async{
    final http.Response response = await http.get(
      Uri.parse('${url}/quiz/getAllQuiz'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );


    print("Quiz: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((quiz) => Quiz.fromJson(quiz)).toList();
    } else {
      throw Exception('Failed to retrieve AutoEcole');
    }
  }
}