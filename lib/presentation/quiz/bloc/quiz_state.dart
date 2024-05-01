part of 'quiz_bloc.dart';

enum QuizStatus { initial, loading, success, failure }

class QuizState extends Equatable {
  const QuizState({
    this.questionnaire = const Questionnaire(),
    this.currentQuestionIndex = 0,
    this.score = 0,
    this.status = QuizStatus.initial,
    this.questSize = 0,
    this.isAnswered = false,
    this.selectedAnswer = -1,
  });

  final QuizStatus status;
  final Questionnaire questionnaire;
  final int currentQuestionIndex;
  final int score;
  final int questSize;
  final bool isAnswered;
  final int selectedAnswer;

  copyWith({
    Questionnaire? questionnaire,
    int? currentQuestionIndex,
    int? score,
    QuizStatus? status,
    int? questSize,
    bool? isAnswered,
    int? selectedAnswer,
  }) {
    return QuizState(
      questionnaire: questionnaire ?? this.questionnaire,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      score: score ?? this.score,
      status: status ?? this.status,
      questSize: questSize ?? this.questSize,
      isAnswered: isAnswered ?? this.isAnswered,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  @override
  List<Object> get props => [
        questionnaire,
        currentQuestionIndex,
        score,
        status,
        questSize,
        isAnswered,
        selectedAnswer,
      ];
}
