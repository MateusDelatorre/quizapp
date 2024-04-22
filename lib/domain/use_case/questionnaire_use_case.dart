import 'package:quizapp/domain/entities/questionnaire.dart';
import 'package:quizapp/domain/repository/questionnaire_repository.dart';

class QuestionnaireUseCase{
  final QuestionnaireRepository _repository;

  QuestionnaireUseCase(this._repository);

  Future<Questionnaire> getQuestionnaire(String id) async {
    return await _repository.getQuestionnaire(id);
  }
}