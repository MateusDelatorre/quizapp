import 'package:quizapp/data/model/question_model.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';

class QuestionnaireModel extends Questionnaire {
  const QuestionnaireModel({
    super.id = "",
    super.title = "",
    super.questions = const [],
  });

  factory QuestionnaireModel.fromJson(Map<String, dynamic> json, String id) {
    try {
      List<QuestionModel> questions = [];
      for (var question in json[id]) {
        QuestionModel questionModel = QuestionModel.fromJson(question);
        questions.add(questionModel);
      }
      return QuestionnaireModel(id: id, title: "", questions: questions);
    } catch (e) {
      print("data/model/questionnaire_model.dart");
      print(e.toString());
      return const QuestionnaireModel();
    }
  }
}
