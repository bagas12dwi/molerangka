import 'package:media_pembelajaran/models/option_model.dart';

class Question {
  int id;
  int subMaterialId;
  String questionText;
  List<Option> option;

  Question({
    required this.id,
    required this.subMaterialId,
    required this.questionText,
    required this.option,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<dynamic> optionJson = (json['option']??"") as List;
    List<Option> option = optionJson.map((subJson) => Option.fromJson(subJson)).toList();

    return Question(
      id: (json['id']??"") as int,
      subMaterialId: (json['sub_material_id']??"") as int,
      questionText: (json['question_text']) as String,
      option: option,
    );
  }

}