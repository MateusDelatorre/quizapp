import 'package:fpdart/fpdart.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';
import 'package:quizapp/domain/error/failure.dart';
import 'package:quizapp/domain/repository/questionnaire_repository.dart';

class QuestionnaireUseCase {
  final QuestionnaireRepository _repository;

  QuestionnaireUseCase(this._repository);

  Future<Either<Failure, Questionnaire>> getQuestionnaire(String id) async {
    return await _repository.getQuestionnaire(id);
  }

  String getNextId(String id, bool won) {
    switch(id){
      case "1.1":
        if(won)
          return "2.1";
        else
          return "1.2";
      case "1.2":
        if(won)
          return "2.1";
        else
          return "1.3";
      case "1.3":
        if(won)
          return "2.1";
        else
          return id;
      case "2.1":
        if(won)
          return "3.1";
        else
          return "2.2";
      case "2.2":
        if(won)
          return "3.1";
        else
          return "2.3";
      case "2.3":
        if(won)
          return "3.1";
        else
          return id;
      case "3.1":
        if(won)
          return id;
        else
          return "3.2";
      case "3.2":
        if(won)
          return id;
        else
          return "3.3";
      case "3.3":
        if(won)
          return id;
        else
          return id;
      default:
        return id;
    }
  }
}
