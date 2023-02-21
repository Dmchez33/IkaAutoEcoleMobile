class Quiz {
  int? id;
  String? titre;
  String? description;
  String? imageName;
  int? quizDate;

  Quiz({this.id, this.titre, this.description, this.imageName, this.quizDate});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    description = json['description'];
    imageName = json['imageName'];
    quizDate = json['quizDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titre'] = this.titre;
    data['description'] = this.description;
    data['imageName'] = this.imageName;
    data['quizDate'] = this.quizDate;
    return data;
  }
}