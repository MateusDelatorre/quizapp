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
