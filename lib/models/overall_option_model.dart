class OverallOption {
  int id;
  int questionId;
  String optionText;
  int isCorrect;

  OverallOption({
    required this.id,
    required this.questionId,
    required this.optionText,
    required this.isCorrect,
  });

  factory OverallOption.fromJson(Map<String, dynamic> json) {
    return OverallOption(
        id: (json['id']??"") as int,
        questionId: (json['overall_quiz_id']??"") as int,
        optionText: (json['option_text']??"") as String,
        isCorrect: (json['is_correct']??"") as int
    );
  }

}