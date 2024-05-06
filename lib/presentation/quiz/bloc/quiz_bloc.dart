import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quizapp/data/cache_repository/questionnaire_repo_cache.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';
import 'package:quizapp/domain/use_case/questionnaire_use_case.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/presentation/constants.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({
    required this.id,
  }) : super(const QuizState()) {
    on<GetQuizEvent>(onGetQuiz);
    on<NextQuestionEvent>(onNextQuestion);
    on<SelectAnswerEvent>(onSelectAnswer);
  }

  final String id;
  final QuestionnaireUseCase _questionnaireUseCase =
      QuestionnaireUseCase(QuestionnaireRepoCache());

  onGetQuiz(GetQuizEvent event, Emitter<QuizState> emit) async {
    try {
      var response = await _questionnaireUseCase.getQuestionnaire(id);
      if (response.isLeft()) {
        //emit(state.copyWith(status: QuizStatus.error, message: response.leftMap((l) => l.toString()).toString()));
        return;
      } else if (response.isRight()) {
        Questionnaire q = const Questionnaire();
        final dartMatch = switch (response) {
          Left(value: final l) => 'Left($l)',
          Right(value: final r) => r,
        };
        q = dartMatch as Questionnaire;
        print("Bloc");
        print(q.id);
        emit(state.copyWith(
          questionnaire: dartMatch as Questionnaire,
          status: QuizStatus.success,
        ));
      }
    } catch (e) {
      //emit(state.copyWith(status: QuizStatus.error, message: e.toString()));
    }
  }

  onNextQuestion(NextQuestionEvent event, Emitter<QuizState> emit) {
    emit(state.copyWith(
      currentQuestionIndex: state.currentQuestionIndex + 1,
      isAnswered: false,
      selectedAnswer: -1,
    ));
  }

  onSelectAnswer(SelectAnswerEvent event, Emitter<QuizState> emit) {
    emit(state.copyWith(
      isAnswered: true,
      selectedAnswer: event.answer,
    ));
  }

  Color getTheRightColor(int index) {
    if (state.isAnswered) {
      if (state.questionnaire.questions[state.currentQuestionIndex].answer ==
          index) {
        return kGreenColor;
      } else {
        return kRedColor;
      }
    }
    return kGrayColor;
  }
}
