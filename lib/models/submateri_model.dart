class Submateri {
  int id;
  String name;
  String description;
  String imgPath;
  String caption;
  int materialId;
  int isDone;

  Submateri({
    required this.id,
    required this.name,
    required this.description,
    required this.imgPath,
    required this.materialId,
    required this.isDone,
    required this.caption
  });

  factory Submateri.fromJson(Map<String, dynamic> json) {
    return Submateri(
      id: (json['id']??"") as int,
      name: (json['name']??"") as String,
        description: (json['description'] ?? '') as String,
      imgPath: (json['img_path']??"") as String,
      materialId: (json['material_id']??"") as int,
      isDone: (json['is_done']??0) as int,
      caption: (json['caption']??'') as String
    );
  }

}