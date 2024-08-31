import 'package:media_pembelajaran/models/submateri_model.dart';

class Materi {
  int id;
  String name;
  List<Submateri> submateri;

  Materi({
    required this.id,
    required this.name,
    required this.submateri,
  });

  factory Materi.fromJson(Map<String, dynamic> json) {
    List<dynamic> submateriJson = (json['submateri']??"") as List;
    List<Submateri> submateri = submateriJson.map((subJson) => Submateri.fromJson(subJson)).toList();

    return Materi(
      id: (json['id']??"") as int,
      name: (json['name']??"") as String,
      submateri: submateri,
    );
  }

}