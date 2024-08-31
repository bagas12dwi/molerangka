class OverallUserAnswer {
  String message;
  int optionId;
  String answer;
  bool isCorrect;

  OverallUserAnswer({
    required this.message,
    required this.optionId,
    required this.answer,
    required this.isCorrect
  });

  factory OverallUserAnswer.fromJson(Map<String, dynamic> json) {
    return OverallUserAnswer(
        message: (json['message']??"") as String,
        optionId: (json['option_id']??"") as int,
        answer: (json['answer']??"") as String,
        isCorrect: (json['is_correct']??"") as bool
    );
  }

}
