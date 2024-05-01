import 'package:fpdart/fpdart.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';
import 'package:quizapp/domain/error/failure.dart';

abstract class QuestionnaireRepository {
  Future<Either<Failure, Questionnaire>> getQuestionnaire(String id);
}
