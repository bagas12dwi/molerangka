import 'package:media_pembelajaran/models/overall_option_model.dart';

class OverallQuiz {
  int id;
  String questionText;
  List<OverallOption> option;

  OverallQuiz({
    required this.id,
    required this.questionText,
    required this.option,
  });

  factory OverallQuiz.fromJson(Map<String, dynamic> json) {
    List<dynamic> optionJson = (json['option']??"") as List;
    List<OverallOption> option = optionJson.map((subJson) => OverallOption.fromJson(subJson)).toList();

    return OverallQuiz(
      id: (json['id']??"") as int,
      questionText: (json['question_text']) as String,
      option: option,
    );
  }

}