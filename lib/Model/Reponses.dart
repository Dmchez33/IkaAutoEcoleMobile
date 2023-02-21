import 'Question.dart';

class Reponse {
  int? id;
  String? reponse;
  bool? iscorrect;
  Question? question;

  Reponse({this.id, this.reponse, this.iscorrect, this.question});

  Reponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reponse = json['reponse'];
    iscorrect = json['iscorrect'];
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reponse'] = this.reponse;
    data['iscorrect'] = this.iscorrect;
    if (this.question != null) {
      data['question'] = this.question!.toJson();
    }
    return data;
  }
}