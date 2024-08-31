class AchievementSubmateri {
  String name;
  int id;
  int subMaterialId;
  int userId;
  int score;

  AchievementSubmateri({
    required this.name,
    required this.id,
    required this.subMaterialId,
    required this.userId,
    required this.score
  });

  factory AchievementSubmateri.fromJson(Map<String, dynamic> json) {
    return AchievementSubmateri(
        id: (json['id']??"") as int,
        name: (json['name']??"") as String,
        subMaterialId: (json['sub_material_id']??"") as int,
        userId: (json['user_id']??"") as int,
        score: (json['score']??"") as int
    );
  }
}
