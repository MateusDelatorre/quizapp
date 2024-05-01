import 'package:fpdart/fpdart.dart';
import 'package:quizapp/data/model/questionnaire_model.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';
import 'package:quizapp/domain/error/cache_error.dart';
import 'package:quizapp/domain/error/failure.dart';
import 'package:quizapp/domain/repository/questionnaire_repository.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class QuestionnaireRepoCache extends QuestionnaireRepository {
  QuestionnaireRepoCache();

  @override
  Future<Either<Failure, Questionnaire>> getQuestionnaire(String id) async {
    try {
      String jsonString =
          await rootBundle.loadString("questions/questionnaires.json");
      Map<String, dynamic> json = jsonDecode(jsonString);
      return Right(QuestionnaireModel.fromJson(json, id));
    } catch (e) {
      print("data/cache_repository/questionnaire_repo_cache.dart");
      print(e.toString());
      return Left(CacheError());
    }
  }
}
