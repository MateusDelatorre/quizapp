import 'package:quizapp/domain/entities/question.dart';

class QuestionModel extends Question{
  const QuestionModel({
    super.answer,
    super.question,
    super.altCount,
    super.alternatives
  });

  copy({
    int? answer,
    String? question,
    int? altCount,
    List<String>? alternatives
  }){
    return QuestionModel(
      answer: answer ?? this.answer,
      question: question ?? this.question,
      altCount: altCount ?? this.altCount,
      alternatives: alternatives ?? this.alternatives
    );
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json){
    List<String> alternatives = [];
    for(var altJson in json["alternatives"]) {
      alternatives.add(altJson["alternative"]);
    }
    return QuestionModel(
      question: json['question'],
      answer: json['answer'],
      altCount: json['altCount'],
      alternatives: alternatives
    );
  }
}