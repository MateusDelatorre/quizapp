class Question{
  final String question;
  final List<String> alternatives;
  final int altCount;
  final int answer;

  const Question({
    this.question = "",
    this.alternatives = const [],
    this.altCount = 0,
    this.answer = 0,
  });

  copyWith({
    String? question,
    List<String>? alternatives,
    int? altCount,
    int? answer,
  }) {
    return Question(
      question: question ?? this.question,
      alternatives: alternatives ?? this.alternatives,
      altCount: altCount ?? this.altCount,
      answer: answer ?? this.answer,
    );
  }
}