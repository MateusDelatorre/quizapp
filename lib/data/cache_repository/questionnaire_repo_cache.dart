import 'package:quizapp/data/model/questionnaire_model.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';
import 'package:quizapp/domain/repository/questionnaire_repository.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class QuestionnaireRepoCache extends QuestionnaireRepository{
  QuestionnaireRepoCache();

  @override
  Future<Questionnaire> getQuestionnaire(String id) async {
    String jsonString = await rootBundle.loadString("assets/questions/questionnaire.json");
    Map<String, dynamic> json = jsonDecode(jsonString);
    return QuestionnaireModel.fromJson(json[id], id);
  }

}