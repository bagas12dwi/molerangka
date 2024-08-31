class Option {
  int id;
  int questionId;
  String optionText;
  int isCorrect;

  Option({
    required this.id,
    required this.questionId,
    required this.optionText,
    required this.isCorrect,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
        id: (json['id']??"") as int,
        questionId: (json['question_id']??"") as int,
        optionText: (json['option_text']??"") as String,
        isCorrect: (json['is_correct']??"") as int
    );
  }

}