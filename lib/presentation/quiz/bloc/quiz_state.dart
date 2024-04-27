part of 'quiz_bloc.dart';

enum QuizStatus { initial, loading, success, failure }
class QuizState extends Equatable {
  const QuizState({
    this.questionnaire = const Questionnaire(),
    this.currentQuestionIndex = 0,
    this.score = 0,
    this.status = QuizStatus.initial,
  });

  final QuizStatus status;
  final Questionnaire questionnaire;
  final int currentQuestionIndex;
  final int score;

  copyWith({
    Questionnaire? questionnaire,
    int? currentQuestionIndex,
    int? score,
    QuizStatus? status,
  }) {
    return QuizState(
      questionnaire: questionnaire ?? this.questionnaire,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      score: score ?? this.score,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [questionnaire, currentQuestionIndex, score, status];
}
