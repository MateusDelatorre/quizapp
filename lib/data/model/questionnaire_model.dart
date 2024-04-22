import 'package:quizapp/data/model/question_model.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';

class QuestionnaireModel extends Questionnaire{
  const QuestionnaireModel({
    super.id = "",
    super.title = "",
    super.questions = const [],
  });

  factory QuestionnaireModel.fromJson(Map<String, dynamic> json, String id){
    List<dynamic> questionList = json as List;
    List<QuestionModel> questions = [];
    for (var question in questionList) {
      QuestionModel questionModel = QuestionModel.fromJson(question);
      questions.add(questionModel);
    }
    return QuestionnaireModel(
      id: json[id],
      title: "",
      questions: questions
    );

  }

}