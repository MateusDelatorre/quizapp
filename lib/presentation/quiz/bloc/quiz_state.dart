part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  const QuizState({
    this.questionnaire = const Questionnaire(),
    this.currentQuestionIndex = 0,
    this.score = 0,
  });

  final Questionnaire questionnaire;
  final int currentQuestionIndex;
  final int score;

  copyWith({
    Questionnaire? questionnaire,
    int? currentQuestionIndex,
    int? score,
  }) {
    return QuizState(
      questionnaire: questionnaire ?? this.questionnaire,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      score: score ?? this.score,
    );
  }

  @override
  List<Object> get props => [questionnaire, currentQuestionIndex, score];
}
