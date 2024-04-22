import 'package:quizapp/domain/entities/questionnaire.dart';

abstract class QuestionnaireRepository {
  Future<Questionnaire> getQuestionnaire(String id);
}