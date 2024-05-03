part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();
}

class GetQuizEvent extends QuizEvent {
  const GetQuizEvent({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class NextQuestionEvent extends QuizEvent {
  const NextQuestionEvent();

  @override
  List<Object?> get props => [];
}

class SelectAnswerEvent extends QuizEvent {
  const SelectAnswerEvent({required this.answer});

  final int answer;

  @override
  List<Object> get props => [answer];
}