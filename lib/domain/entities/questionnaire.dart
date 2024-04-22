import 'package:quizapp/domain/entities/question.dart';

class Questionnaire {
  final String id;
  final String title;
  final List<Question> questions;

  const Questionnaire({
    this.id = "",
    this.title = "",
    this.questions = const []
  });

  copyWith({
    String? id,
    String? title,
    List<Question>? questions,
  }) {
    return Questionnaire(
      id: id ?? this.id,
      title: title ?? this.title,
      questions: questions ?? this.questions,
    );
  }
}