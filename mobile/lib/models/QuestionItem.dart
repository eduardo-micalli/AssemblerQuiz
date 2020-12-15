class QuestionItem {
  String assemblerName;
  int correctAnswer;
  List<String> answers;

  QuestionItem({this.assemblerName, this.correctAnswer, this.answers});

  QuestionItem.fromJson(Map<String, dynamic> json) {
    assemblerName = json['assemblerName'];
    correctAnswer = json['correctAnswer'];
    answers = json['answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assemblerName'] = this.assemblerName;
    data['correctAnswer'] = this.correctAnswer;
    data['answers'] = this.answers;
    return data;
  }
}
