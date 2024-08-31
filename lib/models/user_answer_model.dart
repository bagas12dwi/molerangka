class UserAnswer {
  String message;
  int optionId;
  String answer;
  int idSubMaterial;
  bool isCorrect;

  UserAnswer({
    required this.message,
    required this.optionId,
    required this.answer,
    required this.idSubMaterial,
    required this.isCorrect
  });

  factory UserAnswer.fromJson(Map<String, dynamic> json) {
    return UserAnswer(
        message: (json['message']??"") as String,
        optionId: (json['option_id']??"") as int,
        answer: (json['answer']??"") as String,
        idSubMaterial: (json['id_sub_material']??"") as int,
        isCorrect: (json['is_correct']??"") as bool
    );
  }

}
