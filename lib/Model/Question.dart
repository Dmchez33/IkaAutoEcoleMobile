import 'Quiz.dart';

class Question {
  int? id;
  String? question;
  String? imageQuiz;
  Quiz? quiz;

  Question({this.id, this.question, this.imageQuiz, this.quiz});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    imageQuiz = json['imageQuiz'];
    quiz = json['quiz'] != null ? new Quiz.fromJson(json['quiz']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['imageQuiz'] = this.imageQuiz;
    if (this.quiz != null) {
      data['quiz'] = this.quiz!.toJson();
    }
    return data;
  }
}